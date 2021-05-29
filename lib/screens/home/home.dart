import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        automaticallyImplyLeading: false,
      ),
      body: ListView(children: [
        Column(
          children: <Widget>[
            Row(
              children: [
                Container(
                  child: InkWell(
                      child: Card(
                        child: Image.asset(
                          "assets/first/horse.jpg",
                          width: MediaQuery.of(context).size.width * 0.48,
                          height: MediaQuery.of(context).size.width * 0.5,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/firstgame');
                      }),
                ),
                Container(
                  child: InkWell(
                      child: Card(
                        child: Image.asset(
                          "assets/first/horse.jpg",
                          width: MediaQuery.of(context).size.width * 0.48,
                          height: MediaQuery.of(context).size.width * 0.5,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/secondgame');
                      }),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  child: InkWell(
                      child: Card(
                        child: Image.asset(
                          "assets/first/horse.jpg",
                          width: MediaQuery.of(context).size.width * 0.48,
                          height: MediaQuery.of(context).size.width * 0.5,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/thirdgame');
                      }),
                ),
                Container(
                  child: InkWell(
                      child: Card(
                        child: Image.asset(
                          "assets/first/horse.jpg",
                          width: MediaQuery.of(context).size.width * 0.48,
                          height: MediaQuery.of(context).size.width * 0.5,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/fourthgame');
                      }),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  child: InkWell(
                      child: Card(
                        child: Image.asset(
                          "assets/first/horse.jpg",
                          width: MediaQuery.of(context).size.width * 0.48,
                          height: MediaQuery.of(context).size.width * 0.5,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/fifthgame');
                      }),
                ),
                Container(
                  child: InkWell(
                      child: Card(
                        child: Image.asset(
                          "assets/first/horse.jpg",
                          width: MediaQuery.of(context).size.width * 0.48,
                          height: MediaQuery.of(context).size.width * 0.5,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/results');
                      }),
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
