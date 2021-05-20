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
      body: Column(
        children: <Widget>[
          Row(
            children: [
              Container(
                child: InkWell(
                    child: Card(
                      child: Placeholder(
                        fallbackWidth: MediaQuery.of(context).size.width * 0.48,
                        fallbackHeight: MediaQuery.of(context).size.width * 0.5,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/firstgame');
                    }),
              ),
              Container(
                child: InkWell(
                    child: Card(
                      child: Placeholder(
                        fallbackWidth: MediaQuery.of(context).size.width * 0.48,
                        fallbackHeight: MediaQuery.of(context).size.width * 0.5,
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
                child: Card(
                  child: Placeholder(
                    fallbackWidth: MediaQuery.of(context).size.width * 0.48,
                    fallbackHeight: MediaQuery.of(context).size.width * 0.5,
                  ),
                ),
              ),
              Container(
                child: Card(
                  child: Placeholder(
                    fallbackWidth: MediaQuery.of(context).size.width * 0.48,
                    fallbackHeight: MediaQuery.of(context).size.width * 0.5,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
