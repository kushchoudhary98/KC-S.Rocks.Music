import 'package:flutter/material.dart';
import 'package:s_rocks_music/utils/constants.dart';

class MixingMastering extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryColor,
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        foregroundColor: kprimaryTextColor,
        title: Text('Mixing & Mastering'),
      ),
      body: Center(
        child: Text('You tapped on: Mixing & Mastering', style: TextStyle(color: kprimaryTextColor)),
      ),
    );
  }
}