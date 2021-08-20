import 'package:shared_preferences/shared_preferences.dart';

class SharedData {
  Future<void> setLoginData(String token, String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    prefs.setString('username', username);
  }

  Future<dynamic> getLoginData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final username = prefs.getString('username');
    return {'token': token, 'username': username};
  }

  Future<String> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username');
    if (username != null) {
      return username;
    } else {
      return 'Username';
    }
  }
}
