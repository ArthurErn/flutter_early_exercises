import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: const Key('materialApp'),
      debugShowCheckedModeBanner: false,
      title: 'Widget Test',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _hideButton = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController field = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        key: const Key('appBar'),
        title: const Text('Testes de Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: TextField(
                key: const Key('textField'),
                controller: field,
                decoration: const InputDecoration(
                  hintText: 'Pesquisa',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20, width: 1),
            _hideButton
                ? const Center()
                : SizedBox(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                        key: const Key('buttonKey'),
                        onPressed: () {},
                        child: const Text('Botão'))),
            const SizedBox(height: 20, width: 1),
            SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                    key: const Key('hideButton'),
                    onPressed: () {
                      setState(() {
                        _hideButton = !_hideButton;
                      });
                    },
                    child: const Text('Esconder Botão')))
          ],
        ),
      ),
    );
  }
}
