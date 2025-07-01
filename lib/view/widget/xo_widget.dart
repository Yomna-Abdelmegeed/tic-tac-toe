import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tix_tac_toe/view/screen/gamescreen.dart';

class XoWidget extends StatelessWidget {
 const XoWidget({super.key, required this.player});
  final String player;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(Gamescreen(), arguments: player);
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
