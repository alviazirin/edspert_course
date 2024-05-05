import 'package:edspert_course/bloc/banner/banner_bloc.dart';
import 'package:edspert_course/bloc/course/course_bloc.dart';
import 'package:edspert_course/bloc/exercise/exercise_bloc.dart';
import 'package:edspert_course/core/appcolors.dart';
import 'package:edspert_course/data/data_sources/banner_data_source.dart';
import 'package:edspert_course/data/repositories/banner_repository_impl.dart';
import 'package:edspert_course/domain/usecases/get_bannerlist_usecase.dart';
import 'package:edspert_course/models/banner_response_model.dart';
import 'package:edspert_course/repos/banner_repository.dart';
import 'package:edspert_course/repos/course_repository.dart';
import 'package:edspert_course/repos/exercise_repository.dart';
import 'package:edspert_course/screens/exercise_list_screen.dart';
import 'package:edspert_course/widgets/image_network_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

import '../models/course_response_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => CourseBloc(courseRepository: CourseRepo())
                ..add(GetCourseEvent())),
          BlocProvider(
              create: (context) => BannerBloc(
                  getBannerListUsecase: GetBannerListUseCase(
                      BannerRepositoryImpl(BannerDataSource())))
                ..add(GetBannerEvent())),
          BlocProvider(
              create: (context) =>
                  ExerciseBloc(exerciseRepository: ExerciseRepository())
                    ..add(GetExerciseEvent())),
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
                          _buildCourseList(state.courseList)
                        else
                          const Center(
                            child: CircularProgressIndicator(),
                          ),
                        const Gap(8),
                        BlocBuilder<BannerBloc, BannerState>(
                          builder: (context, state) {
                            return Column(
                              children: [
                                const Text(
                                  "Terbaru",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                const Gap(8),
                                if (state is BannerLoadSuccess)
                                  _buildBannerList(state.listBanner)
                                else
                                  const Center(
                                    child: CircularProgressIndicator(),
                                  )
                              ],
                            );
                          },
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

  SizedBox _buildBannerList(List<BannerItem> bannerList) {
    return SizedBox(
      height: 146,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          // List bannerList = state.listBanner;
          final banner = bannerList[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: ImageNetworkWidget(
              imageUrl: banner.eventImage ?? '',
              height: 146,
              width: 284,
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemCount: bannerList.length,
      ),
    );
  }

  Widget _buildCourseList(List<CourseItem> listData) {
    final courseCount = listData.length > 3 ? 3 : listData.length;
    return listData.isEmpty
        ? const CircularProgressIndicator()
        : ListView.builder(
            itemCount: courseCount,
            itemBuilder: (context, index) {
              CourseItem course = listData[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: const ExerciseListScreen(),
                          type: PageTransitionType.leftToRight));
                },
                child: SizedBox(
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
                        ))),
              );
            },
          );
  }
}
