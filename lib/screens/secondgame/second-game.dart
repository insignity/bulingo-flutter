import 'package:bulingo/entity/score.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

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

  showWrongAlertDialog(BuildContext context) {
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

  showRightAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(child: Text("Правильно! :)")),
            content: Text(
              "Продолжайте в том духе!",
              textAlign: TextAlign.center,
            ),
          );
        });
  }

  showResultAlertDialog(BuildContext context, int result) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(child: Text("ВСЁ!")),
            content: Text(
              "Вы сделали правильно $result из 3 заданий!",
              textAlign: TextAlign.center,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Score score = context.watch<Score>();
    int game = score.currentGame;
    List<String> sentence = ["Привет, как дела?", "Меня зовут", "Я тебя люблю"];
    List<String> word1 = ['Hi', 'My', 'I'];
    List<String> word2 = ['how', 'name', 'love'];
    List<String> word3 = ['you', 'is', 'you'];
    return Scaffold(
      appBar: AppBar(title: Text("Составьте предложение")),
      body: ListView(
        children: [
          Container(
            height: 150,
            padding: EdgeInsets.only(top: 50),
            child: Center(
                child: Text(
              "Составьте предложение: ${sentence[game]}",
              style: TextStyle(
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            )),
          ),
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
                        child: Text("${word1[game]}"),
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
                        child: Text("${word2[game]}"),
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
                        child: Text("${word3[game]}"),
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
                  if (score.currentGame == 2) {
                    showResultAlertDialog(context, 2);
                    Future.delayed(const Duration(seconds: 4), () {
                      Navigator.pushNamed(context, '/home');
                    });
                  } else {
                    showRightAlertDialog(context);
                    Future.delayed(const Duration(seconds: 1), () {
                      Navigator.pushNamed(context, '/secondgame');
                    });
                    score.addCurrentGame();
                  }
                } else {
                  showWrongAlertDialog(context);
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
