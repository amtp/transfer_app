import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


Future<bool> checkAutchMistral(
    BuildContext context,
    String phone,
    String password,
    ) async {
  var url = Uri.https('api.mistral-korea.ru', '/',
      {'login': phone, 'pass': password});

  try {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;

      var itemst = jsonResponse['result'];
      var token = jsonResponse['key'];

      if (itemst == true) {
        SharedPreferences sharedP = await SharedPreferences.getInstance();
        sharedP.setString('token', token);
        return true;
      } else {
        return false;
      }
    } else {
      print('errore server  request ');
      return false;
    }
  } on Exception catch (e) {
    print('errore server  get data ' + e.toString());
    return false;
  }


}