import 'package:flutter/material.dart';
import 'package:moody/variables/util_variables.dart';

_ThemeApp? _appTheme;

_ThemeApp get theme {
  _appTheme ??= _ThemeApp();
  return _appTheme!;
}

class _ThemeApp {
  /// Color primaryColor = const Color(0xff3675D4);
  Color orange = const Color(0xffFF8702);
  Color black = const Color(0xffFF8702);
  Color grey1 = const Color(0xffF2F2F2);
  Color grey2 = const Color(0xffBCBCBF);
  Color grey3 = const Color(0xffFF8702);




  TextStyle primaryTextStyle =  TextStyle(
    fontFamily: 'Nunito',
        color: const Color(0xff4C4C69),
        fontWeight: FontWeight.w400,
        fontSize: 18.o,
        overflow: TextOverflow.ellipsis,
      );

}
