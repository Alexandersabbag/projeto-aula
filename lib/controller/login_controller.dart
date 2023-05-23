import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginController {
  criarConta(context, nome, email, senha) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: senha)
        .then((resultado) {
      FirebaseFirestore.instance.collection('user').add({
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
      //snackbar ou dialog de usuário logado com sucesso
      Navigator.pushNamed(context, 'principal');
    }).catchError((e) {
      switch (e.code) {
        case 'user-not-found':
          //usuário não criado
          break;
        default:
        //outro erro qualquer
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
        .collection('usuarios')
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
