// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import
import 'package:flutter/material.dart';
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Future.delayed(Duration.zero, () {
              Navigator.pop(context);
            });
          },
        ),
        title: Text('Menu Principal'),
        centerTitle: true,
        backgroundColor: Color(0xFF6495ED),
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
            MenuWid(icone: Icons.person, texto: "Pessoas cadastradas"),
            MenuWid(icone: Icons.list, texto: 'Lista de Tarefas'),
            MenuWid(icone: Icons.error, texto: "Implementar"),
            GestureDetector(
                onTap: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AboutView()))
                    },
                child: MenuWid(
                    icone: Icons.system_security_update, texto: "Sobre")),
          ],
        ),
      ),
    );
  }
}
