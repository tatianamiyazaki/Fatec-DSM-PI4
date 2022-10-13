import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/dashboard.dart';

void main() => runApp(TaCalor());

class TaCalor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: login(), //chama a tela com os cards
    );
  }
}
