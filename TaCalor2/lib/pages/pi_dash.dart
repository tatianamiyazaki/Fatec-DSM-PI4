	import 'dart:io';
	
	import 'package:dio/dio.dart';
	import 'package:flutter/material.dart';
	import 'package:dio/dio.dart';
	
	const _tituloAppBar = 'PI 4º DSM - Dashboard';
	const _textContainer = 'Temperatura';
	
	class Pidash extends StatefulWidget {
	  @override
	  State<Pidash> createState() => _PidashState();
	}
	
	class _PidashState extends State<Pidash> {
	  late Dio _dio;
	  var _count = 3;
	
	  @override
	  void initState() {
	    super.initState();
	
	    // BaseOptions options = new BaseOptions(
	    //   baseUrl: "https://reqres.in/api",
	    //   connectTimeout: 5000,
	    // );
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
	          // "type": "auth/sign_path",
	          // "Accept": "application/json",
	          // // "Host": "projetopi4.duckdns.org:8123",
	          // // "Referer": "http://projetopi4.duckdns.org:8123/",
	          // "X-Requested-With": "XMLHttpRequest",
	          // "path": "/api/states",
	        });
	
	    _dio = new Dio(options);
	  }
	
	  // Future<List<String>> getTemperatura() async {
	  //   try {
	  //     Response response = await _dio.get("http://projetopi4.duckdns.org:8123/api/states");
	  //     print(response.data);
	  //     return response.data;
	  //   } catch (e) {
	  //     print(e);
	  //     return [];
	  //   }
	  // }
	
	  Future getTemperatura() async {
	    try {
	      Response response =
	          await _dio.get("http://projetopi4.duckdns.org:8123/api/states");
	      print(response.data);
	      return response.data;
	    } catch (e) {
	      print(e);
	      return ["Error"];
	    }
	  }
	
	  Map<String, String> headers = {
	    'Content-Type': 'application/json;charset=UTF-8',
	    'Charset': 'utf-8'
	  };
	
	  
	  Widget build(BuildContext context) {
	    // TODO: implement build
	    return Scaffold(
	      appBar: AppBar(
	        title: Row(
	          mainAxisAlignment: MainAxisAlignment.spaceBetween,
	          children: [
	            Text(
	              _tituloAppBar,
	              style: TextStyle(fontSize: 26.0),
	            ),
	            Icon(Icons.home, size: 36.0),
	          ],
	        ),
	      ),
	      body: Column(
	        mainAxisAlignment: MainAxisAlignment.spaceBetween,
	        crossAxisAlignment: CrossAxisAlignment.start,
	        children: [
	          Padding(
	            padding: const EdgeInsets.all(8.0),
	          ),
	          Padding(
	            padding: const EdgeInsets.all(8.0),
	            child: InkWell(
	              // onTap: () {
	              //   Navigator.of(context).push(
	              //     MaterialPageRoute(
	              //       builder: (context) => ListaContatos(),
	              //     ),
	              //   );
	              // },
	              child: Container(
	                height: 200,
	                width: 200,
	                color: Color(0xfff7dd19),
	                child: Padding(
	                  padding: const EdgeInsets.all(8.0),
	                  child: Column(
	                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
	                    crossAxisAlignment: CrossAxisAlignment.start,
	                    children: [
	                      Icon(
	                        Icons.thermostat,
	                        size: 35,
	                        color: Color(0xff1e38a7),
	                      ),
	                      FutureBuilder(
	                        future: getTemperatura(),
	                        builder: (context, snapshot) {
	                          if (snapshot.hasData) {
	                            return Column(
	                              children: [
	                                Text(
	                                  _textContainer +
	                                      "\n" +
	                                      snapshot.data.toString() +
	                                      " °C",
	                                  style: TextStyle(
	                                    fontSize: 20,
	                                    color: Color(0xff1e38a7),
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
	
	                    // children: [
	                    //   Icon(
	                    //     Icons.thermostat,
	                    //     size: 30,
	                    //     color: Color(0xff1e38a7),
	                    //   ),
	                    //   Text(
	                    //     _textContainer,
	                    //     style: TextStyle(
	                    //       color: Color(0xff1e38a7),
	                    //       fontSize: 20.0,
	                    //     ),
	                    //   ),
	                    //   //temperatura
	                    //   Text(
	                    //     _temperatura,
	                    //     style: TextStyle(
	                    //       color: Color(0xff1e38a7),
	                    //       fontSize: 20.0,
	                    //     ),
	                    //   ),
	                    //   Container(
	                    //     margin: EdgeInsets.all(10.0),
	                    //     child: ElevatedButton(
	                    //       onPressed: () {
	                    //         getProfile();
	                    //       },
	                    //       child: Text('Aperte'),
	                    //     ),
	                    //   ),
	                    // ],
	                  ),
	                ),
	              ),
	            ),
	          ),
	        ],
	      ),
	    );
	  }
	}
	