import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tix_tac_toe/view/screen/firstscreen.dart';

void main() {
  runApp(const XO());
}

class XO extends StatelessWidget {
  const XO({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Firstscreen() ,
    );
  }
}
