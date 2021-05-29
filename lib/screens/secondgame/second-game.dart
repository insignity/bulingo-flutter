import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SecondGame extends StatefulWidget {
  @override
  _SecondGameState createState() => _SecondGameState();
}

class _SecondGameState extends State<SecondGame> {
  Offset offset1 = Offset(0, 0);
  Offset offset2 = Offset(0, 0);
  Offset offset3 = Offset(0, 0);
  int choosenWords = 0;
  bool moved1 = false;
  bool moved2 = false;
  bool moved3 = false;
  createWrongAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(child: Text("Неверно :(")),
            content: Text(
              "Старайтесь лучше у вас обязательно получится!",
              textAlign: TextAlign.center,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Составьте предложение")),
      body: ListView(
        children: [
          header,
          Container(
            width: double.infinity,
            height: 400,
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              left: 50,
            ),
            child: Row(
              children: [
                Transform.translate(
                  offset: offset1,
                  child: Padding(
                    padding: EdgeInsets.only(top: 200),
                    child: SizedBox(
                      width: 100,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          switch (choosenWords) {
                            case 0:
                              setState(() {
                                moved1 = true;
                                offset1 = Offset(0, -200);
                                choosenWords++;
                              });
                              break;
                            case 1:
                              if (moved1) {
                                setState(() {
                                  choosenWords--;
                                  moved1 = false;
                                  offset1 = Offset(0, 0);
                                });
                              } else {
                                setState(() {
                                  choosenWords++;
                                  moved1 = true;
                                  offset1 = Offset(105, -200);
                                });
                              }
                              break;
                            case 2:
                              if (moved1) {
                                setState(() {
                                  choosenWords--;
                                  moved1 = false;
                                  offset1 = Offset(0, 0);
                                });
                              } else {
                                setState(() {
                                  choosenWords++;
                                  moved1 = true;
                                  offset1 = Offset(210, -200);
                                });
                              }
                              break;
                            case 3:
                              setState(() {
                                choosenWords--;
                                moved1 = false;
                                offset1 = Offset(0, 0);
                              });
                              break;
                          }
                        },
                        child: Text("Hi"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Transform.translate(
                  offset: offset2,
                  child: Padding(
                    padding: EdgeInsets.only(top: 200),
                    child: SizedBox(
                      width: 100,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          switch (choosenWords) {
                            case 0:
                              setState(() {
                                moved2 = true;
                                offset2 = Offset(-105, -200);
                                choosenWords++;
                              });
                              break;
                            case 1:
                              if (moved2) {
                                setState(() {
                                  choosenWords--;
                                  moved2 = false;
                                  offset2 = Offset(0, 0);
                                });
                              } else {
                                setState(() {
                                  choosenWords++;
                                  moved2 = true;
                                  offset2 = Offset(0, -200);
                                });
                              }
                              break;
                            case 2:
                              if (moved2) {
                                setState(() {
                                  choosenWords--;
                                  moved2 = false;
                                  offset2 = Offset(0, 0);
                                });
                              } else {
                                setState(() {
                                  choosenWords++;
                                  moved2 = true;
                                  offset2 = Offset(110, -200);
                                });
                              }
                              break;
                            case 3:
                              setState(() {
                                choosenWords--;
                                moved2 = false;
                                offset2 = Offset(0, 0);
                              });
                              break;
                          }
                        },
                        child: Text("how"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Transform.translate(
                  offset: offset3,
                  child: Padding(
                    padding: EdgeInsets.only(top: 200),
                    child: SizedBox(
                      width: 100,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          switch (choosenWords) {
                            case 0:
                              setState(() {
                                moved3 = true;
                                offset3 = Offset(-210, -200);
                                choosenWords++;
                              });
                              break;
                            case 1:
                              if (moved3) {
                                setState(() {
                                  choosenWords--;
                                  moved3 = false;
                                  offset3 = Offset(0, 0);
                                });
                              } else {
                                setState(() {
                                  choosenWords++;
                                  moved3 = true;
                                  offset3 = Offset(-105, -200);
                                });
                              }
                              break;
                            case 2:
                              if (moved3) {
                                setState(() {
                                  choosenWords--;
                                  moved3 = false;
                                  offset3 = Offset(0, 0);
                                });
                              } else {
                                setState(() {
                                  choosenWords++;
                                  moved3 = true;
                                  offset3 = Offset(0, -200);
                                });
                              }
                              break;
                            case 3:
                              setState(() {
                                choosenWords--;
                                moved3 = false;
                                offset3 = Offset(0, 0);
                              });
                              break;
                          }
                        },
                        child: Text("you"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 300,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                if ((offset1 == Offset(0, -200)) &&
                    (offset2 == Offset(0, -200)) &&
                    (offset3 == Offset(0, -200))) {
                  Navigator.pushNamed(context, '/home');
                } else {
                  createWrongAlertDialog(context);
                }
              },
              child: Text(
                "Проверить",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

var header = Container(
  height: 150,
  padding: EdgeInsets.only(top: 50),
  child: Center(
      child: Text(
    "Составьте предложение: Привет, как дела?",
    style: TextStyle(
      fontSize: 30,
    ),
    textAlign: TextAlign.center,
  )),
);
