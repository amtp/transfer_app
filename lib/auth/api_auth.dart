import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:transfer_app/backend/api_requests/api_calls.dart';
import '../backend/api_requests/api_manager.dart';
import '../backend/api_requests/schema/AutcData.dart';
import 'auth_util.dart';
import 'package:http/http.dart' as http;

  Map<String, String> toStringMap(Map<String, dynamic> map) =>
map.map((key, value) => MapEntry(key, value.toString()));

Future<User> signInWithApiPre(
    BuildContext context, String email, String password) async {
  final signInFunc = () => FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email.trim(), password: password);
  return  signInOrCreateAccount(context, signInFunc);
}

Future<User> signInWithApi(  BuildContext context, String email, String password) async {


  final uri = Uri.https('api.mistral-korea.ru', '', toStringMap({'login': email, 'pass': password,}));

  final response = await http.get(uri, headers: toStringMap({}));

  final AutcData dfff = AutcData.fromJson(json.decode(response.body));



  final userP = await signInWithApiPre(context, email, password,);
  if (userP == null) {
    return createAccountWithEmailApi(context, email.trim(), password);
  }else{
    return userP;
  }

}



Future<User> createAccountWithEmailApi(
    BuildContext context, String email, String password) async {
  final createAccountFunc = () => FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email.trim(), password: password);
  return signInOrCreateAccount(context, createAccountFunc);
}
