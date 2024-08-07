import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  var noteText;
  var noteSound;
  void playSound(noteNumber) {
    final player = AudioPlayer();
    player.play(
      AssetSource('note$noteNumber.wav'),
    );
  }

  Expanded noteBox(noteText, Color noteColor, noteSound) {
    return Expanded(
      child: Container(
        color: noteColor,
        child: TextButton(
          onPressed: () {
            playSound('$noteSound');
          },
          child: Text(
            '$noteText',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                noteBox('do', Colors.red, '1'),
                noteBox('re', Colors.orange, '2'),
                noteBox('mi', Colors.yellow, '3'),
                noteBox('fa', Colors.green, '4'),
                noteBox('sol', Colors.teal, '5'),
                noteBox('la', Colors.blue, '6'),
                noteBox('si', Colors.purple, '7'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
