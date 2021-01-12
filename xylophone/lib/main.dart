import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  void playSound(int index) {
    final player = AudioCache();
    player.play('note$index.wav');
  }

  Expanded buildKey(int index, Color colour) {
    return Expanded(
      child: FlatButton(
          color: colour,
          onPressed: () {
            playSound(index);
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(1, Colors.red),
              buildKey(2, Colors.orange[800]),
              buildKey(3, Colors.yellow[800]),
              buildKey(4, Colors.green[700]),
              buildKey(5, Colors.teal),
              buildKey(6, Colors.blue[600]),
              buildKey(7, Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
