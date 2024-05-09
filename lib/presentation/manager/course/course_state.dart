part of 'course_bloc.dart';

@immutable
sealed class CourseState {}

final class CourseInitial extends CourseState {}

final class CourseLoading extends CourseState {}

final class CourseLoadSuccess extends CourseState {
  final List<CourseItem> courseList;

  CourseLoadSuccess({required this.courseList});
}

final class CourseLoadFailed extends CourseState {
  final String message;
  CourseLoadFailed({this.message = "Error"});
}
