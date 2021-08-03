import 'package:flutter/material.dart';

class BuildSearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        hintText: 'Pesquisar',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: color.withOpacity(0.7))
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: color.withOpacity(0.7))
        )
      ),
    );
  }
}
