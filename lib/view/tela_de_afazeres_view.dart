// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projeto_aula/widgets/todowid.dart';

import '../model/tarefas.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({super.key});

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  List<Tarefas> anotacoes = [];
  var txtTarefa = TextEditingController();

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
          title: Text('Tarefas'),
          centerTitle: true,
          backgroundColor: Color(0xFF6495ED),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            children: [
              Row(children: [
                Expanded(
                  flex: 10,
                  child: TextField(
                    controller: txtTarefa,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Adicione uma tarefa",
                        hintText: "Comprar pão amanhã às 6"),
                  ),
                ),
                SizedBox(width: 7),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                      onPressed: () {
                        String texto = txtTarefa.text;
                        setState(() {
                          Tarefas newTarefa =
                              Tarefas(titulo: texto, dateTime: DateTime.now());
                          anotacoes.add(newTarefa);
                        });
                        txtTarefa.clear();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF6495ED),
                          padding: EdgeInsets.all(23.2)),
                      child: Icon(
                        Icons.add,
                        size: 20,
                      )),
                ),
              ]),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView(
                  children: [
                    for (Tarefas anotacao in anotacoes)
                      novaTarefa(titulo: anotacao.titulo),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
