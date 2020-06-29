import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'battle/battle.dart';
import 'home_page/home_page.dart';

main() async => runApp(Application());

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (_) => HomePage(),
        "/battle": (_) => Battle(),
      },
    );
  }
}
