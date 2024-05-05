import 'package:edspert_course/domain/repositories/course_repository.dart';
import 'package:edspert_course/models/course_response_model.dart';

import '../../core/core.dart';

class CourseRepositoryImpl implements CourseRepository {
  @override
  Future<CourseResponse> getCourseList() async {
    try {
      final response = await DioService().get(ApiContants.coursePath);
      final data = CourseResponse.fromJson(response.data);
      return data;
    } catch (e, stack) {
      logThis(e.toString(), name: "getCourseListError", stackTrace: stack);
      return CourseResponse();
    }
  }
}
