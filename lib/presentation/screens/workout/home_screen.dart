import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFEFF3F4),
        body: Text(
          'Hola',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
