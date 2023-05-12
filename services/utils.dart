import 'package:flutter/cupertino.dart';

class Utils {

  BuildContext context;

  Utils(this.context);
  
  Size get getscreenSize  => MediaQuery.of(context).size;
}