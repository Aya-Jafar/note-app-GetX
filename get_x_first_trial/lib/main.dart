
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialRoute: 'First-rout/',
      debugShowCheckedModeBanner: false,
      title: 'Uni-coding',
      theme: ThemeData(
        primaryColor: const Color(0xff08df78)
      ),
      home: HomePage(),
    );
  }
}






