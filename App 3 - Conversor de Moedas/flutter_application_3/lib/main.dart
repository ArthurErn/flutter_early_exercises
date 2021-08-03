import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const request = "https://api.hgbrasil.com/finance?format=json&key=292a8145";
void main() async {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
        hintColor: Colors.black,
        primaryColor: Colors.black,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amber[700])),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amber[700])),
          hintStyle: TextStyle(color: Colors.black),
        )),
  ));
}

Future<Map> getData() async {
  http.Response response = await http.get(request);
  return json.decode(response.body);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  double dolar;
  double euro;

  void _realChanged(String text) {
    if(text.isEmpty) {
      _clearAll();
      return;
    }
    double real = double.parse(text);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
  }

  void _dolarChanged(String text) {
    if(text.isEmpty) {
      _clearAll();
      return;
    }
    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }

  void _euroChanged(String text) {
    if(text.isEmpty) {
      _clearAll();
      return;
    }
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
  }

  void _clearAll(){
    realController.text = "";
    dolarController.text = "";
    euroController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Conversor"),
          backgroundColor: Colors.amber[700],
          centerTitle: true,
        ),
        body: FutureBuilder<Map>(
            future: getData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                      child: Text(
                    "Carregando dados...",
                    style: TextStyle(color: Colors.amber[700], fontSize: 25.0),
                  ));
                default:
                  if (snapshot.hasError) {
                    return Center(
                        child: Text(
                      "Erro ao carregar dados!",
                      style:
                          TextStyle(color: Colors.amber[700], fontSize: 25.0),
                    ));
                  } else {
                    dolar =
                        snapshot.data["results"]["currencies"]["USD"]["buy"];
                    euro =
                        snapshot.data["results"]["currencies"]["EUR"]["buy"];

                    return SingleChildScrollView(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Icon(Icons.monetization_on,
                                size: 150.0, color: Colors.amber[700]),
                            buildTextField("Reais", "R\$", realController, _realChanged),
                            Divider(),
                            buildTextField("Dólar", "US\$", dolarController,_dolarChanged),
                            Divider(),
                            buildTextField("Euros", "€", euroController, _euroChanged),
                          ]),
                    );
                  }
              }
            }));
  }
}

Widget buildTextField(
    String label, String prefix, TextEditingController c, Function f) {
  return TextField(
    controller: c,
    decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.amber[700]),
        border: OutlineInputBorder(),
        prefixText: prefix),
    style: TextStyle(fontSize: 25.0),
    onChanged: f,
    keyboardType: TextInputType.number,
  );
}
