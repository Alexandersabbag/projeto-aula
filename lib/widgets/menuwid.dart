import 'package:flutter/material.dart';

Widget MenuWid({required IconData icone, required String texto}) {
  return Container(
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
          icone,
          size: 50,
          color: Color(0xFF6495ED),
        ),
        SizedBox(
          height: 50,
        ),
        Text(
          texto,
          style: TextStyle(
            fontSize: 20,
          ),
        )
      ],
    ),
  );
}
