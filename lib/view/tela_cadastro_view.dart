// ignore_for_file: non_constant_identifier_names, unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projeto_aula/model/cadastrar.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../controller/login_controller.dart';

class cadastrarView extends StatefulWidget {
  const cadastrarView({super.key});

  @override
  State<cadastrarView> createState() => _cadastrarViewState();
}

class _cadastrarViewState extends State<cadastrarView> {
  var txtCadNome = TextEditingController();
  var txtCadEmail = TextEditingController();
  var txtCadSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        centerTitle: true,
        backgroundColor: Color(0xFF6495ED),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(90, 20, 90, 20),
              child: TextField(
                controller: txtCadNome,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  labelStyle: TextStyle(fontSize: 25),
                  suffixIcon: Icon(Icons.person),
                  iconColor: Color(0xFF6495ED),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(90, 0, 90, 20),
              child: TextField(
                controller: txtCadEmail,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(fontSize: 25),
                  suffixIcon: Icon(Icons.email),
                  iconColor: Color(0xFF6495ED),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(90, 0, 90, 20),
                child: TextField(
                  controller: txtCadSenha,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    labelStyle: TextStyle(fontSize: 25),
                    suffixIcon: Icon(Icons.password),
                    iconColor: Color(0xFF6495ED),
                    border: OutlineInputBorder(),
                  ),
                )),
            ElevatedButton(
              onPressed: () {
                Cadastro(txtCadNome.text, txtCadEmail.text, txtCadSenha.text);
                LoginController().criarConta(
                    context, txtCadNome.text, txtCadEmail.text, txtCadSenha);
                setState(() {
                  if (txtCadEmail.text.isEmpty ||
                      txtCadNome.text.isEmpty ||
                      txtCadSenha.text.isEmpty) {
                    mensagem(
                      'Preencha todos os campos',
                      Colors.redAccent,
                    );
                  } else {
                    mensagem(
                      'Cadastro realizado com Sucesso!',
                      Colors.blueAccent.shade100,
                    );
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 25),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                backgroundColor: Color(0xFF6495ED),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
              child: Text('Salvar'),
            )
          ],
        ),
      ),
    );
  }

  mensagem(msg, cor) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        //: TextAlign.center,
      ),
      duration: Duration(seconds: 5),
      backgroundColor: cor,
    ));
  }
}
