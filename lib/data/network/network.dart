import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../model/responsenetwork/response_model.dart';

class Network {
  Future postMethod({
    api,
    body,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(api),
        body: body,
        headers: {
          "responseType": "ResponseType.plain",
        },
      );
      var responseBody = jsonDecode(response.body);
      if (response.statusCode == 200 || responseBody.statusCode == 201) {
        return ResponseModel(
          statusCode: response.statusCode,
          body: responseBody,
        );
      } else {
        return ResponseModel(
          error: 'Error Occured!!',
          message: 'Error',
        );
      }
    } catch (e) {
      if (e is SocketException) {
        print("Socket Exception($api): $e");
      } else if (e is TimeoutException) {
        print("Timeout Exception($api): $e");
      } else {
        print("Unhandled Exception($api): $e");
      }
    }
  }

  Future postMethodWithToken({
    api,
    body,
  }) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    try {
      final response = await http.post(
        Uri.parse(api),
        body: body,
        headers: {
          'Authorization': 'Bearer $_getBearerToken',
          "responseType": "ResponseType.plain",
        },
      );
      var responseBody = jsonDecode(response.body);
      if (response.statusCode == 200 || responseBody.statusCode == 201) {
        return ResponseModel(
          statusCode: response.statusCode,
          body: responseBody,
        );
      } else {
        return ResponseModel(
          error: 'Error Occured!!',
          message: 'Error',
        );
      }
    } catch (e) {
      if (e is SocketException) {
        print("Socket Exception($api): $e");
      } else if (e is TimeoutException) {
        print("Timeout Exception($api): $e");
      } else {
        print("Unhandled Exception($api): $e");
      }
    }
  }

   _getBearerToken()async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String token = sp.getString('token') ?? '';
    return token;
  }
}
