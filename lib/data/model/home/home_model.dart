class HomeModel {
  List<LoginResponse>? loginResponse;

  HomeModel({this.loginResponse});

  // Named constructor to create a HomeModel from a JSON map
  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json['login_response'] != null) {
      loginResponse = <LoginResponse>[];
      json['login_response'].forEach((v) {
        loginResponse!.add(LoginResponse.fromJson(v));
      });
    }
  }

  // Convert the instance to a JSON map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.loginResponse != null) {
      data['login_response'] = this.loginResponse!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LoginResponse {
  String? id;
  String? deptName;

  LoginResponse({this.id, this.deptName});

  // Named constructor to create a LoginResponse from a JSON map
  LoginResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deptName = json['dept_name'];
  }

  // Convert the instance to a JSON map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['dept_name'] = this.deptName;
    return data;
  }
}
