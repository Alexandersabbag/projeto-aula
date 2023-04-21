// ignore_for_file: non_constant_identifier_names, unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projeto_aula/model/cadastrar.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class cadastrarView extends StatefulWidget {
  const cadastrarView({super.key});

  @override
  State<cadastrarView> createState() => _cadastrarViewState();
}

class _cadastrarViewState extends State<cadastrarView> {
  var txtCadNome = TextEditingController();
  var txtCadcpf_cnpj = TextEditingController();
  var txtCadEndereco = TextEditingController();
  var txtCadCidade = TextEditingController();
  var txtCadEstado = TextEditingController();
  var txtCadEmail = TextEditingController();
  var txtCadData_nasc = TextEditingController();

  var maskFormatter = new MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  int idCad = 0; //flag

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
                controller: txtCadcpf_cnpj,
                decoration: InputDecoration(
                  labelText: 'insira cpf ou cnpj',
                  labelStyle: TextStyle(fontSize: 25),
                  suffixIcon: Icon(Icons.format_indent_increase),
                  iconColor: Color(0xFF6495ED),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(90, 0, 90, 20),
              child: TextField(
                controller: txtCadEndereco,
                decoration: InputDecoration(
                  labelText: 'Endereço',
                  labelStyle: TextStyle(fontSize: 25),
                  suffixIcon: Icon(Icons.add_location),
                  iconColor: Color(0xFF6495ED),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(90, 0, 90, 20),
              child: TextField(
                controller: txtCadCidade,
                decoration: InputDecoration(
                  labelText: 'Cidade',
                  labelStyle: TextStyle(fontSize: 25),
                  suffixIcon: Icon(Icons.location_city),
                  iconColor: Color(0xFF6495ED),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(90, 0, 90, 20),
              child: TextField(
                controller: txtCadEstado,
                decoration: InputDecoration(
                  labelText: 'Estado',
                  labelStyle: TextStyle(fontSize: 25),
                  suffixIcon: Icon(Icons.local_activity),
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
                  controller: txtCadData_nasc,
                  decoration: InputDecoration(
                    labelText: 'Data de Nascimento',
                    labelStyle: TextStyle(fontSize: 25),
                    suffixIcon: Icon(Icons.calendar_month),
                    iconColor: Color(0xFF6495ED),
                    border: OutlineInputBorder(),
                  ),
                  inputFormatters: [maskFormatter],
                )),
            ElevatedButton(
              onPressed: () {
                Cadastro(
                    txtCadNome.text,
                    txtCadcpf_cnpj.text,
                    txtCadEndereco.text,
                    txtCadCidade.text,
                    txtCadEstado.text,
                    txtCadEmail.text,
                    txtCadData_nasc.text,
                    idCad);
                setState(() {
                  if (txtCadCidade.text.isEmpty ||
                      txtCadData_nasc.text.isEmpty ||
                      txtCadEmail.text.isEmpty ||
                      txtCadEndereco.text.isEmpty ||
                      txtCadEstado.text.isEmpty ||
                      txtCadNome.text.isEmpty ||
                      txtCadcpf_cnpj.text.isEmpty) {
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
                      borderRadius: BorderRadius.circular(5))),
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
