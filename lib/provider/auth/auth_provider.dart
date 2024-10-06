import 'package:flutter/material.dart';
import 'package:logintest/data/model/home/home_model.dart';
import 'package:logintest/data/model/responsenetwork/response_model.dart';
import 'package:logintest/utilities/common_methods.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/repo/authrepo/auth_repo.dart';
import '../../presentation/screens/home/home_screen.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepo _authRepo = AuthRepo();
  List<LoginResponse> dataList = [];

  bool isLoginLoading = false;

  //login method
  Future<void> login(String email, String password, context) async {
    _loginLoader(true);
    ResponseModel? response = await _authRepo.login(email, password);
    print(email);
    print(password);
    if (response == null) {
      showSimpleSnackbar(
        'Error Ocurred!!',
      );
    } else {
      if (response.body['code'] != 200) {
        showSimpleSnackbar(response.body['message'].toString(),
            clearPrevious: true);
      } else {
        _saveDataLocally(accessToken: response.body['token'].toString());
        HomeModel homeModel = HomeModel.fromJson(response.body);
        dataList = homeModel.loginResponse!;
        finishAffinity(context, const HomeScreen());
      }
    }
    notifyListeners();
    _loginLoader(false);
  }

  // Loader: Login Loader
  _loginLoader(bool val) {
    isLoginLoading = val;
    notifyListeners();
  }

  // Private Method: Save Data Locally
  Future<void> _saveDataLocally({
    String? accessToken,
  }) async {
    if (accessToken != null) {
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString('token', accessToken);
      notifyListeners();
    }
  }
}
