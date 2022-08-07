import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart' ;
String usertoken;

Future<dynamic> getUserMistral() async {

  SharedPreferences preferences = await SharedPreferences.getInstance();

    usertoken = preferences.getString("token");


  //  print('user token saved $usertoken');

  var url = Uri.https('api.mistral-korea.ru', '/user',
      {'apikey': usertoken});

  try {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;

      var itemst = jsonResponse['result'];

      if (itemst == true) {
        return jsonResponse;
      } else {
        return null;
      }
    } else {
      print('errore server  request ');
      return null;
    }
  } on Exception catch (e) {
    print('errore server  get data ' + e.toString());
  }

  return null;
}

