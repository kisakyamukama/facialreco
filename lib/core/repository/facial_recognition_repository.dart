import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facial_recognition/core/model/model.dart';
import 'dart:convert';

import 'package:flutter_facial_recognition/core/repository/repository.dart';
import 'package:http/http.dart';

class FacialRecognitionRepository {
  static Future postImage(XFile file) async {
    int userEmployeeID = 0;
    try {
      debugPrint(file.path);
      final bytes = File(file.path).readAsBytesSync();
      String img64 = base64Encode(bytes);

      // debugPrint(img64);
      String encodedImage = 'data:image/jpeg;base64,' + img64;
      debugPrint(encodedImage);
      var body = jsonEncode({'data': encodedImage});
      Response response = await Repository.sendImage(body);
      debugPrint(response.statusCode.toString());
      debugPrint(response.body);
      if (response.statusCode == 200) {
        debugPrint(response.body);
        userEmployeeID = int.parse(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e.toString());
    }

    return userEmployeeID;
  }

  static getUserDetails(int employeeID) async {
    UserDetails user;
    try {
      var body = jsonEncode({'employee_id': employeeID});

      Response response = await Repository.getUserDetails(body);
      debugPrint(response.statusCode.toString());
      debugPrint(response.body);
      if (response.statusCode == 200) {
        debugPrint(response.body);
        user = UserDetails.fromJson(jsonDecode(response.body));
        return user;
      } else {
        return;
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e.toString());
    }
  }
}
