import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Tween<double> animationSize;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    Future.microtask(() {});
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationSize = Tween(begin: 1, end: 2);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: TweenAnimationBuilder<double>(
            duration: const Duration(seconds: 1),
            tween: animationSize,
            builder: (context, value, child) {
              return Center(
                child: Transform.scale(
                  scale: value,
                  child: Image.asset(
                    "assets/images/edspert_logo.png",
                    width: 160,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
