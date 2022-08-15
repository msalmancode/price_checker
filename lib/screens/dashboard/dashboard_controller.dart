import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:price_checker/components/snackbar.dart';
import 'package:price_checker/model/edit_price_response.dart';
import 'package:price_checker/model/get_price_response.dart';
import 'package:price_checker/remote/api_auth.dart';
import 'package:price_checker/remote/api_function.dart';

class DashboardController extends GetxController {
  final barcodeController = TextEditingController();
  APIFunction apiFunction = ApiAuth();

  var isCameraOption = false;
  var isLoading = false.obs;

  var getPrice = GetPrice().obs;

  Future<void> getPriceCall() async {
    try {
      getPrice.value = GetPrice();
      isLoading(true);
      GetPriceResponse response =
          await apiFunction.getPriceApi(barcodeController.value.text);
      isLoading(false);
      barcodeController.clear();
      if (response.status == 200) {
        getPrice.value = response.data ?? GetPrice();
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

  void updatePrice() {
    double wasPrice = getPrice.value.wasPrice ?? 0;
    int discountPrice = getPrice.value.discount ?? 0;
    final now = wasPrice - (discountPrice / 100) * wasPrice;
    getPrice.value.nowPrice = now;
  }

  Future<void> editPrice() async {
    try {
      isLoading(true);
      EditPriceResponse response = await apiFunction.editPriceApi(
        getPrice.value.id ?? 0,
        getPrice.value.discount ?? 0,
      );
      isLoading(false);
      if (response.status == 200) {
        showSnackBar('Success', response.responseMsg.toString());
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
