import 'package:price_checker/model/edit_price_response.dart';
import 'package:price_checker/model/get_price_response.dart';

abstract class APIFunction {
  Future<GetPriceResponse> getPriceApi(String barcode);
  Future<EditPriceResponse> editPriceApi(int id, int discount);

  Future<EditPriceResponse> newPriceApi(String barcode, int discount);
}
