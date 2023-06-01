import 'package:flutter/material.dart';
import 'package:rendom_user/Screen/Model/user_model.dart';
import 'package:rendom_user/utils/Api_helper.dart';

class UserProvider extends ChangeNotifier {
  UserModel? data;

  void getData() async {
    data = await Apihelper.apihelper.ApiData();
    notifyListeners();
  }

  Refresh(index) {
    data = index;
    notifyListeners();
  }
}
