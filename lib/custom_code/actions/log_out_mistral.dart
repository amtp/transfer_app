import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


void logOutMistral() async {

  try {
    SharedPreferences sharedP = await SharedPreferences.getInstance();
    sharedP.setString('token', '');

  } on Exception catch (e) {
   // print('errore server  get data ' + e.toString());
    //return false;
  }


}