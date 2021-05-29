import 'dart:math';

import 'package:bulingo/data/cards.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

import '../../entity/score.dart';

class FirstGame extends StatefulWidget {
  @override
  _FirstGameState createState() => _FirstGameState();
}

class _FirstGameState extends State<FirstGame> {
  void initState() {
    random();
    super.initState();
  }

  Color oneCardColor = Colors.white;
  Color twoCardColor = Colors.white;
  Color threeCardColor = Colors.white;
  Color fourCardColor = Colors.white;

  Map<int, String> assetMap = {
    cards[0].id: cards[0].image,
    cards[1].id: cards[1].image,
    cards[2].id: cards[2].image,
    cards[3].id: cards[3].image,
  };

  var element;
  var rand;
  int activeCard = 0;
  bool buttonActivation = false;

  oneTapped() {
    setState(() {
      oneCardColor = Colors.red;
      twoCardColor = Colors.white;
      threeCardColor = Colors.white;
      fourCardColor = Colors.white;
      activeCard = 1;
      buttonActivation = true;
    });
  }

  twoTapped() {
    setState(() {
      oneCardColor = Colors.white;
      threeCardColor = Colors.white;
      twoCardColor = Colors.red;
      fourCardColor = Colors.white;
      activeCard = 3;
      buttonActivation = true;
    });
  }

  threeTapped() {
    setState(() {
      oneCardColor = Colors.white;
      threeCardColor = Colors.red;
      twoCardColor = Colors.white;
      fourCardColor = Colors.white;
      activeCard = 2;
      buttonActivation = true;
    });
  }

  fourTapped() {
    setState(() {
      oneCardColor = Colors.white;
      threeCardColor = Colors.white;
      twoCardColor = Colors.white;
      fourCardColor = Colors.red;
      activeCard = 4;
      buttonActivation = true;
    });
  }

  random() {
    var lists = [cards[0].bur, cards[1].bur, cards[2].bur, cards[3].bur];
    setState(() {
      rand = Random().nextInt(lists.length);
      element = lists[rand];
    });
  }

  animatedContainer() {
    setState(() {
      AnimatedContainer(
        duration: Duration(seconds: 1),
        height: 500,
        width: 400,
        color: Colors.red,
        child: Text("animated"),
      );
    });
  }

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

  createRightAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(child: Text("Верно!:D")),
            content: Text(
              "Держитесь в том же духе!",
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
              "Вы сделали $result из 5 заданий!",
              textAlign: TextAlign.center,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Score score = context.watch<Score>();
    int number = score.number + 1;
    if (score.number >= 5) {
      score.newGame();
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('FirstPlay'),
        ),
        body: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              "Задание $number/5",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.width * 0.1),
              child: Text('Выберите ' + element.toString(),
                  style: TextStyle(fontSize: 30))),
          Column(
            children: <Widget>[
              Row(
                children: [
                  Container(
                    color: oneCardColor,
                    child: InkWell(
                        child: customCard(context, assetMap[1].toString()),
                        onTap: () => oneTapped()),
                  ),
                  Container(
                    color: threeCardColor,
                    child: InkWell(
                        child: customCard(context, assetMap[2].toString()),
                        onTap: () => threeTapped()),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    color: twoCardColor,
                    child: InkWell(
                        child: customCard(context, assetMap[3].toString()),
                        onTap: () => twoTapped()),
                  ),
                  Container(
                    color: fourCardColor,
                    child: InkWell(
                        child: customCard(context, assetMap[4].toString()),
                        onTap: () => fourTapped()),
                  ),
                ],
              ),
            ],
          ),
          Container(
              child: ElevatedButton(
            child: Text("Проверить"),
            onPressed: (buttonActivation && (rand + 1 == activeCard))
                ? () {
                    createRightAlertDialog(context);
                    context.read<Score>().nextGame(1);
                    if (score.number == 5) {
                      showResultAlertDialog(context, score.count);
                    } else {
                      Future.delayed(Duration(seconds: 2),
                          () => Navigator.pushNamed(context, '/firstgame'));
                    }
                  }
                : () {
                    print({
                      cards[0].id: cards[0].image,
                      cards[1].id: cards[1].image,
                      cards[2].id: cards[2].image,
                      cards[3].id: cards[3].image
                    });
                    createWrongAlertDialog(context);
                    context.read<Score>().nextGame(0);
                    if (score.number == 5) {
                      showResultAlertDialog(context, score.count);
                      Future.delayed(Duration(seconds: 5),
                          () => Navigator.pushNamed(context, '/home'));
                    } else {
                      Future.delayed(Duration(seconds: 2),
                          () => Navigator.pushNamed(context, '/firstgame'));
                    }
                  },
          ))
        ]));
  }
}

Widget customCard(BuildContext context, String asset) {
  return Container(
    padding: EdgeInsets.all(3),
    child: Image.asset(asset),
    width: MediaQuery.of(context).size.width * 0.48,
    height: MediaQuery.of(context).size.width * 0.48,
  );
}
