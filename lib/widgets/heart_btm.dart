import 'package:flutter/material.dart';

class HeartBtn extends StatefulWidget {
  const HeartBtn({Key? key}) : super(key: key);

  @override
  State<HeartBtn> createState() => _HeartBtnState();
}

class _HeartBtnState extends State<HeartBtn> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        print('heart pressed');
      },
      child: Icon(
        Icons.heart_broken_outlined,
        size: 22,
        color: Colors.black38,
      ),
    );
  }
}

