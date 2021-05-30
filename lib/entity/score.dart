import 'package:flutter/material.dart';

class Score with ChangeNotifier {
  int _count = 0;
  int _numberOfGame = 0;
  int _currentGame = 0;
  int _thirdGame = 0;

  int get count => _count;
  int get currentGame => _currentGame;
  int get number => _numberOfGame;
  int get thirdGame => _thirdGame;

  nextGame(int result) {
    _count += result;
    _numberOfGame++;
    notifyListeners();
  }

  newGame() {
    _count = 0;
    _numberOfGame = 0;
  }

  addCurrentGame() {
    _currentGame++;
    if (_currentGame == 3) {
      _currentGame = 0;
    }
  }

  nextThirdGame() {
    _thirdGame++;
    if (_thirdGame == 2) {
      _thirdGame = 0;
    }
  }
}
