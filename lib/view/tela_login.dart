// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, unused_import
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:projeto_aula/controller/login_controller.dart';
import 'package:projeto_aula/view/recuperar_senha_view.dart';
import 'package:projeto_aula/view/tela_cadastro_view.dart';
import 'package:projeto_aula/view/tela_menu_view.dart';
import 'package:projeto_aula/view/tela_sobre_view.dart';
import 'package:projeto_aula/widgets/loginwid.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          centerTitle: true,
          backgroundColor: Color(0xFF6495ED),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
                child: LoginWidField(
                  icone: Icons.mail,
                  texto: txtEmail,
                  lblTxt: "E-mail",
                ),
              ),
              LoginWidField(
                icone: Icons.password,
                texto: txtSenha,
                lblTxt: "Senha",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                        text: 'Esqueceu a senha ?',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RecuperarSenhaView()));
                          }),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF6495ED),
                          borderRadius: BorderRadius.circular(4)),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: 'Novo Aqui ? Cadastrar',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => cadastrarView()));
                              }),
                      ),
                    ),
                  )
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
                  LoginController()
                      .login(context, txtEmail.text, txtSenha.text);
                },
              )
            ],
          ),
        ));
  }
}
