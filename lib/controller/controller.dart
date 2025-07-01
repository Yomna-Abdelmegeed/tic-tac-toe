import 'package:get/get.dart';

class Controller extends GetxController {
  RxInt counter = 0.obs;
  RxString palyer = ''.obs;
  RxString winTitle = ''.obs;
  RxList<List<String>> board = [
    ['', '', ''],
    ['', '', ''],
    ['', '', ''],
  ].obs;

  bool bloked = false;
  bool isWin = false;

  onClicked(row, col) async {
    late String symbol;
    if (board[row][col].isNotEmpty || bloked) {
      return;
    } else if (counter.isEven) {
      symbol = palyer.value == 'x' ? 'x' : 'o';
    } else {
      symbol = palyer.value == 'x' ? 'o' : 'x';
    }
    board[row][col] = symbol;
    isWin = checkwinner(symbol);
    if (isWin) {
      winTitle.value = '${symbol.toUpperCase()} is Winner';
      bloked = true;
      await Future.delayed(Duration(seconds: 3));
      clearBoard();
      return;
    }
    counter++;
  //  print('counter = $counter');
    if (counter.value == 9) {
      winTitle.value = 'Draw';
      await Future.delayed(Duration(seconds: 3));
      clearBoard();
      return;
    }
  }

  void clearBoard() {
    counter.value = 0;
    winTitle.value = '';
    bloked = false;
    isWin = false;
    board.value = [
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
