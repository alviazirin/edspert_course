import 'package:edspert_course/core/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    logThis('onCreate -- ${bloc.runtimeType}', name: "BLOCStatus");
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logThis('onChange -- ${bloc.runtimeType}, $change', name: "BLOCStatus");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
    super.onTransition(bloc, transition);
    logThis('onTransition -- ${bloc.runtimeType}, $transition',
        name: "BLOCStatus");
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);

    logThis('onEvent -- ${bloc.runtimeType}, $event', name: "BLOCStatus");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    logThis('onError -- ${bloc.runtimeType}, $error', name: "BLOCStatus");
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    logThis('onClose -- ${bloc.runtimeType}', name: "BLOCStatus");
  }
}
