// ignore_for_file: avoid_print, duplicate_ignore

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../constants/user_constants.dart';
import 'app_exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: non_constant_identifier_names
String MESSAGE_KEY = 'message';
late SharedPreferences _sharedPreferences;

class ResponseHandler {
  Map<String, String> setTokenHeader() {
    return {'': ''}; //{'Authorization': 'Bearer ${Constants.authenticatedToken}'};
  }

  Future postWithAgent(Uri url, Map<String, dynamic> params, String userAgent) async {
    var head = <String, String>{};
    head['Content-Type'] = 'application/json'; // Use JSON content type for sending JSON data
    head['User-Agent'] = userAgent;
    var responseJson;

    try {
      final response =
          await http.post(url, body: jsonEncode(params), headers: head).timeout(const Duration(seconds: 30));
      responseJson = json.decode(response.body.toString());
      // ignore: avoid_print
      print(responseJson);
      if (responseJson['status'] != true) throw FetchDataException(responseJson['message'].toString());
      return responseJson;
    } on TimeoutException {
      throw FetchDataException("Slow internet connection");
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
  }

  Future post(
    Uri url,
    Map<String, dynamic> params,
  ) async {
    var head = <String, String>{};
    head['Content-Type'] = 'application/json'; // Use JSON content type for sending JSON data
    var responseJson;

    try {
      final response =
          await http.post(url, body: jsonEncode(params), headers: head).timeout(const Duration(seconds: 30));
      responseJson = json.decode(response.body.toString());
      // ignore: avoid_print
      print(responseJson);
      if (responseJson['status'] != true) throw FetchDataException(responseJson['message'].toString());
      return responseJson;
    } on TimeoutException {
      throw FetchDataException("Slow internet connection");
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future postWithToken(
    Uri url,
    Map<String, dynamic> params,
  ) async {
    _sharedPreferences = await SharedPreferences.getInstance();

    String token = _sharedPreferences.getString(UserConstants().userToken)!;

    var head = <String, String>{};
    head['Content-Type'] = 'application/json';
    head['Authorization'] = 'Bearer $token';
    // Use JSON content type for sending JSON data
    var responseJson;

    try {
      final response =
          await http.post(url, body: jsonEncode(params), headers: head).timeout(const Duration(seconds: 30));
      responseJson = json.decode(response.body.toString());
      // ignore: avoid_print
      print(responseJson);
      if (responseJson['status'] != true) throw FetchDataException(responseJson['message'].toString());
      return responseJson;
    } on TimeoutException {
      throw FetchDataException("Slow internet connection");
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future putWithToken(
    Uri url,
    Map<String, dynamic> params,
  ) async {
    _sharedPreferences = await SharedPreferences.getInstance();

    String token = _sharedPreferences.getString(UserConstants().userToken)!;

    var head = <String, String>{};
    head['Content-Type'] = 'application/json';
    head['Authorization'] = 'Bearer $token';
    // Use JSON content type for sending JSON data
    var responseJson;

    try {
      final response =
          await http.put(url, body: jsonEncode(params), headers: head).timeout(const Duration(seconds: 30));
      responseJson = json.decode(response.body.toString());
      // ignore: avoid_print
      print(responseJson);
      if (responseJson['status'] != true) throw FetchDataException(responseJson['message'].toString());
      return responseJson;
    } on TimeoutException {
      throw FetchDataException("Slow internet connection");
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future putWithJsonRequestToken(
    Uri url,
    dynamic params,
  ) async {
    _sharedPreferences = await SharedPreferences.getInstance();

    String token = _sharedPreferences.getString(UserConstants().userToken)!;

    var head = <String, String>{};
    head['Authorization'] = 'Bearer $token';
    head['content-type'] = 'application/json';
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;
    var params1 = utf8.encode(json.encode(params));
    try {
      final response = await http.put(url, body: params1, headers: head).timeout(const Duration(seconds: 30));
      responseJson = json.decode(response.body.toString());
      // ignore: avoid_print
      print(responseJson);
      if (responseJson['status'] != true) throw FetchDataException(responseJson['message'].toString());
      return responseJson;
    } on TimeoutException {
      throw FetchDataException("Slow internet connection");
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future postWithBothString(
    Uri url,
    Map<String, String> params,
  ) async {
    var head = <String, String>{};
    head['content-type'] = 'application/json';
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;
    try {
      final response = await http.post(url, body: params, headers: head).timeout(const Duration(seconds: 30));
      responseJson = json.decode(response.body.toString());
      // ignore: avoid_print
      print(responseJson);
      if (responseJson['status'] != true) throw FetchDataException(responseJson['message'].toString());
      return responseJson;
    } on TimeoutException {
      throw FetchDataException("Slow internet connection");
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future postWithBothStringWithToken(
    Uri url,
    Map<String, String> params,
  ) async {
    _sharedPreferences = await SharedPreferences.getInstance();

    String token = _sharedPreferences.getString(UserConstants().userToken)!;

    var head = <String, String>{};
    head['Authorization'] = 'Bearer $token';
    head['content-type'] = 'application/json';
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;
    try {
      final response = await http.post(url, body: params, headers: head).timeout(const Duration(seconds: 30));
      responseJson = json.decode(response.body.toString());
      // ignore: avoid_print
      print(responseJson);
      if (responseJson['status'] != true) throw FetchDataException(responseJson['message'].toString());
      return responseJson;
    } on TimeoutException {
      throw FetchDataException("Slow internet connection");
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future postWithJsonRequest(
    Uri url,
    dynamic params,
  ) async {
    var head = <String, String>{};
    head['content-type'] = 'application/json';
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;
    var params1 = utf8.encode(json.encode(params));
    try {
      final response = await http.post(url, body: params1, headers: head).timeout(const Duration(seconds: 30));
      responseJson = json.decode(response.body.toString());
      // ignore: avoid_print
      print(responseJson);
      if (responseJson['status'] != "success") throw FetchDataException(responseJson['message'].toString());
      return responseJson;
    } on TimeoutException {
      throw FetchDataException("Slow internet connection");
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future postWithJsonRequestToken(
    Uri url,
    dynamic params,
  ) async {
    _sharedPreferences = await SharedPreferences.getInstance();

    String token = _sharedPreferences.getString(UserConstants().userToken)!;

    var head = <String, String>{};
    head['Authorization'] = 'Bearer $token';
    head['content-type'] = 'application/json';
    //head['Accept'] = 'application/json';
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;
    var params1 = utf8.encode(json.encode(params));

    try {
      final response = await http.post(url, body: params1, headers: head).timeout(const Duration(seconds: 30));
      responseJson = json.decode(response.body.toString());
      // ignore: avoid_print
      print(responseJson);
      if (responseJson['status'] != true) throw FetchDataException(responseJson['message'].toString());
      return responseJson;
    } on TimeoutException {
      throw FetchDataException("Slow internet connection");
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future deleteWithJsonRequestToken(
    Uri url,
    dynamic params,
  ) async {
    _sharedPreferences = await SharedPreferences.getInstance();

    String token = _sharedPreferences.getString(UserConstants().userToken)!;

    var head = <String, String>{};
    head['Authorization'] = 'Bearer $token';
    head['content-type'] = 'application/json';

    // ignore: prefer_typing_uninitialized_variables
    var responseJson;
    var params1 = utf8.encode(json.encode(params));
    try {
      final response = await http.delete(url, body: params1, headers: head).timeout(const Duration(seconds: 30));
      responseJson = json.decode(response.body.toString());
      // ignore: avoid_print
      print(responseJson);
      if (responseJson['status'] != true) throw FetchDataException(responseJson['message'].toString());
      return responseJson;
    } on TimeoutException {
      throw FetchDataException("Slow internet connection");
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  // Future stripePost(
  //     Uri url, dynamic body,String publishableKey) async {
  //   var head = <String, String>{};
  //
  //   head['Authorization'] = 'Bearer $publishableKey';
  //   head['content-type'] = 'application/x-www-form-urlencoded';
  //   // ignore: prefer_typing_uninitialized_variables
  //   var responseJson;
  //   try {
  //     final response = await http.post(url, body: body, headers: head).timeout(const Duration(seconds: 45));
  //     responseJson = response.body;
  //     // ignore: avoid_print
  //     print(responseJson);
  //     if(response.statusCode!= 200) throw FetchDataException(responseJson);
  //     return responseJson;
  //   } on TimeoutException {
  //     throw FetchDataException("Slow internet connection");
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  // }

  ///Image handler For business

  // Future postFile(String url, XFile files) async {
  //   var head = <String, String>{};
  //   head['content-type'] = 'application/x-www-form-urlencoded';
  //   var res;
  //   var jsonData;
  //   try {
  //     final request = http.MultipartRequest('POST', Uri.parse(url));
  //     if (files != null) {
  //       final file = await http.MultipartFile.fromPath(
  //           'file', files.path); //,contentType: MediaType(mimeTypeData[0], mimeTypeData[1])
  //       request.files.add(file);
  //     }
  //     await request.send().then((response) {
  //       if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 202) print("Uploaded!");
  //       res = response.stream;
  //     });
  //     await for (List<int> chunk in res) {
  //       final chunkString = utf8.decode(chunk);
  //       jsonData = json.decode(chunkString);
  //       print('Received JSON data: $jsonData');
  //     }
  //     // if(res['status']!= true) throw FetchDataException(res['message'].toString());
  //     return jsonData;
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  // }
  //
  // Future postFileWithToken(String url, XFile files) async {
  //   _sharedPreferences = await SharedPreferences.getInstance();
  //
  //   String token = _sharedPreferences.getString(UserConstants().userToken)!;
  //
  //   var head = <String, String>{};
  //   head['Authorization'] = 'Bearer $token';
  //   head['content-type'] = 'application/x-www-form-urlencoded';
  //   var res;
  //   var jsonData;
  //   try {
  //     final request = http.MultipartRequest('POST', Uri.parse(url));
  //     if (files != null) {
  //       final file = await http.MultipartFile.fromPath(
  //           'file', files.path); //,contentType: MediaType(mimeTypeData[0], mimeTypeData[1])
  //       request.files.add(file);
  //     }
  //     await request.send().then((response) {
  //       if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 202) print("Uploaded!");
  //       res = response.stream;
  //     });
  //     await for (List<int> chunk in res) {
  //       final chunkString = utf8.decode(chunk);
  //       jsonData = json.decode(chunkString);
  //       print('Received JSON data: $jsonData');
  //     }
  //     // if(res['status']!= true) throw FetchDataException(res['message'].toString());
  //     return jsonData;
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  // }
  //
  // Future postImage(String url, XFile image) async {
  //   var head = <String, String>{};
  //   head['content-type'] = 'application/x-www-form-urlencoded';
  //   var res;
  //   var jsonData;
  //   try {
  //     final request = http.MultipartRequest('POST', Uri.parse(url));
  //     if (image != null) {
  //       final file = await http.MultipartFile.fromPath(
  //           'image', image.path); //,contentType: MediaType(mimeTypeData[0], mimeTypeData[1])
  //       request.files.add(file);
  //     }
  //     await request.send().then((response) {
  //       if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 202) print("Uploaded!");
  //       res = response.stream;
  //     });
  //     await for (List<int> chunk in res) {
  //       final chunkString = utf8.decode(chunk);
  //       jsonData = json.decode(chunkString);
  //       print('Received JSON data: $jsonData');
  //     }
  //     // if(res['status']!= true) throw FetchDataException(res['message'].toString());
  //     return jsonData;
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  // }
  //
  // Future postImageWithToken(String url, XFile image) async {
  //   _sharedPreferences = await SharedPreferences.getInstance();
  //
  //   String token = _sharedPreferences.getString(UserConstants().userToken)!;
  //
  //   var head = <String, String>{};
  //   head['Authorization'] = 'Bearer $token';
  //   head['content-type'] = 'application/x-www-form-urlencoded';
  //   var res;
  //   var jsonData;
  //   try {
  //     final request = http.MultipartRequest('POST', Uri.parse(url));
  //     if (image != null) {
  //       final file = await http.MultipartFile.fromPath(
  //           'image', image.path); //,contentType: MediaType(mimeTypeData[0], mimeTypeData[1])
  //       request.files.add(file);
  //     }
  //     await request.send().then((response) {
  //       if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 202) print("Uploaded!");
  //       res = response.stream;
  //     });
  //     await for (List<int> chunk in res) {
  //       final chunkString = utf8.decode(chunk);
  //       jsonData = json.decode(chunkString);
  //       print('Received JSON data: $jsonData');
  //     }
  //     // if(res['status']!= true) throw FetchDataException(res['message'].toString());
  //     return jsonData;
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  // }

  Future get(Uri url) async {
    var head = <String, String>{};
    head['content-type'] = 'application/json; charset=utf-8';
    head['Accept'] = "application/json";
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;
    try {
      final response = await http.get(url, headers: head).timeout(const Duration(seconds: 30));
      responseJson = json.decode(response.body.toString());
      // ignore: avoid_print
      print(responseJson);
      if (responseJson['status'] != true) throw FetchDataException(responseJson['message'].toString());
      return responseJson;
    } on TimeoutException {
      throw FetchDataException("Slow internet connection");
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future getWithToken(Uri url) async {
    _sharedPreferences = await SharedPreferences.getInstance();

    String token = _sharedPreferences.getString(UserConstants().userToken)!;

    var head = <String, String>{};
    head['Authorization'] = 'Bearer $token';
    head['Content-Type'] = 'application/json';
    head['Accept'] = 'application/json';

    // ignore: prefer_typing_uninitialized_variables
    var responseJson;
    try {
      final response = await http
          .get(
            url,
            headers: head,
          )
          .timeout(const Duration(seconds: 30));
      responseJson = json.decode(response.body.toString());
      print(responseJson);
      // ignore: avoid_print
      return responseJson;
    }on TimeoutException {
      throw FetchDataException("Slow internet connection");
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }
}
