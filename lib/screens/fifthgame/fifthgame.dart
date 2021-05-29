import 'package:flutter/material.dart';

class FifthGame extends StatefulWidget {
  @override
  _FifthGameState createState() => _FifthGameState();
}

class _FifthGameState extends State<FifthGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Разговорник"),
        ),
        body: ListView(scrollDirection: Axis.horizontal, children: [
          Container(
            width: 410,
            child: Image.asset("assets/images/sanyaloh.jpeg"),
          ),
          Container(
            width: 410,
            child: Image.asset("assets/images/sanyaloh.jpeg"),
          ),
          Container(
            width: 410,
            child: Image.asset("assets/images/sanyaloh.jpeg"),
          ),
          Container(
            width: 410,
            child: Image.asset("assets/images/sanyaloh.jpeg"),
          ),
        ]));
  }
}
