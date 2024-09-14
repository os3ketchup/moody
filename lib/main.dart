import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:moody/screens/home.dart';
import 'package:moody/variables/util_variables.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ru', null);
  runApp(const MoodApp());
}

class MoodApp extends StatelessWidget {
  const MoodApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      builder: (context, child) {
        height = MediaQuery.of(context).size.height / 600;
        width = MediaQuery.of(context).size.width / 600;
        arithmetic = (height + width) / 2;
        //FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
        return MediaQuery(
          data: MediaQuery.of(context),
          child: child!,
        );
      },
    );
  }
}


