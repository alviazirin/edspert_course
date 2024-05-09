import 'package:bloc/bloc.dart';
import 'package:edspert_course/models/exercise_response_model.dart';
import 'package:edspert_course/repos/exercise_repository.dart';
import 'package:meta/meta.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final ExerciseRepository exerciseRepository;
  ExerciseBloc({required this.exerciseRepository}) : super(ExerciseInitial()) {
    on<ExerciseEvent>((event, emit) async {
      if (event is GetExerciseEvent) {
        emit(ExerciseLoading());
        final result = await exerciseRepository.getExercise();
        emit(ExerciseLoadSuccess(listExercise: result.data ?? []));
      }
    });
  }
}
