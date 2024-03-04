import 'package:ui_task/main.dart';
import 'package:flutter/material.dart';

class user_profile extends StatelessWidget {
  final double size;
  final String imgurl;

  const user_profile({super.key, required this.size, required this.imgurl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size/10- size/2),
      child: Image.asset(
        imgurl,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),

    );
  }
}
