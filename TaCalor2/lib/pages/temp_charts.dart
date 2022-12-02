import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:tacalor/pages/dashboard.dart';

const _tituloAppBar = 'Temperatura - Gráficos';

class temp_charts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        //scaffoldBackgroundColor: Colors.grey,
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
          child: SingleChildScrollView(
            child: Html(
                data:
                    """<iframe src="https://e.infogram.com/735957a5-670b-4cd2-8247-fbe2fa7647d6?src=embed" title="Temperatura" width="550" height="1897" scrolling="no" frameborder="0" style="border:none;" allowfullscreen="allowfullscreen"></iframe><div style="padding:8px 0;font-family:Arial!important;font-size:13px!important;line-height:15px!important;text-align:center;border-top:1px solid #dadada;margin:0 30px;width: 490px"><a href="https://infogram.com/735957a5-670b-4cd2-8247-fbe2fa7647d6" style="color:#989898!important;text-decoration:none!important;" target="_blank">Temperatura</a><br><a href="https://infogram.com" style="color:#989898!important;text-decoration:none!important;" target="_blank" rel="nofollow">Infogram</a></div>"""),
          ),
        ),
      ),
    );
  }
}
