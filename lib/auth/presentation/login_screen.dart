import 'package:edspert_course/common/appicon.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
          title: Text("Login"),
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.green)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppIcon.iconGoogle.assetPath),
                      const Gap(16),
                      Text(
                        "Login dengan Google?",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
