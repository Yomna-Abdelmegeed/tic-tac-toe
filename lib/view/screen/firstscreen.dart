import 'package:flutter/material.dart';
import 'package:tix_tac_toe/view/widget/xo_widget.dart';

class Firstscreen extends StatelessWidget {
  static const routeNamed = 'frist';
  const Firstscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8, 1),
          colors: <Color>[
            Color.fromRGBO(0, 210, 255, 1),
            Color.fromRGBO(58, 123, 213, 1),
          ],
          tileMode: TileMode.mirror,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/xo.png'), fit: BoxFit.cover),
                ),
                child: Text(
                  'Tix-Tac-Toe',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
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
                  SizedBox(height: 48)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
