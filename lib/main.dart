import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:price_checker/screens/navigation_bar/custom_navigation_bar.dart';
import 'package:price_checker/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      home: const CustomerServiceScreen(),
    );
  }
}
