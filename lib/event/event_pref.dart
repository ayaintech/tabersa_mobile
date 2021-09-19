
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabersa_mobile/model/user.dart';

class EventPref{
  static Future<User?> getUser() async {
    User? user;
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? stringUser = pref.getString('user');
    if (stringUser != null) {
      Map<String, dynamic> mapUser = jsonDecode(stringUser);
      user = User.fromJson(mapUser);
    }
    return user;
  }

  static Future<void> saveUser(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String stringUser = jsonEncode(user.toJson());
    await pref.setString('user', stringUser);
  }
}