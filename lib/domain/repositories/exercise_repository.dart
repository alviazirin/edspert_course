import 'package:edspert_course/models/exercise_response_model.dart';

abstract class ExerciseRepository {
  Future<ExerciseResponse> getExerciseData(String courseId);
}
