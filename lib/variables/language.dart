import 'package:flutter_translate/flutter_translate.dart';

extension ExtStr on String {

  String get tr {
    return translate(this);
  }
}

// ALL APP LANGUAGE TRANSLATE
String checkInternet = "check_internet";