import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_essentials/inner_screens/on_sale_screen.dart';
import 'package:flutter_essentials/widgets/feed_items.dart';
import 'package:flutter_essentials/widgets/text_widget.dart';
import '../inner_screens/all_products.dart';
import '../widgets/on_sale.dart';
import '../services/global_methods.dart';

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

    // GlobalMethods globalMethods = GlobalMethods();

    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                onPressed: () {
                  GlobalMethods.navigateTo(context: context, routeName: OnSaleScreen.routeName);

                },
                child: TextWidget(
                  text: "View All",
                  color: Colors.blue,
                  textSize: 20,
                )),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: 3,
                  child: Row(
                    children: [
                      TextWidget(
                          text: 'On Sale', color: Colors.red, textSize: 22),
                      Icon(
                        Icons.discount,
                        color: Colors.blue,
                      )
                    ],
                  ),
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
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  TextWidget(text: "Our products", color: Colors.black, textSize: 20),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      GlobalMethods.navigateTo(context: context, routeName: AllProductsScreen.routeName);
                    },
                    child: TextWidget(
                      text: "Browse All",
                      color: Colors.blue,
                      textSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            GridView.count(crossAxisCount: 2, childAspectRatio: 1/1.2,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisSpacing: 10,
            children:  List.generate(4 , (index) {
              return FeedsWidget();
            })
            )
          ],
        ),
      ),
    );
  }
}

// "this is the main branch"
