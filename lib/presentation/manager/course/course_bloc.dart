import 'package:bloc/bloc.dart';
import 'package:edspert_course/repos/course_repository.dart';
import 'package:meta/meta.dart';

import '../../../models/models.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRepo courseRepository;
  CourseBloc({required this.courseRepository}) : super(CourseInitial()) {
    on<CourseEvent>((event, emit) async {
      if (event is GetCourseEvent) {
        emit(CourseLoading());
        final result = await courseRepository.getCourseList();
        emit(CourseLoadSuccess(courseList: result.data ?? []));
      }
    });
  }
}
