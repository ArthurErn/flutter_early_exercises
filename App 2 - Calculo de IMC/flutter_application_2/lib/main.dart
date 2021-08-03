import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seus dados";

  void _resetField() {
    setState(() {
      weightController.text = "";
      heightController.text = "";
      _infoText = "Informe seus dados";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      print(imc);

      if (imc < 18.6) {
        _infoText = "Abaixo do peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = "Peso Ideal (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = "Levemente acima do peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 29.6 && imc < 34.9) {
        _infoText = "Obesidade Grau I (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 34.6 && imc < 39.9) {
        _infoText = "Obesidade Grau II (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 40.0) {
        _infoText = "Obesidade Grau III (${imc.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60.0,
          title: Text("Calculadora de IMC"),
          centerTitle: true,
          backgroundColor: Colors.teal[600],
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _resetField();
              },
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(17.0, 0.0, 17.0, 0.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(Icons.person_outline,
                      size: 160.0, color: Colors.teal[600]),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Peso (KG)",
                          labelStyle: TextStyle(color: Colors.teal[800])),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.teal[600], fontSize: 20),
                      controller: weightController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Insira sua altura";
                        }
                      }),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Altura (CM)",
                          labelStyle: TextStyle(color: Colors.teal[800])),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.teal[600], fontSize: 20),
                      controller: heightController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Insira seu peso";
                        }
                      }),
                  Padding(
                      padding: EdgeInsets.only(top: 50, bottom: 20.0),
                      child: Container(
                          height: 50.0,
                          child: ElevatedButton(
                              onPressed: () {
                                if(_formKey.currentState.validate())
                                  _calculate();
                              },
                              child: Text("Calcular",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25.0)),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.teal[600]),
                            )
                        )
                    ),
                  Text(
                    _infoText,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.teal[600], fontSize: 25.0),
                  ),
                ],
              ),
            )));
  }
}
