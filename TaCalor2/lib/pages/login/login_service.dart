//import 'dart:convert';
//import 'dart:html';
//import 'dart:js';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:tacalor/pages/pi_dash.dart';

import '../../shared/constants/routes.dart';
import '../dashboard.dart';

class LoginService {
  login(String email, String password, dynamic context) async {
    Dio dio = Dio();
    Response response = await dio.post(
      Routes().signIn(),
      queryParameters: {
        "email": email,
        "password": password,
        "returnSecureToken": true,
      },
    );

    print(response.data['registered']);
    var log = null;
    log = response.data['registered'];

    try {
      if (log) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => dashboard(),
          ),
        );
      }
    } catch (error) {
      final snackBar = SnackBar(
        content: Text('Email ou senha inválidos'),
        action: SnackBarAction(
          label: "Dispensar",
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
