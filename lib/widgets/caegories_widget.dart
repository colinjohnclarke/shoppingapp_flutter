import 'package:flutter/material.dart';
import 'package:flutter_essentials/widgets/text_widget.dart';

class CategoriesWidget extends StatelessWidget {
   CategoriesWidget(
      {Key? key,
      required this.color,
      required this.catText,
      required this.imgPath})
      : super(key: key);

  String catText, imgPath;
  final Color color;

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        print(catText);
      },
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: color.withOpacity(0.7),
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Container(

              width: _screenWidth * 0.3,
              height: _screenWidth * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imgPath),
                      fit: BoxFit.fill,
                  )),
            ),
            TextWidget(
              text: catText,
              color: Colors.black,
              textSize: 20,
              isTitle: true,
            )
          ],
        ),
      ),
    );
  }
}
