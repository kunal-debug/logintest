import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logintest/data/model/responsenetwork/response_model.dart';
import 'package:logintest/data/repo/menuitemrepo/menuitem_repo.dart';

import '../../data/model/menuitem/menuitem_model.dart';
import '../../presentation/screens/menuscreen/menuscreen.dart';
import '../../utilities/common_methods.dart';

class MenuitemProvider extends ChangeNotifier {
  List<MenuItem> menuItems = [];
  final MenuitemRepo _repo = MenuitemRepo();

  passId(id, context) async {
    if (id != null) {
      redirect2page(context, MenuScreen(id));
    }
  }

  Future getMenuList(id) async {
    ResponseModel? response = await _repo.getMenuList(id);
    if (response == null) {
      showSimpleSnackbar(
        'Error Ocurred!!',
      );
    } else {
      menuItems = parseMenuItems(response.body);
      print(menuItems[0].menuId);
    }
    notifyListeners();
  }

  List<MenuItem> parseMenuItems(jsonResponse) {
    return (jsonResponse['response'] as List)
        .map((item) => MenuItem.fromJson(item))
        .toList();
  }
}
