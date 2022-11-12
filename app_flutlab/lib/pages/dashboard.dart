import 'package:flutter/cupertino.dart';
import 'package:flutter//material.dart';
import 'dart:convert';
import 'dart:html';
import 'dart:js';
import 'package:tacalor/pages/login/login_screen.dart';
import 'package:tacalor/pages/temp_charts.dart';
import 'package:http/http.dart' as http;

import 'humid_charts.dart';
import 'uv_charts.dart';

const _tituloAppBar = 'Ta Calor?';
const _textoTemperatura = 'Temperatura';
const _textoUmidade = 'Umidade';
const _textoRaiosUV = 'Raios UV';
const _textoBotaoCadastrar = 'Cadastrar';

const request = 'https://api.hgbrasil.com/weather?woeid=455863';

Future temperatura() async {
  http.Response response = await http.get(Uri.parse(request));
  Map map1 = json.decode(response.toString());
  var results = map1['results']['temp'].toString();
  print(results);
  return results;
}

Future humidade() async {
  http.Response response = await http.get(request);
  Map map1 = json.decode(response.toString());
  var results = map1['results']['humidity'].toString();
  print(results);
  return results;
}

//Future<String> uv() async {
// http.Response response = await http.get(request);
// //var teste = response.data.toString();
// //var resposta = response.data.toString().substring(134, 150);
//
// return true;
//

class dashboard extends StatelessWidget {
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
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            )
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    //botão temperatura
                    width: 150,
                    height: 120,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(Icons.thermostat),
                          FutureBuilder(
                              future: temperatura(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Center(
                                    child: Text(
                                      'Temperatura: ', // +
                                      //snapshot.toString().substring(44, 46),
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
                        backgroundColor:
                            MaterialStateProperty.all(Colors.amber),
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
                    width: 150,
                    height: 120,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(Icons.water_drop_rounded),
                          const Text(_textoUmidade),
                        ],
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    //botão raios uv
                    width: 150,
                    height: 120,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(Icons.sunny),
                          const Text(_textoRaiosUV),
                        ],
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xffe75c0c)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(),
                    decoration: InputDecoration(
                      labelText: 'Informe seu celular e receba alertas',
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Informe seu telefone e receba alertas',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  child: Text(_textoBotaoCadastrar),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
