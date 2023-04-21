import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_aula/model/tarefas.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({super.key});

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  List<TodoList> anotacao = [];
  var txtTarefa = TextEditingController();
  DateTime dataSelecionada = DateTime.now();

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
        body: Center());
  }
}
