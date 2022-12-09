import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHight;
  static late double defultSize;
  static late Orientation? orientation;
  void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHight = MediaQuery.of(context).size.height;
    orientation = MediaQuery.of(context).orientation;
    defultSize = orientation == Orientation.landscape
        ? screenHight * .024
        : screenWidth * .024;

    print("this is the default Size $defultSize");
  }
}
