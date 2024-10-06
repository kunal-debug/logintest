import 'package:logintest/data/network/network.dart';

import '../../../utilities/common_methods.dart';
import '../../api/api.dart';
import '../../model/responsenetwork/response_model.dart';

class MenuitemRepo {
  Network network = Network();

  Future getMenuList(id) async {
    String baseUrl = ApiEndPoints().isBaseUrl;
    String loginEndpoint = ApiEndPoints().getListUrl;
    var url = "$baseUrl/$loginEndpoint";
    final map = <String, dynamic>{};
    map['id'] = id;
    ResponseModel? response =
        await network.postMethodWithToken(api: url, body: map);
    if (response == null) {
      showSimpleSnackbar("Error occurred");
      return;
    } else {
      return response;
    }
  }
}
