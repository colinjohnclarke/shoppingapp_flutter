import 'package:flutter/material.dart';
import 'package:flutter_essentials/widgets/feed_items.dart';
import 'package:flutter_essentials/widgets/text_widget.dart';

import '../widgets/on_sale.dart';

class AllProductsScreen extends StatefulWidget {
  static const routeName = "/AllProductsScreen";

  const AllProductsScreen({Key? key}) : super(key: key);

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  final TextEditingController _searchTextController = TextEditingController();
  final FocusNode _searchTextFocusNode = FocusNode();


  // @override
  // void dispose


  @override
  // void dispose() {
  //   _searchTextController.dispose();
  //       super.dispose();
  // }




  void dispose() {
    _searchTextController!.dispose();
    _searchTextFocusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        elevation: 0,
        title: TextWidget(
            textSize: 20,
            color: Colors.black,
            isTitle: true,
            text: 'All Products'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: kBottomNavigationBarHeight,
              child: TextField(
                focusNode: _searchTextFocusNode ,
                controller: _searchTextController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(color: Colors.greenAccent, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(color: Colors.greenAccent, width: 1),
                    ),
                    hintText: 'Whats in your mind?',
                    prefixIcon: Icon(Icons.search),
                    suffix: IconButton(
                      onPressed: () {
                        _searchTextController?.clear();
                        _searchTextFocusNode?.unfocus();
                      },
                      icon: Icon(Icons.close,
                          color: Colors.blue),
                    )),
              ),
            ),
          ),
          Flexible(
            child: GridView.count(
                crossAxisCount: 2,
                // scrollDirection: Axis.vertical,
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 1 / 1.2,
                padding: EdgeInsets.zero,
                children: List.generate(16, (index) {
                  return const FeedsWidget();
                })),
          )
        ],
      ),
    );
  }
}
