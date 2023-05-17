import 'package:flutter/material.dart';

import 'cart_widget.dart';



class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView.builder(itemCount: 10, itemBuilder: (context, index) {
        return const CartWidget();
      },
      ),

    );
  }
}
