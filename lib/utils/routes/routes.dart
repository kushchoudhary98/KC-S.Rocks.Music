import 'package:flutter/material.dart';
import 'package:s_rocks_music/utils/routes/route_names.dart';
import 'package:s_rocks_music/views/home/main_screen.dart';
import 'package:s_rocks_music/views/services/lyrics_writing.dart';
import 'package:s_rocks_music/views/services/mixing_mastering.dart';
import 'package:s_rocks_music/views/services/music_production.dart';
import 'package:s_rocks_music/views/services/vocals.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case (RouteNames.main):
        return MaterialPageRoute(
            builder: (BuildContext context) => MainScreen());

      case (RouteNames.musicProduction):
        return MaterialPageRoute(
            builder: (BuildContext context) => MusicProduction());

      case (RouteNames.mixingMastering):
        return MaterialPageRoute(
            builder: (BuildContext context) => MixingMastering());

      case (RouteNames.lyricsWriting):
        return MaterialPageRoute(
            builder: (BuildContext context) => LyricsWriting());

      case (RouteNames.vocals):
        return MaterialPageRoute(
            builder: (BuildContext context) => Vocals());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("No route is configured"),
            ),
          ),
        );
    }
  }
}