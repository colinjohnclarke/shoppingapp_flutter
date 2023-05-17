import 'package:flutter/material.dart';
import 'package:flutter_essentials/inner_screens/all_products.dart';
import 'package:flutter_essentials/screens/btm_bar.dart';


import 'package:flutter_essentials/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'inner_screens/on_sale_screen.dart';

import 'inner_screens/all_products.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // bool _isDark = false;

    return MaterialApp(
      debugShowCheckedModeBanner: false, // removed debug banner
      title: 'Flutter Demo',
      home: BottomBarScreen() ,
      routes: {
        OnSaleScreen.routeName : (context) => const OnSaleScreen(),
        AllProductsScreen.routeName: (context) => const AllProductsScreen()
      },

    );
  }
}
