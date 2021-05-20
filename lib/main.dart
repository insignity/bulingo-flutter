import 'package:bulingo/second-play.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'entity/score.dart';
import 'screens/firstgame/first-game.dart';
import 'screens/auth/auth.dart';
import 'screens/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Score>(
        create: (context) => Score(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: Colors.grey,
              secondaryHeaderColor: Colors.white,
              textTheme: TextTheme(
                headline1: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                headline2: TextStyle(
                    color: Colors.white70,
                    fontSize: 10,
                    fontWeight: FontWeight.normal),
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(132, 141, 200, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.white)),
              )),
          routes: {
            '/auth': (BuildContext context) => AuthorizationPage(),
            '/home': (BuildContext context) => HomePage(),
            '/firstgame': (BuildContext context) => FirstGame(),
            '/secondgame': (BuildContext context) => SecondGame(),
          },
          home: AuthorizationPage(),
        ));
  }
}
