import 'package:flutter/material.dart';
import 'package:tix_tac_toe/screen/gamescreen.dart';

class XoWidget extends StatelessWidget {
  XoWidget({super.key, required this.player});
  final String player;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Gamescreen.routeNamed, arguments: player);
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.white,
        ),
        child: Image.asset('images/$player.png', fit: BoxFit.cover),
      ),
    );
  }
}
