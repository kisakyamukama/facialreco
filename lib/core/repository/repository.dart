import 'package:flutter_facial_recognition/config/constants.dart';
import 'package:http/http.dart' as http;

class Repository {
  static const uri = Constants.facialUrl;
  static const userDetailsUrl = Constants.userDetails;
  static final headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };

  static Future sendImage(var data) async {
    return http.post(Uri.parse(uri), body: data);
  }

  static Future getUserDetails(var data) async {
    return http.post(Uri.parse(userDetailsUrl), body: data, headers:headers);
  }
}
