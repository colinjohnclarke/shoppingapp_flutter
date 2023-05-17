import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/services.dart';
import 'package:flutter_essentials/widgets/heart_btm.dart';
import 'package:flutter_essentials/widgets/price_widgets.dart';
import 'package:flutter_essentials/widgets/text_widget.dart';

class FeedsWidget extends StatefulWidget {
  const FeedsWidget({Key? key}) : super(key: key);

  @override
  State<FeedsWidget> createState() => _FeedsWidgetState();
}

class _FeedsWidgetState extends State<FeedsWidget> {
  final _quantityTextController = TextEditingController();

  @override
  void initState() {
    _quantityTextController.text = "1";

    super.initState();
  }

  @override
  void dispose() {
    _quantityTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Colors.blue[50],
        child: InkWell(
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Column(children: [
                FancyShimmerImage(
                    imageUrl:
                        "https://m.media-amazon.com/images/I/617wX0xcc+L._AC_.jpg",
                    height: 100,
                    width: 100,
                    boxFit: BoxFit.fill),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: "Title",
                        color: Colors.black,
                        textSize: 20,
                        isTitle: true,
                      ),
                      const HeartBtn(),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: PriceWidget(
                          isOnSale: true,
                          price: 5.9,
                          textPrice: _quantityTextController.text,
                          salePrice: 2.99,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        flex: 4,
                        child: Row(
                          children: [
                            FittedBox(
                              child: TextWidget(
                                  text: "kg",
                                  color: Colors.black54,
                                  textSize: 15),
                            ),
                            Flexible(
                              flex: 4,
                              child: TextFormField(
                                controller: _quantityTextController,
                                key: const ValueKey('10'),
                                style: const TextStyle(
                                    color: Colors.green, fontSize: 16),
                                maxLines: 1,
                                enabled: true,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9.]'))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.lightBlueAccent.withOpacity(0.2)),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ))),
                    child: TextWidget(
                      textSize: 15,
                      text: 'Add to cart',
                      color: Colors.black,
                    ),
                  ),
                ),
              ]),
            )),
      ),
    );
  }
}
