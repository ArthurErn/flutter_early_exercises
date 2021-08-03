import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _infoText = "Pode entrar!";
  int _people = 0;

  void changePeople(int delta) {
    setState(() {
      _people += delta;

      if (_people < 0) {_infoText = "Mundo invertido";}
      else if (_people <= 10) {_infoText = "Pode entrar";}
      else {_infoText = "Lotado!";}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image.asset(
        "lib/images/restaurant.jpg",
        fit: BoxFit.cover,
        height: 1000,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Pessoa: $_people",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextButton(
                  child: Text("+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white)),
                  onPressed: () {
                    changePeople(1);
                  }),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextButton(
                child: Text("-1",
                    style: TextStyle(fontSize: 40.0, color: Colors.white)),
                onPressed: () {
                  changePeople(-1);
                },
              ),
            ),
          ]),
          Text(
            _infoText,
            style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 30.0),
          )
        ],
      ),
    ]);
  }
}
