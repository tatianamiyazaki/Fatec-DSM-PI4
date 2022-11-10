import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';

const _tituloAppBar = 'Raios UV - Gráficos';

class uv_charts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.amber),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => dashboard(),
              ),
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.orange, Color.fromARGB(255, 255, 220, 220)],
              //colors: [Colors.blue, Color.fromARGB(255, 212, 247, 255)],
            ),
          ),
          child: Column(
            children: [
              Text(_tituloAppBar),
            ],
          ),
        ),
      ),
    );
  }
}
