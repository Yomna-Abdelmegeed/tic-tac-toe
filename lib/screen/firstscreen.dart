import 'package:flutter/material.dart';
import 'package:tix_tac_toe/widget/xo_widget.dart';

class Firstscreen extends StatelessWidget {
  static const routeNamed = 'frist';
  const Firstscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/background.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Pick who goes first?',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                XoWidget(
                  player: 'x',
                ),
                XoWidget(
                  player: 'o',
                ),
              ],
            ),
            SizedBox(height: 40)
          ],
        ),
      ),
    );
  }
}
