import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projeto_aula/view/tela_login.dart';
import 'package:projeto_aula/view/tela_menu_view.dart';

import '../view/util.dart';

class LoginController {
  criarConta(context, nome, email, senha) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: senha)
        .then((resultado) {
      FirebaseFirestore.instance.collection('users').add({
        'uid': resultado.user!.uid,
        'nome': nome,
      });
      //sucesso(context, 'Usuário adicionado') snackbar do cadrastro
      Navigator.pop(context);
    }).catchError((e) {
      switch (e.code) {
        case 'e-mail-already-in-use':
          //inserir uma snackbar ou alert dialog de mensagem de erro de usuário não encontrado
          break;
        default:
        //inserir uma snackbar ou alert dialog de mensagem de erro
      }
    });
  }

  login(context, email, senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((value) {
      sucesso(context, 'Usuário autenticado com sucesso!');
      //snackbar ou dialog de usuário logado com sucesso
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MenuView()));
      //Navigator.pop(context);
    }).catchError((e) {
      switch (e.code) {
        case 'user-not-found':
          //usuário não criado
          erro(context, 'Usuário não encontrado.');
          break;
        default:
          //outro erro qualquer
          erro(context, 'ERRO: ${e.code.toString()}');
      }
    });
  }

  esqueceuSenha(context, String email) {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) {
      //mensagem de sucesso
    }).catchError((e) {
      //mesagem de erro
    });
    Navigator.pop(context);
  }

  logout() {
    FirebaseAuth.instance.signOut();
  }

  idUsuario() {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  Future<String> usuarioLogado() async {
    var usuario = '';
    await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: idUsuario())
        .get()
        .then(
      (resultado) {
        usuario = resultado.docs[0].data()['nome'] ?? '';
      },
    );
    return usuario;
  }
}
