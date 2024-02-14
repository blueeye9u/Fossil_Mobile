// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Create an animation controller
    _controller = AnimationController(
      duration: Duration(seconds: 3), // Adjust the duration as needed
      vsync: this,
    );

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Image.asset("logoWhite"); // Chemin du logo
              }),
        ));
  }
}
