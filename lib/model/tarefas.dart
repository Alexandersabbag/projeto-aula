class Tarefas {
  final String uid;
  final String tarefa;
  final DateTime dateTime;

  Tarefas(this.uid, this.tarefa, this.dateTime);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'tarefa': tarefa,
      'dateTime': dateTime.toIso8601String()
    };
  }

  factory Tarefas.fromJson(Map<String, dynamic> json) {
    return Tarefas(
        json['uid'],
        json['tarefa'],
        DateTime.parse(
          json['dateTime'],
        ));
  }
}
