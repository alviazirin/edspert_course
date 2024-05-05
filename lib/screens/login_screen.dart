import 'package:edspert_course/core/appcolors.dart';
import 'package:edspert_course/core/appicon.dart';
import 'package:edspert_course/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Gap(16),
              Image.asset(
                "assets/images/login_image.png",
                fit: BoxFit.fitWidth,
              ),
              const Gap(16),
              Text(
                "Selamat Datang",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const Gap(8),
              Text(
                "Selamat Datang di aplikasi Widya Edu \nAplikasi Latihan dan Konsultasi Soal",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(),
              WidgetLoginButton(
                variant: LoginButtonVariant.google,
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: const HomeScreen(),
                          type: PageTransitionType.leftToRight));
                },
              ),
              WidgetLoginButton(
                variant: LoginButtonVariant.apple,
                onTap: () {},
              ),
            ],
          ),
        ));
  }
}

class WidgetLoginButton extends StatelessWidget {
  final LoginButtonVariant variant;
  final Function()? onTap;
  const WidgetLoginButton({super.key, required this.variant, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: variant.bgColor,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: variant.borderColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(variant.iconPath),
              const Gap(16),
              Text(
                variant.title,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: variant.textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum LoginButtonVariant {
  google,
  apple;

  String get title {
    switch (this) {
      case apple:
        return "Login dengan Apple";

      default:
        return "Login dengan Google";
    }
  }

  String get iconPath {
    switch (this) {
      case apple:
        return AppIcon.iconApple.assetPath;

      default:
        return AppIcon.iconGoogle.assetPath;
    }
  }

  Color get bgColor {
    switch (this) {
      case apple:
        return AppColors.blackButton;
      default:
        return Colors.white;
    }
  }

  Color get textColor {
    switch (this) {
      case apple:
        return AppColors.offWhite;

      default:
        return AppColors.title;
    }
  }

  Color get borderColor {
    switch (this) {
      case apple:
        return AppColors.blackButton;
      default:
        return AppColors.greenSuccess;
    }
  }
}
