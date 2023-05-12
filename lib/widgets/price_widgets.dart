import 'package:flutter/material.dart';
import 'package:flutter_essentials/widgets/text_widget.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FittedBox(
          child: Row(
        children: [
          TextWidget(text: '1.54\£', color: Colors.black, textSize: 22),
          const SizedBox(
            width: 5,
          ),
          const Text(
            '2.54\£',
            style: TextStyle(
                fontSize: 15,
                decoration: TextDecoration.lineThrough,
                color: Colors.red),
          )
        ],
      ),
      );
  }
}
