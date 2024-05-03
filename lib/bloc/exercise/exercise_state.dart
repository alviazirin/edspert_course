part of 'exercise_bloc.dart';

@immutable
sealed class ExerciseState {}

final class ExerciseInitial extends ExerciseState {}

final class ExerciseLoading extends ExerciseState {}

final class ExerciseLoadSuccess extends ExerciseState {
  final List<ExerciseItem> listExercise;

  ExerciseLoadSuccess({required this.listExercise});
}

final class ExerciseLoadFailed extends ExerciseState {
  final String message;

  ExerciseLoadFailed({this.message = "Error"});
}
