import 'package:flutter/material.dart';

class Score with ChangeNotifier {
  int _count = 0;
  int _numberOfGame = 0;

  int get count => _count;
  int get number => _numberOfGame;
  nextGame(int result) {
    _count += result;
    _numberOfGame++;
    notifyListeners();
  }

  newGame() {
    _count = 0;
    _numberOfGame = 0;
  }
}
