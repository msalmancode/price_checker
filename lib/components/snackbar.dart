import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:price_checker/utils/colors.dart';

showSnackBar(String title, String message, {bool isError = false}) {
  Get.snackbar(
    title,
    message,
    snackStyle: SnackStyle.FLOATING,
    duration: const Duration(seconds: 2),
    snackPosition: SnackPosition.BOTTOM,
    backgroundGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: isError
          ? [
              const Color(0xFFFF0000),
              const Color(0x80FF0000),
              const Color(0xFFFF0000)
            ]
          : [
              const Color(0xFF4CAF50),
              const Color(0x804CAF50),
              const Color(0xFF4CAF50)
            ],
    ),
    barBlur: 100.0,
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    colorText: kBlack,
  );
}
