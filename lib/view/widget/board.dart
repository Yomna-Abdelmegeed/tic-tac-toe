import 'package:flutter/material.dart';

class Board extends StatelessWidget {
  Board(
      {super.key,
      required this.contain,
      required this.onClick,
      required this.col,
      required this.row});
  String contain;
  Function onClick;
  int col;
  int row;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 14),
        child: ElevatedButton(
          onPressed: () {
            onClick(row, col);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.all(8),
          ),
          child: contain.isEmpty
              ? SizedBox(
                  height: double.infinity,
                )
              : Image.asset('images/$contain.png'),
        ),
      ),
    );
  }
}
