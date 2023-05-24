import 'package:flutter/material.dart';

Widget LoginWidField({
  required IconData icone,
  required TextEditingController texto,
  required String lblTxt,
  VoidCallback? onPressed,
}) {
  return Container(
    child: InkWell(
      onTap: onPressed,
      child: TextField(
        controller: texto,
        decoration: InputDecoration(
          labelText: lblTxt,
          labelStyle: TextStyle(fontSize: 30),
          suffixIcon: Icon(icone),
          iconColor: Color(0xFF6495ED),
          border: OutlineInputBorder(),
        ),
      ),
    ),
  );
}
