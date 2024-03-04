import 'package:flutter/material.dart';
import 'package:ui_task/Screen/home_Screen.dart';
import 'package:ui_task/constans.dart';

void main() {
  runApp(const ui_task());
}
class ui_task extends StatefulWidget {
  const ui_task({super.key});

  @override
  State<ui_task> createState() => _ui_taskState();
}

class _ui_taskState extends State<ui_task> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor:KAppBar,
            iconTheme: IconThemeData(color: Colors.black, size: 28),
          )
        ),
      home: home_screen(),

    );
  }
}

