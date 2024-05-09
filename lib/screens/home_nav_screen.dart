import 'package:edspert_course/presentation/manager/home_nav/cubit/home_nav_cubit.dart';
import 'package:edspert_course/screens/discussion_screen.dart';
import 'package:edspert_course/screens/home_screen.dart';
import 'package:edspert_course/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeNavScreen extends StatelessWidget {
  const HomeNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> homeBodyWidgets = const [
      HomeScreen(),
      DiscussionScreen(),
      ProfileScreen()
    ];
    return BlocBuilder<HomeNavCubit, HomeNav>(
      builder: (context, selectedNav) {
        return Scaffold(
          body: homeBodyWidgets[selectedNav.index],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (int index) {
              context.read<HomeNavCubit>().navTo(HomeNav.values[index]);
            },
            currentIndex: selectedNav.index,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message_outlined), label: "Discussion"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),
            ],
          ),
        );
      },
    );
  }
}
