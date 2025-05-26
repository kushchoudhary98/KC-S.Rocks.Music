import 'package:flutter/material.dart';
import 'package:s_rocks_music/utils/constants.dart';

class LyricsWriting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryColor,
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        foregroundColor: kprimaryTextColor,
        title: Text('Lyrics Writing'),
      ),
      body: Center(
        child: Text('You tapped on: Lyrics Writing', 
            style: TextStyle(color: kprimaryTextColor)),
      ),
    );
  }
}