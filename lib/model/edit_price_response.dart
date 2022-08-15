/// Status : 200
/// ResponseMsg : "Data saved successfully"
/// Data : 1
/// Token : ""

class EditPriceResponse {
  EditPriceResponse({
      int? status, 
      String? responseMsg, 
      int? data, 
      String? token,}){
    _status = status;
    _responseMsg = responseMsg;
    _data = data;
    _token = token;
}

  EditPriceResponse.fromJson(dynamic json) {
    _status = json['Status'];
    _responseMsg = json['ResponseMsg'];
    _data = json['Data'];
    _token = json['Token'];
  }
  int? _status;
  String? _responseMsg;
  int? _data;
  String? _token;
EditPriceResponse copyWith({  int? status,
  String? responseMsg,
  int? data,
  String? token,
}) => EditPriceResponse(  status: status ?? _status,
  responseMsg: responseMsg ?? _responseMsg,
  data: data ?? _data,
  token: token ?? _token,
);
  int? get status => _status;
  String? get responseMsg => _responseMsg;
  int? get data => _data;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = _status;
    map['ResponseMsg'] = _responseMsg;
    map['Data'] = _data;
    map['Token'] = _token;
    return map;
  }

}