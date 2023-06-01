import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rendom_user/Screen/Model/user_model.dart';
class Apihelper
{
  static Apihelper apihelper = Apihelper();

  Future<UserModel> ApiData()
  async {
    String? link = 'https://randomuser.me/api/';
    var response = await http.get(Uri.parse(link));
    var json= jsonDecode(response.body);
    UserModel userModel = UserModel.fromJson(json);
    // print(json);

    return userModel;
  }
}