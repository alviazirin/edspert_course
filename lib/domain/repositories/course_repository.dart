import 'package:edspert_course/models/course_response_model.dart';

abstract class CourseRepository {
  Future<CourseResponse> getCourseList();
}
