import 'dart:convert';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/server_config.dart';

class Api {
  static Future<Map<String, dynamic>> getTokens() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Map<String, dynamic> auth = jsonDecode(pref.getString('auth') ?? '');
    return auth;
  }

  static getData(String link) async {
    print(ServerConfig.BASE_URL + link);
    try {
      Map<String, dynamic> tokens = await getTokens();
      Response response = await get(
        Uri.parse(ServerConfig.BASE_URL + link),
        headers: {
          'content-type': 'application/json',
          'Authorization': 'Bearer ${tokens!['access_token']}',
        },
      );
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        print("ResponseStatus:: ${response.statusCode.toString()}");
        print(ServerConfig.BASE_URL + '/oauth2/token');
        Response res = await post(
            Uri.parse(ServerConfig.BASE_URL + '/oauth2/token'),
            headers: {
              'content-type': 'application/json',
              'Authorization': 'Bearer ${tokens['access_token']}',
            },
            body: jsonEncode({
              'firebase_token': '',
              'refresh_token': tokens['refresh_token']
            }));
        if (res.statusCode == 200) {
          var body = jsonDecode(res.body);
          Map<String, dynamic> auth = {
            'firebaseToken': '',
            'refresh_token': body['refresh_token'],
            'access_token': body['access_token'],
            'expires_in': body['expires_in'].toString(),
            'expires_at': body['expires_at'].toString()
          };
          SharedPreferences sp = await SharedPreferences.getInstance();
          sp.setString('auth', jsonEncode(auth));
          return getData(link);
        } else {
          print("ResponseStatus:: ${response.statusCode.toString()}");
          return null;
        }
      } else {
        print("ResponseStatus:: ${response.statusCode.toString()}");
        return null;
      }
    } on Exception catch (e) {
      print("GetException:: ${e.toString()}");
      return null;
    }
  }

  static postData(String link, Map<String, dynamic> data) async {
    try {
      Map<String, dynamic> tokens = await getTokens();
      Response response = await post(Uri.parse(ServerConfig.LOGIN),
          headers: {
            'content-type': 'application/json',
            'Authorization': 'Bearer ${tokens['access_token']}',
          },
          body: jsonEncode(data));
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        print("ResponseStatus:: ${response.statusCode.toString()}");
        print(ServerConfig.BASE_URL + '/oauth2/token');
        Response res = await post(
            Uri.parse(ServerConfig.BASE_URL + '/oauth2/token'),
            headers: {
              'content-type': 'application/json',
              'Authorization': 'Bearer ${tokens['access_token']}',
            },
            body: jsonEncode({
              'firebase_token': '',
              'refresh_token': tokens['refresh_token']
            }));
        if (res.statusCode == 200) {
          var body = jsonDecode(res.body);
          Map<String, dynamic> auth = {
            'firebaseToken': '',
            'refresh_token': body['refresh_token'],
            'access_token': body['access_token'],
            'expires_in': body['expires_in'].toString(),
            'expires_at': body['expires_at'].toString()
          };
          SharedPreferences sp = await SharedPreferences.getInstance();
          sp.setString('auth', jsonEncode(auth));
          return postData(link, data);
        } else {
          print("ResponseStatus:: ${response.statusCode.toString()}");
          return null;
        }
      } else {
        print("ResponseStatus:: ${response.statusCode.toString()}");
        return null;
      }
    } on Exception catch (e) {
      print("PostException:: ${e.toString()}");
      return null;
    }
  }
}
