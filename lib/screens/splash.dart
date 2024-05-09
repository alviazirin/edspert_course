import 'package:edspert_course/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

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
    return BlocListener(
      listener: listener,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: TweenAnimationBuilder<double>(
              duration: const Duration(seconds: 2),
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
              onEnd: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    PageTransition(
                        child: const LoginScreen(),
                        type: PageTransitionType.leftToRight),
                    (route) => false);
              },
            ),
          ),
        ),
      ),
    );
  }
}
