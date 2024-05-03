import 'package:edspert_course/bloc/exercise/exercise_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseListScreen extends StatelessWidget {
  const ExerciseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseBloc, ExerciseState>(
      builder: (context, state) {
        if (state is ExerciseLoadSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.listExercise.length,
            itemBuilder: (context, index) {
              final exercise = state.listExercise[index];
              return Text(exercise.exerciseTitle ?? 'No Title');
            },
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
