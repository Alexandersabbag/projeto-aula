// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:projeto_aula/view/recuperar_senha_view.dart';
import 'package:projeto_aula/view/tela_cadastro_view.dart';
import 'package:projeto_aula/view/tela_menu_view.dart';
import 'package:projeto_aula/view/tela_sobre_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          centerTitle: true,
          backgroundColor: Color(0xFF6495ED),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(90, 190, 90, 90),
              child: TextField(
                controller: txtEmail,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(fontSize: 30),
                  suffixIcon: Icon(Icons.email),
                  iconColor: Color(0xFF6495ED),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 90),
              child: TextField(
                controller: txtSenha,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(fontSize: 30),
                  suffixIcon: Icon(Icons.lock),
                  iconColor: Color(0xFF6495ED),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      text: 'Esqueceu a senha ?',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RecuperarSenhaView()));
                        }),
                ),
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      text: 'Novo Aqui ? Cadastrar',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => cadastrarView()));
                        }),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              child: Text(
                'Entrar',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF6495ED),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 40),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MenuView()));
              },
            )
          ],
        ));
  }
}
