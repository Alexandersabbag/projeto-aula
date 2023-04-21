// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:projeto_aula/view/tela_sobre_view.dart';

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
            GestureDetector(
              onTap: () {
                //Ir para a página Lista de Pessoas Cadastradas
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: Color(0xFF6495ED),
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Icon(
                      Icons.person,
                      size: 50,
                      color: Color(0xFF6495ED),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Pessoas Cadastradas',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                //Ir para a página Lista de Tarefas
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: Color(0xFF6495ED),
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Icon(
                      Icons.list,
                      size: 50,
                      color: Color(0xFF6495ED),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Lista de Tarefas',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                //ir para a página Sobre
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: Color(0xFF6495ED),
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Icon(
                      Icons.amp_stories,
                      size: 50,
                      color: Color(0xFF6495ED),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Sobre',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutView()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: Color(0xFF6495ED),
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Icon(
                      Icons.error,
                      size: 50,
                      color: Color(0xFF6495ED),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Criar funcionalidade',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
