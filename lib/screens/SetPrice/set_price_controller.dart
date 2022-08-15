import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:price_checker/components/snackbar.dart';
import 'package:price_checker/model/edit_price_response.dart';
import 'package:price_checker/remote/api_auth.dart';
import 'package:price_checker/remote/api_function.dart';

class SetPriceController extends GetxController {
  final barcodeController = TextEditingController();
  APIFunction apiFunction = ApiAuth();

  var isCameraOption = false;
  var isLoading = false.obs;

  int discount = 10;

  Future<void> newPriceCall() async {
    try {
      isLoading(true);
      EditPriceResponse response = await apiFunction.newPriceApi(
        barcodeController.value.text,
        discount,
      );

      isLoading(false);
      barcodeController.clear();
      if (response.status == 200) {
      } else {
        showErrorMessage(response.responseMsg.toString());
        if (kDebugMode) {
          print('Error -> ${response.responseMsg}');
        }
      }
    } catch (e) {
      isLoading(false);
      if (kDebugMode) {
        print('Error -> $e');
      }
    }
  }

  showErrorMessage(String response) {
    String errorMessage = 'Data not found';
    switch (response) {
      case 'Network Error':
        errorMessage = 'No Internet Connection';
        break;
    }
    showSnackBar("Failed", errorMessage, isError: true);
  }
}
