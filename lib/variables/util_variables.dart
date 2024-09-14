import 'package:flutter/material.dart';


double height = 1, width = 1, arithmetic = 1; //size variables

extension ExtSize on num {
  double get h {
    return this * height;
  }

  double get w {
    return this * width;
  }

  double get o {
    return this * arithmetic;
  }
}

Widget sizeHor(double width) {
  return SizedBox(width: width);
}

Widget sizeVer(double height) {
  return SizedBox(height: height,);
}


class PrefKeys {
  static const String token = 'token';


}
