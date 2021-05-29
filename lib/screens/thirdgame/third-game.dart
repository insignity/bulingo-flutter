import 'package:chewie_audio/chewie_audio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(
    const ThirdGame(),
  );
}

class ThirdGame extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const ThirdGame({this.title = 'Chewie Audio Demo'});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _ThirdGameState();
  }
}

class _ThirdGameState extends State<ThirdGame> {
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

  Future<void> initializePlayer() async {
    _videoPlayerControllerCow =
        VideoPlayerController.asset('assets/sounds/cow.mp3');
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
    return MaterialApp(
      title: widget.title,
      theme: ThemeData.light().copyWith(
        platform: _platform ?? Theme.of(context).platform,
      ),
      home: Scaffold(
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
                    if (_textEditingController?.text == "ынах") {
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
        ]),
      ),
    );
  }
}
