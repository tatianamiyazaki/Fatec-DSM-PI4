import 'package:flutter/material.dart';
import 'package:tacalor/pages/login/login_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Tá Calor?',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
