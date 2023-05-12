import 'package:flutter/material.dart';
import 'package:flutter_essentials/screens/cart.dart';
import 'package:flutter_essentials/screens/categories.dart';
import 'package:flutter_essentials/screens/home_screen.dart';
import 'package:flutter_essentials/screens/user.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {


  int _selectedIndex = 1;

   static List <Map<String, dynamic>>  _pages = [
    {'page':  HomeScreen(), 'title': 'Home Screen'  },
    {'page': CategoriesScreen() , 'title': 'Categories Screen'  },
    {'page':  CartScreen(), 'title': 'Cart Screen'  },
    {'page':  UserScreen(), 'title': 'User Screen'  },

  ];

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(_pages[_selectedIndex]["title"]),
      // ),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        onTap: _selectedPage,
        selectedItemColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 0 ?  Icons.home_filled : Icons.home_outlined ),
            label: "Home",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon( _selectedIndex == 1 ? Icons.category_sharp :  Icons.category_outlined),
            label: "Categories",
            backgroundColor: Colors.lightBlue,
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 2 ?Icons.shopping_cart_rounded : Icons.shopping_cart_outlined),
            label: "Cart",
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex != 3 ? Icons.verified_user_outlined : Icons.verified_user_rounded),
            label: "Cart",
            backgroundColor: Colors.blueGrey ,
          ),
        ],
      ),
    );
  }
}
