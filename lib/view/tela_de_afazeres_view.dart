// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_aula/controller/login_controller.dart';
import 'package:projeto_aula/controller/tarefa_controller.dart';
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
  var txtDateTime = TextEditingController();

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
            StreamBuilder<QuerySnapshot>(
                stream: TarefaController().listar().snapshots(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Center(
                        child: Text('Não foi possivel carregar.'),
                      );
                    case ConnectionState.waiting:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    default:
                      final dados = snapshot.requireData;
                      if (dados.size > 0) {
                        return ListView.builder(
                            itemCount: dados.size,
                            itemBuilder: (context, index) {
                              String id = dados.docs[index].id;
                              dynamic item = dados.docs[index].data();
                              return ListTile(
                                title: Text(item['dateTime']),
                                subtitle: Text(item['tarefa']),
                                onTap: () {
                                  txtDateTime.text = item['dateTime'];
                                  txtTarefa.text = item['tarefa'];
                                  salvar(context, docId: id);
                                },
                              );
                            });
                      }
                  }
                }),
            Row(children: [
              Expanded(
                flex: 10,
                child: TextField(
                  controller: txtTarefa,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Adicione uma tarefa",
                      hintText: "Comprar pão"),
                ),
              ),
              SizedBox(width: 7),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                    onPressed: () {
                      String texto = txtTarefa.text;
                      setState(() {
                        Tarefas newTarefa = Tarefas(
                          LoginController().idUsuario(),
                          texto,
                          DateTime.now(),
                        );
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
                    novaTarefa(titulo: anotacao.tarefa),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                apagarTodasTarefas();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF6495ED),
                padding: EdgeInsets.all(23.2),
              ),
              child: Text("Apagar tudo"),
            )
          ],
        ),
      ),
    );
  }

  void apagarTodasTarefas() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Tem Certeza?"),
        content: Text("Todas as tarefas criadas serão apagadas"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancelar")),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  anotacoes.clear();
                });
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              child: Text("Sim"))
        ],
      ),
    );
  }

  void salvar(context, {docId}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Adicionar Tarefa"),
          content: SizedBox(
            height: 250,
            width: 300,
            child: Column(
              children: [
                TextField(
                  controller: txtDateTime,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: txtTarefa,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'tarefa',
                  ),
                ),
              ],
            ),
          ),
          actionsPadding: EdgeInsets.fromLTRB(20, 0, 20, 10),
          actions: [
            TextButton(
              child: Text("fechar"),
              onPressed: () {
                txtTarefa.clear();
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text("salvar"),
              onPressed: () {
                var t = Tarefas(
                  LoginController().idUsuario(),
                  txtTarefa.text,
                  txtDateTime.text as DateTime,
                );
                txtTarefa.clear();
                if (docId == null) {
                  //
                  // ADICIONAR TAREFA
                  //
                  TarefaController().adicionar(context, t);
                } else {
                  //
                  // ATUALIZAR TAREFA
                  //
                  TarefaController().atualizar(context, docId, t);
                }
              },
            ),
          ],
        );
      },
    );
  }
}
