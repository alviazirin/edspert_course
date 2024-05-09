import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_nav_state.dart';

enum HomeNav { home, discussion, profile }

class HomeNavCubit extends Cubit<HomeNav> {
  HomeNavCubit() : super(HomeNav.home);

  void navTo(HomeNav nav) {
    emit(nav);
  }
}
