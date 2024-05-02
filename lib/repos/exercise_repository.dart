import 'dart:developer';

import 'package:edspert_course/core/api_constant.dart';
import 'package:edspert_course/core/dio_service.dart';
import 'package:edspert_course/models/exercise_response_model.dart';

class ExerciseRepository {
  Future<ExerciseResponse> getExercise() async {
    try {
      final response = await DioService().get(ApiContants.exercisePath);
      final data = response.data;
      return data;
    } catch (e, stack) {
      log(e.toString(), name: "getExerciseListError", stackTrace: stack);
      return ExerciseResponse();
    }
  }
}
