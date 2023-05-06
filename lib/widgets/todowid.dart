import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class novaTarefa extends StatelessWidget {
  novaTarefa({super.key, required this.titulo});

  final String titulo;
  final DateTime data = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 7),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey[200],
        ),
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat('dd/MM/yyyy - HH:mm').format(data),
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            Text(
              titulo,
              style: TextStyle(
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
