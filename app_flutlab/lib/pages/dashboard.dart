import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tacalor/pages/login/login_screen.dart';
import 'package:tacalor/pages/temp_charts.dart';

import 'humid_charts.dart';
import 'uv_charts.dart';

const _tituloAppBar = 'Ta Calor?';
const _textoTemperatura = 'Temperatura';
const _textoUmidade = 'Umidade';
const _textoRaiosUV = 'Raios UV';
const _textoBotaoCadastrar = 'Cadastrar';

class dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
 //     theme: ThemeData(
 //       primarySwatch: Colors.red,
 //       scaffoldBackgroundColor: Colors.white70,
 //     ),

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
                        const Icon(Icons.thermostat),
                        const Text(_textoTemperatura),
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
      ),),
    );
  }
}
