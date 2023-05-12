import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_essentials/widgets/text_widget.dart';
import '../widgets/on_sale.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<String> _offerImages = [
    'assets/images/offres/Offer1.jpg',
    'assets/images/offres/Offer2.jpg',
    'assets/images/offres/Offer3.jpg',
    'assets/images/offres/Offer4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: Swiper(
              itemBuilder: (BuildContext, int index) {
                return Image.asset(
                  _offerImages[index],
                  fit: BoxFit.fill,
                );
              },
              autoplay: true,
              itemCount: _offerImages.length,
              pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.white,
                    activeColor: Colors.red,
                  )),
              control: SwiperControl(color: Colors.blueGrey),
            ),
          ),
          TextButton(
              onPressed: () {},
              child: TextWidget(
                text: "View All",
                color: Colors.blue,
                textSize: 20,
              )),
          Row(
            children: [
              RotatedBox(
                quarterTurns: 3,
                child: Row(children: [
                  TextWidget(text: 'On Sale', color: Colors.red, textSize: 22),
                  Icon(Icons.discount, color: Colors.blue,)
                  

                ],),
              ),
              Flexible(
                child: SizedBox(
                  height: 180,
                  child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return OnSaleWidget();
                      }),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
