import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:price_checker/model/edit_price_response.dart';
import 'package:price_checker/model/get_price_response.dart';

import 'api_function.dart';

class ApiAuth extends APIFunction {
  static const String BASE_URL =
      "http://193.117.201.74:9408/onlinewarehouseapi/api/";
  static const String GET_PRICE_URL = "${BASE_URL}UtilitiesApi/GetPrice/";
  static const String EDIT_PRICE_URL = "${BASE_URL}UtilitiesApi/EditPrice";
  static const String NEW_PRICE_URL = "${BASE_URL}UtilitiesApi/NewPrice";

  // Checking Internet Connection
  Future<bool> connectionCheck() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<GetPriceResponse> getPriceApi(String barcode) async {
    try {
      final isInternet = await connectionCheck();
      if (isInternet) {
        final response = await http.post(Uri.parse(GET_PRICE_URL + barcode),
            headers: {
              "content-type": "application/json"
            }).timeout(const Duration(seconds: 60));
        if (response.statusCode == 200) {
          return GetPriceResponse.fromJson(jsonDecode(response.body));
        } else {
          return GetPriceResponse(
              status: 404,
              responseMsg:
                  'Exception Error Status code : ${response.statusCode}');
        }
      } else {
        return GetPriceResponse(status: 404, responseMsg: 'Network Error');
      }
    } catch (e) {
      return GetPriceResponse(status: 404, responseMsg: 'Exception Error');
    }
  }

  @override
  Future<EditPriceResponse> editPriceApi(int id, int discount) async {
    try {
      final isInternet = await connectionCheck();
      if (isInternet) {
        final response = await http
            .post(
              Uri.parse(EDIT_PRICE_URL),
              headers: {"content-type": "application/json"},
              body: jsonEncode({"Id": id, "Discount": discount}),
            )
            .timeout(
              const Duration(seconds: 60),
            );
        if (response.statusCode == 200) {
          return EditPriceResponse.fromJson(jsonDecode(response.body));
        } else {
          return EditPriceResponse(
              status: 404,
              responseMsg:
                  'Exception Error Status code : ${response.statusCode}');
        }
      } else {
        return EditPriceResponse(status: 404, responseMsg: 'Network Error');
      }
    } catch (e) {
      return EditPriceResponse(status: 404, responseMsg: 'Exception Error');
    }
  }

  @override
  Future<EditPriceResponse> newPriceApi(String barcode, int discount) async {
    try {
      final isInternet = await connectionCheck();
      if (isInternet) {
        final response = await http
            .post(
              Uri.parse(NEW_PRICE_URL),
              headers: {"content-type": "application/json"},
              body: jsonEncode({"Barcode": barcode, "Discount": discount}),
            )
            .timeout(
              const Duration(seconds: 60),
            );
        if (response.statusCode == 200) {
          return EditPriceResponse.fromJson(jsonDecode(response.body));
        } else {
          return EditPriceResponse(
              status: 404,
              responseMsg:
                  'Exception Error Status code : ${response.statusCode}');
        }
      } else {
        return EditPriceResponse(status: 404, responseMsg: 'Network Error');
      }
    } catch (e) {
      return EditPriceResponse(status: 404, responseMsg: 'Exception Error');
    }
  }
}
