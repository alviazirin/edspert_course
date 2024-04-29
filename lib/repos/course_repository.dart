import 'dart:developer';

import 'package:edspert_course/core/api_constant.dart';
import 'package:edspert_course/core/dio_service.dart';
import 'package:edspert_course/models/course_response_model.dart';

class CourseRepository {
  Future<CourseResponse> getCourseList() async {
    try {
      final response = await DioService().get(ApiContants.coursePath);
      final data = CourseResponse.fromJson(response.data);
      return data;
    } catch (e, stack) {
      log(e.toString(), name: "getCourseListError", stackTrace: stack);
      return CourseResponse();
    }
  }
}
