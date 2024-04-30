import 'package:edspert_course/bloc/course/course_bloc.dart';
import 'package:edspert_course/core/appcolors.dart';
import 'package:edspert_course/repos/course_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/course_response_model.dart';

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
                            child: ListView(),
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

  Widget _buildCourseList(List<CourseItem> listData) {
    final courseCount = listData.length > 3 ? 3 : listData.length;
    return listData.isEmpty
        ? const CircularProgressIndicator()
        : ListView.builder(
            itemCount: courseCount,
            itemBuilder: (context, index) {
              CourseItem course = listData[index];
              return SizedBox(
                  height: 96,
                  child: Card(
                      color: Colors.white,
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 53,
                              height: 53,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.inputBackground,
                              ),
                              child: Image.network(
                                course.urlCover ?? '',
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                  height: 100,
                                  width: 100,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    course.courseName ?? 'No Course Name',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    '${course.jumlahDone}/${course.jumlahMateri}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.label),
                                  ),
                                  const SizedBox(height: 11),
                                  const LinearProgressIndicator(
                                    value: 0.5,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )));
            },
          );
  }
}
