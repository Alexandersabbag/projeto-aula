// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import
import 'package:flutter/material.dart';
import 'package:projeto_aula/controller/login_controller.dart';
import 'package:projeto_aula/view/tela_de_afazeres_view.dart';
import 'package:projeto_aula/view/tela_sobre_view.dart';
import 'package:projeto_aula/widgets/menuwid.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Menu Principal'),
        centerTitle: true,
        backgroundColor: Color(0xFF6495ED),
        actions: [
          FutureBuilder<String>(
              future: LoginController().usuarioLogado(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextButton.icon(
                      onPressed: () {
                        LoginController().logout();
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.exit_to_app, color: Color(0xFFFFFFFF)),
                      label: Text(snapshot.data.toString(),
                          style: TextStyle(color: Color(0xFFFFFFFF))),
                    ),
                  );
                }
                return Text('');
              })
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(50),
        child: GridView.count(
          crossAxisSpacing: 50,
          mainAxisSpacing: 50,
          padding: EdgeInsets.all(50),
          crossAxisCount: 2,
          children: [
            MenuWid(
                icone: Icons.person,
                texto: "Pessoas cadastradas",
                onPressed: () {}),
            MenuWid(
              icone: Icons.list,
              texto: 'Lista de Tarefas',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TodoListView()));
              },
            ),
            MenuWid(icone: Icons.error, texto: "Implementar", onPressed: () {}),
            MenuWid(
              icone: Icons.system_security_update,
              texto: "Sobre",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutView()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
