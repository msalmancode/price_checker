/// Status : 200
/// ResponseMsg : "Data fetched successfully"
/// Data : {"Id":3,"Barcode":"000145","AltBarcode":"1547","WasPrice":50.10,"NowPrice":25.00,"Discount":50,"CreatedOn":"2022-08-02T13:33:10"}
/// Token : ""

class GetPriceResponse {
  GetPriceResponse({
    int? status,
    String? responseMsg,
    GetPrice? data,
    String? token,
  }) {
    _status = status;
    _responseMsg = responseMsg;
    _data = data;
    _token = token;
  }

  GetPriceResponse.fromJson(dynamic json) {
    _status = json['Status'];
    _responseMsg = json['ResponseMsg'];
    _data = json['Data'] != null ? GetPrice.fromJson(json['Data']) : null;
    _token = json['Token'];
  }
  int? _status;
  String? _responseMsg;
  GetPrice? _data;
  String? _token;
  GetPriceResponse copyWith({
    int? status,
    String? responseMsg,
    GetPrice? data,
    String? token,
  }) =>
      GetPriceResponse(
        status: status ?? _status,
        responseMsg: responseMsg ?? _responseMsg,
        data: data ?? _data,
        token: token ?? _token,
      );
  int? get status => _status;
  String? get responseMsg => _responseMsg;
  GetPrice? get data => _data;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = _status;
    map['ResponseMsg'] = _responseMsg;
    if (_data != null) {
      map['Data'] = _data?.toJson();
    }
    map['Token'] = _token;
    return map;
  }
}

/// Id : 3
/// Barcode : "000145"
/// AltBarcode : "1547"
/// WasPrice : 50.10
/// NowPrice : 25.00
/// Discount : 50
/// CreatedOn : "2022-08-02T13:33:10"

class GetPrice {
  GetPrice({
    int? id,
    String? barcode,
    String? altBarcode,
    double? wasPrice,
    double? nowPrice,
    int? discount,
    String? createdOn,
  }) {
    _id = id;
    _barcode = barcode;
    _altBarcode = altBarcode;
    wasPrice = wasPrice;
    nowPrice = nowPrice;
    discount = discount;
    _createdOn = createdOn;
  }

  GetPrice.fromJson(dynamic json) {
    _id = json['Id'];
    _barcode = json['Barcode'];
    _altBarcode = json['AltBarcode'];
    wasPrice = json['WasPrice'];
    nowPrice = json['NowPrice'];
    discount = json['Discount'];
    _createdOn = json['CreatedOn'];
  }
  int? _id;
  String? _barcode;
  String? _altBarcode;
  double? wasPrice;
  double? nowPrice;
  int? discount;
  String? _createdOn;

  int? get id => _id;
  String? get barcode => _barcode;
  String? get altBarcode => _altBarcode;
  // double? get wasPrice => _wasPrice;
  // double? get nowPrice => _nowPrice;
  // int? get discount => _discount;
  String? get createdOn => _createdOn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['Barcode'] = _barcode;
    map['AltBarcode'] = _altBarcode;
    map['WasPrice'] = wasPrice;
    map['NowPrice'] = nowPrice;
    map['Discount'] = discount;
    map['CreatedOn'] = _createdOn;
    return map;
  }
}
