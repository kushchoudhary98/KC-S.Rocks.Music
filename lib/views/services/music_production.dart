import 'package:flutter/material.dart';
import 'package:s_rocks_music/utils/constants.dart';

class MusicProduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryColor,
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        foregroundColor: kprimaryTextColor,
        title: Text('Music Production'),
      ),
      body: Center(
        child: Text('You tapped on: Music Production', style: TextStyle(color: kprimaryTextColor)),
      ),
    );
  }
}