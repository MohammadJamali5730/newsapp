import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/views/screen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/first',
      getPages: [GetPage(name: '/first', page: () => const Screen1())],
    );
  }
}
