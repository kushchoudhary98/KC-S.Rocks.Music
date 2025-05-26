import 'package:flutter/material.dart';
import 'package:s_rocks_music/utils/constants.dart';

class Vocals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryColor,
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        foregroundColor: kprimaryTextColor,
        title: Text('Vocals'),
      ),
      body: Center(
        child: Text('You tapped on: Vocals', style: TextStyle(color: kprimaryTextColor)),
      ),
    );
  }
}