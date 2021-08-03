import 'package:drawer/builder/drawer.dart';
import 'package:flutter/material.dart';

class PeoplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerNav(),
      appBar: AppBar(
        title: Text("Pessoas"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[400]
      )
    );
  }
}