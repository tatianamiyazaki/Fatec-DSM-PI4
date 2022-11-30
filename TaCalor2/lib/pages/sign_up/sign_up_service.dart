import 'dart:convert';
//import 'dart:html';

//import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import '../../shared/constants/routes.dart';
//import '../dashboard.dart';

class SignUpService {
  signUp(String email, String password, dynamic context) async {
    Dio dio = new Dio();
    Response response = await dio.post(
      Routes().signUp(),
      
      queryParameters:
        {
          "email": email,
          "password": password,
          "returnSecureToken": true,
        },
      );
      print(response.data);

    // Map log = json.decode(response.body);

    // try {
    //   if (log["kind" == "identitytoolkit#SignupNewUserResponse"]) {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => dashboard(),
    //       ),
    //     );
    //   }
    // } catch (error) {
    //   final snackBar = SnackBar(
    //     content: Text('Não'),
    //     action: SnackBarAction(
    //       label: "Dispensar",
    //       onPressed: () {
    //         ScaffoldMessenger.of(context).hideCurrentSnackBar();
    //       },
    //     ),
    //   );
    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // }
  }
}
