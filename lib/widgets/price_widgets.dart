import 'package:flutter/material.dart';
import 'package:flutter_essentials/widgets/text_widget.dart';

class PriceWidget extends StatelessWidget {
  PriceWidget(
      {Key? key,
      required this.salePrice,
      required this.price,
      required this.textPrice,
      required this.isOnSale})
      : super(key: key);

  double salePrice, price;
  String textPrice;
  bool isOnSale;

  @override
  Widget build(BuildContext context) {
    double userPrice = isOnSale ? salePrice : price;

    return FittedBox(
      child: Row(
        children: [
          SizedBox(width: 5),
          TextWidget(
            text: '\$${(userPrice * int.parse(textPrice)).toStringAsFixed(2)}',
            textSize: 15,
            color: Colors.black,
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Visibility(
                visible: isOnSale ? true : false,
                child: Text(
                  '\$${(price * int.parse(textPrice)).toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.red,
                    decoration: TextDecoration.lineThrough
                  ),
                )),
          )
        ],
      ),
    );
  }
}
