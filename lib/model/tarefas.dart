class Tarefas {
  final String uid;
  final String tarefa;
  final DateTime dateTime;

  Tarefas({required this.uid, required this.tarefa, required this.dateTime});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'tarefa': tarefa,
      'dateTime': dateTime.toIso8601String()
    };
  }

  factory Tarefas.fromJson(Map<String, dynamic> json) {
    return Tarefas(
        uid: json['uid'],
        tarefa: json['tarefa'],
        dateTime: DateTime.parse(json['dateTime']));
  }
}
