import 'package:bulingo/entity/score.dart';
import 'package:chewie_audio/chewie_audio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const ThirdGameNext(),
  );
}

class ThirdGameNext extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const ThirdGameNext({this.title = 'ThirdGame'});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _ThirdGameNextState();
  }
}

class _ThirdGameNextState extends State<ThirdGameNext> {
  TargetPlatform? _platform;
  late VideoPlayerController _videoPlayerControllerCow;
  ChewieAudioController? _chewieAudioController;
  TextEditingController? _textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _chewieAudioController!.dispose();
    super.dispose();
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

  Future<void> initializePlayer() async {
    _videoPlayerControllerCow =
        VideoPlayerController.asset('assets/sounds/cat.mp3');
    await Future.wait([_videoPlayerControllerCow.initialize()]);
    _chewieAudioController = ChewieAudioController(
      videoPlayerController: _videoPlayerControllerCow,
    );
    setState(() {
      if (_chewieAudioController != null) _chewieAudioController!.dispose();
      _videoPlayerControllerCow.pause();
      _videoPlayerControllerCow.seekTo(const Duration());
      _chewieAudioController = ChewieAudioController(
          videoPlayerController: _videoPlayerControllerCow, autoPlay: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    Score score = context.watch<Score>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(children: [
        Column(
          children: <Widget>[
            SizedBox(
              height: 100,
              child: Center(
                child: Text(
                  "Ввeдите слово которое озвучивается, для повтора нажмите на картинку",
                  style: TextStyle(fontSize: 26),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (_chewieAudioController != null)
                          _chewieAudioController!.dispose();
                        _videoPlayerControllerCow.pause();
                        _videoPlayerControllerCow.seekTo(const Duration());
                        _chewieAudioController = ChewieAudioController(
                            videoPlayerController: _videoPlayerControllerCow,
                            autoPlay: true);
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Icon(
                        Icons.arrow_right_outlined,
                        size: 200,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term'),
              controller: _textEditingController,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  print(_textEditingController?.text);
                  if (_textEditingController?.text == "куоска") {
                    showRightAlertDialog(context);
                    Future.delayed(const Duration(seconds: 4), () {
                      Navigator.pushNamed(context, '/home');
                    });
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
      ]),
    );
  }
}
