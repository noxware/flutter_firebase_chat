import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/globals.dart' as globals;

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        alignment: Alignment.center,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  controller: _userController,
                  validator: (value) =>
                      value.isEmpty ? 'Ingrese algun nombre de usuario' : null),
              SizedBox(height: 10),
              RaisedButton(
                child: Text('Iniciar sesion'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    globals.username = _userController.text;
                    Navigator.pushReplacementNamed(context, '/home')
                        .then((value) => globals.username = null);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
