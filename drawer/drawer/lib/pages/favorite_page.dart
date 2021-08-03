import 'package:flutter/material.dart';
import '../builder/drawer.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerNav(),
      appBar: AppBar(
        title: Text("Favoritos"),
        backgroundColor: Colors.deepPurple[400],
        centerTitle: true
      ),
    );
  }
}
