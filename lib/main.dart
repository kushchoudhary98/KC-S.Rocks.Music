// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s_rocks_music/di/service_locator.dart';
import 'package:s_rocks_music/utils/constants.dart';
import 'package:s_rocks_music/utils/routes/route_names.dart';
import 'package:s_rocks_music/utils/routes/routes.dart';
import 'package:s_rocks_music/viewmodels/home_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Syne',
          primaryColor: kprimaryColor,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: RouteNames.main,
        onGenerateRoute: Routes.generateRoutes,
      ),
    );
  }
}