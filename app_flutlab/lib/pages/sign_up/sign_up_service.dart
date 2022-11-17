import 'dart:convert';

//import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import '../../shared/constants/routes.dart';

class SignUpService {
  signUp(String email, String password) async {
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
  }
}
