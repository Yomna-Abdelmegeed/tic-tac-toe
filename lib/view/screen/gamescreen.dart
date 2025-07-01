import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tix_tac_toe/controller/controller.dart';
import 'package:tix_tac_toe/view/widget/board.dart';

class Gamescreen extends StatelessWidget {
  Gamescreen({super.key});

  final Controller c = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    c.palyer.value = Get.arguments as String;
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 210, 255, 1),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Obx(
            () {
              final turnSymbol = c.counter.value.isEven
                  ? (c.palyer.value == 'x' ? 'X' : 'O')
                  : (c.palyer.value == 'x' ? 'O' : 'X');

              final title = c.winTitle.isNotEmpty
                  ? c.winTitle
                  : 'Player $turnSymbol’s Turn';

              return Column(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: c.counter.isEven
                        ? c.palyer.toString() == 'x'
                            ? Color(0xffF54D62)
                            : Color(0xff87E43A)
                        : c.palyer.toString() == 'x'
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
                    title.toString(),
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
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Board(
                                  contain: c.board[0][0],
                                  col: 0,
                                  row: 0,
                                  onClick: c.onClicked,
                                ),
                                Board(
                                  contain: c.board[0][1],
                                  col: 1,
                                  row: 0,
                                  onClick: c.onClicked,
                                ),
                                Board(
                                  contain: c.board[0][2],
                                  col: 2,
                                  row: 0,
                                  onClick: c.onClicked,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Board(
                                  contain: c.board[1][0],
                                  col: 0,
                                  row: 1,
                                  onClick: c.onClicked,
                                ),
                                Board(
                                  contain: c.board[1][1],
                                  col: 1,
                                  row: 1,
                                  onClick: c.onClicked,
                                ),
                                Board(
                                  contain: c.board[1][2],
                                  col: 2,
                                  row: 1,
                                  onClick: c.onClicked,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Board(
                                  contain: c.board[2][0],
                                  col: 0,
                                  row: 2,
                                  onClick: c.onClicked,
                                ),
                                Board(
                                  contain: c.board[2][1],
                                  col: 1,
                                  row: 2,
                                  onClick: c.onClicked,
                                ),
                                Board(
                                  contain: c.board[2][2],
                                  col: 2,
                                  row: 2,
                                  onClick: c.onClicked,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          )),
    );
  }
}
