import 'package:flutter/material.dart';
import 'package:tix_tac_toe/view/widget/board.dart';

class Gamescreen extends StatefulWidget {
  static const routeNamed = 'game';

  const Gamescreen({super.key});

  @override
  State<Gamescreen> createState() => _GamescreenState();
}

class _GamescreenState extends State<Gamescreen> {
  List<List<String>> board = [
    ['', '', ''],
    ['', '', ''],
    ['', '', ''],
  ];
  int counter = 0;
  late String palyer;
  bool isWin = false;
  late String normalTitle;
  String? winTitle = null;
  bool bloked = false;
  @override
  Widget build(BuildContext context) {
    palyer = ModalRoute.of(context)?.settings.arguments as String;
    normalTitle = winTitle == null
        ? 'Player ${counter.isEven ? palyer == 'x' ? 'X' : 'O' : palyer == 'x' ? 'O' : 'X'}’s Turn'
        : winTitle!;
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 210, 255, 1),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundColor: counter.isEven
                  ? palyer == 'x'
                      ? Color(0xffF54D62)
                      : Color(0xff87E43A)
                  : palyer == 'x'
                      ? Color(0xff87E43A)
                      : Color(0xffF54D62),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/human.jpeg'),
                radius: 50,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              normalTitle,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(44),
                  image: DecorationImage(
                      image: AssetImage(
                        'images/containerbg.png',
                      ),
                      fit: BoxFit.fill),
                ),
                child: Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Board(
                              contain: board[0][0],
                              col: 0,
                              row: 0,
                              onClick: onClicked,
                            ),
                            Board(
                              contain: board[0][1],
                              col: 1,
                              row: 0,
                              onClick: onClicked,
                            ),
                            Board(
                              contain: board[0][2],
                              col: 2,
                              row: 0,
                              onClick: onClicked,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Board(
                              contain: board[1][0],
                              col: 0,
                              row: 1,
                              onClick: onClicked,
                            ),
                            Board(
                              contain: board[1][1],
                              col: 1,
                              row: 1,
                              onClick: onClicked,
                            ),
                            Board(
                              contain: board[1][2],
                              col: 2,
                              row: 1,
                              onClick: onClicked,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Board(
                              contain: board[2][0],
                              col: 0,
                              row: 2,
                              onClick: onClicked,
                            ),
                            Board(
                              contain: board[2][1],
                              col: 1,
                              row: 2,
                              onClick: onClicked,
                            ),
                            Board(
                              contain: board[2][2],
                              col: 2,
                              row: 2,
                              onClick: onClicked,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  onClicked(row, col) async {
    late String symbol;
    if (board[row][col].isNotEmpty || bloked) {
      return;
    } else if (counter.isEven) {
      symbol = palyer == 'x' ? 'x' : 'o';
    } else {
      symbol = palyer == 'x' ? 'o' : 'x';
    }
    board[row][col] = symbol;
    isWin = checkwinner(symbol);
    if (isWin) {
      winTitle = '${symbol.toUpperCase()} is Winner';
      setState(() {});
      bloked = true;
      await Future.delayed(Duration(seconds: 3));
      clearBoard();
      setState(() {});
      return;
    }
    if (counter == 8) {
      winTitle = 'Draw';
      setState(() {});
      await Future.delayed(Duration(seconds: 3));
      clearBoard();
      setState(() {});
      return;
    }

    setState(() {});
    counter++;
  }

  void clearBoard() {
    counter = 0;
    winTitle = null;
    bloked = false;
    isWin = false;
    board = [
      ['', '', ''],
      ['', '', ''],
      ['', '', ''],
    ];
  }

  bool checkwinner(symbol) {
    for (int i = 0; i < 3; i++) {
      if (board[i][i] == symbol &&
          ((board[i][(i + 1) % 3] == symbol &&
                  board[i][(i + 2) % 3] == symbol) ||
              (board[(i + 1) % 3][i] == symbol &&
                  board[(i + 2) % 3][i] == symbol) ||
              (board[(i + 1) % 3][(i + 1) % 3] == symbol &&
                  board[(i + 2) % 3][(i + 2) % 3] == symbol))) {
        return true;
      }

      if (i == 1 &&
          board[i][i] == symbol &&
          board[i - 1][i + 1] == symbol &&
          board[i + 1][i - 1] == symbol) {
        return true;
      }
    }
    return false;
  }
}
