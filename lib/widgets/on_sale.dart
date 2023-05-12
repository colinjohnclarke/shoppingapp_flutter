import 'package:flutter/material.dart';
import 'package:flutter_essentials/widgets/text_widget.dart';
import "package:flutter_essentials/widgets/price_widgets.dart";

class OnSaleWidget extends StatefulWidget {
  const OnSaleWidget({Key? key}) : super(key: key);

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Material(
        color: Colors.lightBlueAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: NetworkImage(
                          "https://m.media-amazon.com/images/I/617wX0xcc+L._AC_.jpg"),
                      height: 100,
                      width: 100,
                    ),
                    Column(
                      children: [
                        TextWidget(
                          text: '1kg',
                          color: Colors.red,
                          textSize: 20,
                          isTitle: true,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                print('shopping bag pressed');
                              },
                              child: Icon(
                                Icons.shopping_bag_outlined,
                                size: 22,
                                color: Colors.black38,
                              ),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            GestureDetector(
                              onTap: () {
                                print('heart pressed');
                              },
                              child: Icon(
                                Icons.heart_broken_outlined,
                                size: 22,
                                color: Colors.black38,
                              ),
                            )
                          ],
                        ),

                      ],
                    )
                  ],
                ),
                PriceWidget(),
                SizedBox(height: 5,),
                TextWidget(text: "product title", color: Colors.black26, textSize: 16, isTitle: true,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
