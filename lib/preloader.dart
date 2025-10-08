import 'package:alertdigital/webview.dart';
import 'package:flutter/material.dart';

class PreLoader extends StatefulWidget {
  const PreLoader({super.key});

  @override
  State<PreLoader> createState() => _PreLoaderState();
}

class _PreLoaderState extends State<PreLoader>
    with SingleTickerProviderStateMixin {
  final double coverHeight = 280;
  final double profileHeight = 144;
  Color green = Color(0xFF2ECC71);
  late double height;
  late double width;

  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    animation = Tween<double>(begin: 0, end: 2 * 3.14).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.linear,
      ),
    );

    animationController.repeat();

    // Navigate to WebViewExample after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WebViewExample()),
      );
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: green,
      body: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          // Calculate the scale value based on the animation value
          double scale = 1.0 + 0.5 * (1 - (animation.value / (2 * 3.14)));

          return Transform.scale(
            scale: scale,
            child: Center(
              child: Container(
                color: green,
                child: Image.asset(
                  'assets/logo.jpg',
                  height: height * 0.17,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
