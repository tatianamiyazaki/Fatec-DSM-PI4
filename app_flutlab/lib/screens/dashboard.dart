import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grafico/screens/humid_charts.dart';
import 'package:grafico/screens/temp_charts.dart';
import 'package:grafico/screens/uv_charts.dart';

import 'login.dart';

//var _tituloAppBar = 'Ta Calor?';
var _textoTemperatura = 'Temperatura';
const _textoUmidade = 'Umidade';
const _textoRaiosUV = 'Raios UV';
const _textoBotaoCadastrar = 'Cadastrar';

const request = "https://api.hgbrasil.com/weather?woeid=455863";

Future <String> temperatura() async {
    Dio dio = Dio();
    Response response = await dio.get(request);
    Map map1 = json.decode(response.toString());
    var results = map1['results']['temp'].toString();
    return results;

}
Future humidade() async {
  Dio dio = Dio();
  Response response = await dio.get(request);
  Map map1 = json.decode(response.toString());
  var results = map1['results']['humidity'].toString();
  return results;

}

Future <String> uv() async {
  Dio dio = Dio();
  Response response = await dio.get(request);
  var teste = response.data.toString();
  var resposta = response.data.toString().substring(134,150);

  return resposta;

}
void getHttp() async {
  try {
    var response = await Dio().get('http://www.google.com');
    print(response);
  } catch (e) {
    print(e);
  }
}

var _tituloAppBar = 'ERGOLIST Tempo';

class dashboard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white70,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
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
            )
          ],
        ),
        body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    //botão temperatura
                    width: 300,
                    height: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return temp_charts();
                            },
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(Icons.thermostat),
                          FutureBuilder(
                              future: temperatura(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Center(
                                    child: Text(
                                      'Temperatura: ' + snapshot.toString().substring(44,46),
                                      style: TextStyle(fontSize: 30.0),
                                    ),
                                  );
                                } else {
                                  return Center(
                                    child: LinearProgressIndicator(),
                                    //style: C
                                  );
                                }
                              })
                        ],
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.amber),
                        // padding: MaterialStateProperty.all(
                        //   EdgeInsets.all(right: 50),
                        // ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    //botão umidade
                    width: 300,
                    height: 150,

                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return humd_charts();
                            },
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(Icons.water_drop_rounded),
                          FutureBuilder(
                              future: humidade(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Center(
                                    child: Text(
                                      'Humidade:  ' + snapshot.toString().substring(44,47),
                                      style: TextStyle(fontSize: 30.0),
                                    ),
                                  );
                                } else {
                                  return Center(
                                    child: LinearProgressIndicator(),
                                    //style: Color(Colors.black),
                                  );
                                }
                              })
                        ],
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        shadowColor: MaterialStateProperty.all(Colors.red),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    //botão raios uv
                    width: 300,
                    height: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return uv_charts();
                            },
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(Icons.sunny),
                          FutureBuilder(
                              future: uv(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Center(
                                    child: Text(
                                      snapshot.toString().substring(44,52),
                                      style: TextStyle(fontSize: 30.0),
                                    ),
                                  );
                                } else {
                                  return Center(
                                    child: LinearProgressIndicator(),
                                  );
                                }
                              })
                        ],
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Color(0xffe75c0c)),
                      ),
                    ),
                  ),
                ),
                TextField(
                  style: TextStyle(),
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Informe seu telefone e receba alertas",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                ElevatedButton(
                  child: Text(_textoBotaoCadastrar),
                  onPressed: () {},
                ),
              ],
            ))
      ),
    );
  }
}
