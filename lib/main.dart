import 'package:flutter/material.dart';
import 'package:tix_tac_toe/screen/firstscreen.dart';
import 'package:tix_tac_toe/screen/gamescreen.dart';

void main() {
  runApp(const XO());
}

class XO extends StatelessWidget {
  const XO({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Firstscreen.routeNamed,
      routes: {
        Firstscreen.routeNamed: (context) => Firstscreen(),
        Gamescreen.routeNamed: (context) => Gamescreen(),
      },
    );
  }
}
