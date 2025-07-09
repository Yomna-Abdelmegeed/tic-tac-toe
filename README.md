# ❌⭕ Tic-Tac-Toe – Flutter Mobile Game (with GetX)

A sleek and interactive Tic-Tac-Toe (XO) game built using **Flutter** and **GetX**. This two-player mobile app features smooth turn-based gameplay, responsive UI, and automatic win/draw logic.

🎨 **Behance Case Study**  
[Tic-Tac-Toe Mobile Game – Built with Flutter & GetX](https://www.behance.net/gallery/229937919/-Tic-Tac-Toe-Mobile-Game-Built-with-Flutter-GetX)

---

## 📱 Features

- 🎮 Two-player turn-based gameplay
- ⚡ Reactive state management with GetX
- ✅ Automatic win and draw detection
- 🔁 Auto-reset board after each round
- 🎨 Color-coded player turns (X and O)
- 📱 Responsive mobile UI with Flutter

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK installed → [Flutter Install Guide](https://flutter.dev/docs/get-started/install)
- A working emulator or physical device

### Installation

```bash
git clone https://github.com/Yomna-Abdelmegeed/tic-tac-toe.git
cd tic-tac-toe
flutter pub get
flutter run
```
---

## 🧠 Core Logic Snippet

```dart
RxInt counter = 0.obs;
RxString palyer = ''.obs;
RxString winTitle = ''.obs;
RxList<List<String>> board = [
  ['', '', ''],
  ['', '', ''],
  ['', '', ''],
].obs;
```

The game controller handles player switching, win detection, and board state reactively using GetX.

---

## 🧑‍💻 Author

**Yomna Abdelmegeed**  
- 💼 [GitHub](https://github.com/Yomna-Abdelmegeed)  
- 🎨 [Behance](https://www.behance.net/gallery/229937919/-Tic-Tac-Toe-Mobile-Game-Built-with-Flutter-GetX)

