import 'package:flutter/material.dart';
import '../dashboard.dart';
import 'sign_up_service.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _nameInputController = TextEditingController();
  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();
  TextEditingController _confirmInputController = TextEditingController();

  bool showPassword = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 212, 247, 255), Colors.blue],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: 15,
                ),
                child: Image.asset(
                  "assets/ta_calor.png",
                  height: 150,
                ),
              ),
              Text(
                "Cadastro",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.length < 5) {
                          return "Digite seu nome completo";
                        }
                        return null;
                      },
                      controller: _nameInputController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: "Nome Completo",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.length < 5) {
                          return "Esse e-mail parece curto demais";
                        } else if (!value.contains("@")) {
                          return "Digite um e-mail válido";
                        }
                        return null;
                      },
                      controller: _mailInputController,
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.mail_outlined,
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.length < 6) {
                          return "A senha deve ter pelo menos 6 caracteres";
                        }
                        return null;
                      },
                      controller: _passwordInputController,
                      obscureText: (this.showPassword == true) ? false : true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.vpn_key_sharp,
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    (this.showPassword == false)
                        ? TextFormField(
                            validator: (value) {
                              if (value != _passwordInputController.text) {
                                return "As senhas devem ser iguais";
                              }
                              return null;
                            },
                            controller: _confirmInputController,
                            obscureText: true,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: "Confirme a Senha",
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              prefixIcon: Icon(
                                Icons.vpn_key_sharp,
                                color: Colors.white,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Row(
                children: [
                  Checkbox(
                    value: this.showPassword,
                    onChanged: (newValue) {
                      setState(
                        () {
                          this.showPassword = newValue!;
                        },
                      );
                    },
                  ),
                  Text(
                    "Mostrar senha",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    _doSignUp();
                    //Navigator.pop(context);
                  },
                  child: Text(
                    "Cadastrar",
                    style: TextStyle(
                      color: (Colors.black),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Color.fromARGB(255, 230, 230, 255),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _doSignUp() {
    if (_formKey.currentState!.validate()) {
      SignUpService().signUp(
          _mailInputController.text, _passwordInputController.text, context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => dashboard(),
        ),
      );
      //   if (SignUpService == true) {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => dashboard(),
      //       ),
      //     );
      //   }
      // } else {
      //   final snackBar = SnackBar(
      //     content: Text('Algo deu errado!'),
      //     action: SnackBarAction(
      //       label: "Dispensar",
      //       onPressed: () {
      //         ScaffoldMessenger.of(context).hideCurrentSnackBar();
      //       },
      //     ),
      //   );
      //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // }
    }
  }
}
