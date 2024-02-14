// Importing the assets_audio_player package to play audio files
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

// The main function of the app, which runs the XylophoneApp
void main() => runApp(const XylophoneApp());

// The main widget of the app
class XylophoneApp extends StatelessWidget {
  // Constructor for the XylophoneApp widget
  const XylophoneApp({Key? key}) : super(key: key);

  // Function to play a sound based on the provided number
  // The audio file should be named as "note<number>.wav" and placed in the assets directory
  void playSound(int number) {
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/note$number.wav"),
    );
  }

  // Function to build a key of the xylophone
  // Each key has a color and a sound number associated with it
  // When a key is pressed, it plays the sound associated with its sound number
  Expanded buildKey({required Color color, required int soundNumber}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: TextButton(
          
          style: TextButton.styleFrom(backgroundColor: color),
          onPressed: () => playSound(soundNumber),
          child: Container(
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 105, 193, 29),
          appBar: AppBar(

            centerTitle: true,
            title: const Text('Xylophone', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
            backgroundColor: Color.fromARGB(255, 150, 222, 33),
          ),
          body: Column(
             children: List.generate(7, (index) => buildKey(color: Colors.primaries[index], soundNumber: index + 1)),
          ),
        ),
      ),
    );
  }
}