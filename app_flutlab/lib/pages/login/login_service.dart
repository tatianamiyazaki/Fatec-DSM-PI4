import 'dart:convert';
import 'dart:html';
import 'dart:js';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../shared/constants/routes.dart';
import '../dashboard.dart';

class LoginService {
  login(String email, String password, dynamic context) async {
    http.Response response = await http.post(
      Uri.parse(Routes().signIn()),
      body: json.encode(
        {
          "email": email,
          "password": password,
          "returnSecureToken": true,
        },
      ),
    );
    Map log = json.decode(response.body);

    try {
      if (log["registered"]) {
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
