import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snapshat_like/ui/pages/home/Login/login_page.dart';
import 'package:snapshat_like/ui/pages/home/presentation/presentation_page.dart';
import 'ui/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const PresentationPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
