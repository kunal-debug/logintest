import 'package:logintest/data/api/api.dart';
import '../../../utilities/common_methods.dart';
import '../../model/responsenetwork/response_model.dart';
import '../../network/network.dart';

class AuthRepo {
  Network network = Network();

  Future login(String? email, String? password) async {
    String baseUrl = ApiEndPoints().isBaseUrl;
    String loginEndpoint = ApiEndPoints().loginUrl;
    var url = "$baseUrl/$loginEndpoint";
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    ResponseModel? response =
        await network.postMethod(api: url, body: map);
    if (response == null) {
      showSimpleSnackbar("Error occurred");
      return;
    } else {
      return response;
    }
  }
}
