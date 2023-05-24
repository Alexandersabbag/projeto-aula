// ignore_for_file: unused_import, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:projeto_aula/view/tela_login.dart';
import 'package:projeto_aula/view/tela_menu_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projeto_aula/firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginView(),
  ));
}

//FAZER O LOGOUT (CRIAR INTERFACE DE LOGOUT)
//ID DO USUÁRIO LOGADO 
//NOME DO USUÁRIO LOGADO (CRIAR INTERFACE COM O NOME DO USUÁRIO LOGADO)