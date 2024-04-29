import 'package:edspert_course/bloc/course/course_bloc.dart';
import 'package:edspert_course/repos/course_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  CourseBloc(courseRepository: CourseRepository())
                    ..add(GetCourseEvent()))
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hai, Altop',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Selamat Datang',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: CircleAvatar(radius: 16),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: [
                BlocBuilder<CourseBloc, CourseState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Pilih Course',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                if (state is CourseLoadSuccess) {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           AllCourseListScreen(
                                  //         courseList: state.courseList,
                                  //       ),
                                  //     ));
                                }
                              },
                              child: const Text('Lihat Semua'),
                            )
                          ],
                        ),
                        if (state is CourseLoadSuccess)
                          SizedBox(
                            height: 200,
                            child: _buildCourseList(),
                          )
                        else
                          const Center(
                            child: CircularProgressIndicator(),
                          )
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }

  Widget _buildCourseList() {
    return ListView(
      children: [],
    );
  }
}
