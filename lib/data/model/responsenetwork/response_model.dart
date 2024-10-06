class ResponseModel {
  int? _statusCode;
  String? _message;
  String? _error;
  dynamic _body;

  ResponseModel(
      {int? statusCode, String? message, String? error, dynamic body}) {
    if (statusCode != null) {
      _statusCode = statusCode;
    }
    if (message != null) {
      _message = message;
    }
    if (error != null) {
      _error = error;
    }
    if (body != null) {
      _body = body;
    }
  }

  int? get statusCode => _statusCode;
  String? get message => _message;
  String? get error => _error;
  dynamic get body => _body;

  ResponseModel.fromJson(Map<String, dynamic> json) {
    _statusCode = json['statusCode'];
    _message = json['message'];
    _error = json['error'];
    _body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = _statusCode;
    data['message'] = _message;
    data['error'] = _error;
    data['body'] = _body;
    return data;
  }
}
