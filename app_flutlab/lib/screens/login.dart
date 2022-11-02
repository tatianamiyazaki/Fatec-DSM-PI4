import 'package:flutter/material.dart';
import 'package:grafico/screens/register.dart';
import 'dashboard.dart';

import 'dart:convert';

import 'package:dio/dio.dart';

const _tituloAppBar = 'Tela de Login';
const _textoBotaoEntrar = 'Entrar';

const request = "https://api.hgbrasil.com/weather?woeid=455863";


Future suaRequisicao() async {
  Dio dio = Dio();
  Response response = await dio.get(request);
  var resposta = response.data.toString().substring(40, 48);
  //var resposta = jsonEncode(response.data);
  //var parsedJson = resposta.results;
  var encoded = jsonEncode(resposta);
  var decoded = jsonDecode(encoded);
  return resposta;
}

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white70,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: Container(
          // decoration: const BoxDecoration(//imagem background
          //   image: DecorationImage(
          //     image: AssetImage("images/Tacalor2.png"),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Image.asset('images/Tacalor2.png'),
              TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              TextField(
                style: TextStyle(),
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              ElevatedButton(
                child: Text(_textoBotaoEntrar),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    var temp = suaRequisicao();
                    return dashboard();
                  }));
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return register();
                      },
                    ),
                  );
                },
                child: Text(
                  'Não tem cadastro?',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color(0xff000000),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                style: ButtonStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
