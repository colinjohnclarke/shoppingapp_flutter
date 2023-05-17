import 'package:flutter/material.dart';
import 'package:flutter_essentials/widgets/on_sale.dart';
import 'package:flutter_essentials/widgets/text_widget.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = "/OnSaleScreen";

  const OnSaleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios),
            ),
        elevation: 0,
          title: TextWidget(
            text: 'Products on Sale', color: Colors.white,  textSize: 20 , isTitle: true ,
          ),
        ),
        body: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1.2,
            padding: EdgeInsets.zero,
            children: List.generate(16, (index) {
              return const OnSaleWidget();
            })));
  }
}
