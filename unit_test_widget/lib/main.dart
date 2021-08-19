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
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController field = TextEditingController();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: TextField(
                key: const Key('textField'),
                controller: field,
                decoration: const InputDecoration(hintText: 'Pesquisa'),
              ),
            ),
            const SizedBox(height: 20, width: 1),
            SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                    key: const Key('buttonKey'),
                    onPressed: () {},
                    child: const Text('texto')))
          ],
        ),
      ),
    );
  }
}
