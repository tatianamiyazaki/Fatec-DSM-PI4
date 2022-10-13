import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';

const _tituloAppBar = 'Tela de Cadastro';
const _textoBotaoCadastrar = 'Cadastar';

class register extends StatelessWidget {
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
          // decoration: const BoxDecoration(//background image
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
                  hintText: "Nome",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
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
              TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintText: "Confirme o Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              ElevatedButton(
                child: Text(_textoBotaoCadastrar),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return login();
                  }));
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return login();
                      },
                    ),
                  );
                },
                child: Text(
                  'Já tem cadastro?',
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
