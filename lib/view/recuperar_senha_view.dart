// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_interpolation_to_compose_strings
import 'package:flutter/material.dart';

class RecuperarSenhaView extends StatefulWidget {
  const RecuperarSenhaView({super.key});
  @override
  State<RecuperarSenhaView> createState() => _RecuperarSenhaViewState();
}

class _RecuperarSenhaViewState extends State<RecuperarSenhaView> {
  var txtRecEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recuperar Senha'),
        centerTitle: true,
        backgroundColor: Color(0xFF6495ED),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              child: Padding(padding: EdgeInsets.all(90)),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                'Digite seu e-mail de recuperação abaixo',
                style: TextStyle(
                  color: Color(0xFF6495ED),
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 70, horizontal: 90),
              child: TextField(
                controller: txtRecEmail,
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
              height: 60,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (txtRecEmail.text.isEmpty) {
                      mensagem('Insira um e-mail', Colors.red);
                    } else {
                      mensagem('Mensagem de recuperação enviado para o e-mail.',
                          Colors.blue.shade400);
                    }
                  });
                }, //criar iteração futuro
                style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 25),
                    backgroundColor: Color(0xFF6495ED),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                child: Text('Enviar'),
              ),
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
