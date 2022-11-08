import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../shared/constants/routes.dart';


class SignUpService {
  signUp(String email, String password) async {

    http.Response response = await http.post(
      Uri.parse(Routes().signUp()),
      body: json.encode(
        {"email": email,
          "password": password,
          "returnSecureToken": true,
        },
      ),
    );
    print(response.body);
  }
}
