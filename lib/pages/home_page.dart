import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [Colors.white, Colors.blueGrey],
          ),
        ),
        child: Center(
          child: Image.asset('assets/images/toolboxImage.webp'),
        ),
      ),
    );
  }
}
