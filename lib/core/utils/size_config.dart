import 'package:flutter/widgets.dart';

class SizeConfig {
  static  dynamic screenwidth;
  static  dynamic screenheight;
  static  dynamic defaultsize;
  static  dynamic orientation;
  static  dynamic padding;
  void init(BuildContext context) {
    screenwidth = MediaQuery.of(context).size.width;
    screenheight = MediaQuery.of(context).size.height;

    orientation = MediaQuery.of(context).orientation;
    defaultsize = orientation == Orientation.landscape
        ? screenheight! * .024
        : screenwidth! * .024;
  }
}
