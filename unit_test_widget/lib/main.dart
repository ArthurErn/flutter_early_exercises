import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController field = TextEditingController();
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: TextField(
            key: const Key('textField'),
            controller: field,
            decoration: const InputDecoration(
              hintText: 'Pesquisa'
            ),
          ),
        ),
      ),
    );
  }
}