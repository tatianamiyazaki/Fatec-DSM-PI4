import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tacalor/pages/login/login_screen.dart';
import 'package:tacalor/pages/temp_charts.dart';
import 'package:dio/dio.dart';

import 'humid_charts.dart';
import 'uv_charts.dart';

const _tituloAppBar = 'Ta Calor?';
const _textoTemperatura = 'Temperatura';
const _textoUmidade = 'Umidade';
const _textoRaiosUV = 'Raios UV';
const _textoBotaoCadastrar = 'Cadastrar';

class dashboard extends StatefulWidget {
  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  late Dio _dio;
  var _count = 3;

  @override
  void initState() {
    super.initState();

    BaseOptions options = new BaseOptions(
      baseUrl: "http://projetopi4.duckdns.org:8123/api/states",
      connectTimeout: 10000,
      receiveTimeout: 10000,
      responseType: ResponseType.plain,
      contentType: 'application/json',
      headers: {
        HttpHeaders.authorizationHeader:
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI2ZTc4MTkxN2UwYmY0MjYwYmMzNTlkZTU3YTgwNzMyMCIsImlhdCI6MTY2ODQ1Mzg2OCwiZXhwIjoxOTgzODEzODY4fQ.S9BiOzAd8Ho1jmrJ5NY-tDtIVct9YfDBvy_2rVQf7Vw",
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods":
            "GET,PUT,POST,DELETE,PATCH,OPTIONS,HEAD",
        "Access-Control-Allow-Headers":
            "Origin, X-Requested-With, Content-Type, Accept, Authorization",
      },
    );

    _dio = new Dio(options);
  }

  Future<dynamic> getTemperatura() async {
    try {
      Response response = await _dio.get(
          "http://projetopi4.duckdns.org:8123/api/states/sensor.estacao_met_dht11_dht11_temperature");
      print(response.data);
      Map temp = json.decode(response.toString());

      var results = temp["state"].toString();

      print(results);

      return results;
    } catch (e) {
      print(e);
      return ["Error"];
    }
  }

  Future<dynamic> getUmidade() async {
    try {
      Response response = await _dio.get(
          "http://projetopi4.duckdns.org:8123/api/states/sensor.estacao_met_dht11_dht11_humidity");
      print(response.data);
      Map temp = json.decode(response.toString());

      var results = temp["state"].toString();

      print(results);

      return results;
    } catch (e) {
      print(e);
      return ["Error"];
    }
  }

  Future<dynamic> getRaios() async {
    try {
      Response response = await _dio.get(
          "http://projetopi4.duckdns.org:8123/api/states/sensor.tasmota_analog_a0");
      print(response.data);
      Map temp = json.decode(response.toString());

      var results = temp["state"].toString();

      print(results);

      return results;
    } catch (e) {
      print(e);
      return ["Error"];
    }
  }


  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        //       scaffoldBackgroundColor: Colors.white70,
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
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.orange, Color.fromARGB(255, 255, 220, 220)],
              //colors: [Colors.blue, Color.fromARGB(255, 212, 247, 255)],
            ),
          ),
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
                          const Icon(Icons.thermostat, color: Colors.white,),
                          const Text(_textoTemperatura, style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,),),
                          FutureBuilder(
                            future: getTemperatura(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Column(
                                  children: [
                                    Text(
                                      // _textoTemperatura +
                                          "\n" +
                                          snapshot.data.toString() +
                                          " °C",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return Center(
                                  child: Column(
                                    children: [
                                      CircularProgressIndicator(),
                                      Text('Loading...'),
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
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
                          const Icon(Icons.water_drop_rounded, color: Colors.white,),
                          const Text(_textoUmidade,
                                      style: TextStyle(
    fontSize: 20,
    color: Colors.black,),),
                          FutureBuilder(
                            future: getUmidade(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Column(
                                  children: [
                                    Text(
                                      // _textoUmidade +
                                          "\n" +
                                          snapshot.data.toString() +
                                          " %",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return Center(
                                  child: Column(
                                    children: [
                                      CircularProgressIndicator(),
                                      Text('Loading...'),
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
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
                          const Icon(Icons.sunny, color: Colors.white),
                          const Text(_textoRaiosUV, style: TextStyle(
    fontSize: 20,
    color: Colors.black,),),
                          FutureBuilder(
                            future: getRaios(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Column(
                                  children: [
                                    Text(
                                      // _textoRaiosUV +
                                          "\n" +
                                          snapshot.data.toString() +
                                          " UV",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return Center(
                                  child: Column(
                                    children: [
                                      CircularProgressIndicator(),
                                      Text('Loading...'),
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xffef8146)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
                  child: TextField(
                    enabled: false,
                    keyboardType: TextInputType.number,
                    style: TextStyle(),
                    decoration: InputDecoration(
                      labelText: 'Em breve',
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Em Breve',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    child: Text(_textoBotaoCadastrar),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
