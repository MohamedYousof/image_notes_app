import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_notes/controller/helpers/shared_prefs.dart';

class Api {
  static const baseUrl = 'http://46.101.5.12:8000';
  SharedData _sharedData = SharedData();

  Future<bool> login(String username, String password) async {
    final url = '$baseUrl/api-token-auth/';
    final loginData = {'username': username, 'password': password};
    final resp = await http.post(Uri.parse(url), body: loginData);
    if (resp.statusCode == 200) {
      final data = jsonDecode(resp.body) as Map<String, dynamic>;
      _sharedData.setLoginData(data['token'], username);
      return true;
    } else {
      return false;
    }
  }

  Future<dynamic> getData(String endPoint) async {
    endPoint = endPoint.replaceAll('$baseUrl/', '');

    final url = '$baseUrl/$endPoint';
    final data = await _sharedData.getLoginData();
    final token = data['token'];
    final headers = {"Authorization": "Token $token"};

    final resp = await http.get(Uri.parse(url), headers: headers);

    // if successfully got the data
    if (resp.statusCode == 200) {
      return json.decode(utf8.decode(resp.bodyBytes));
    } else {
      return [
        {'error': resp.statusCode}
      ];
    }
  }
}
