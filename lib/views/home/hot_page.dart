import 'package:flutter/material.dart';

class HotPage extends StatelessWidget {
  const HotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF161824),
      child: const Center(
        child: Text(
          '热门内容敬请期待~',
          style: TextStyle(fontSize: 22, color: Colors.white70, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
} 