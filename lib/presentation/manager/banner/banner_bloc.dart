import 'package:bloc/bloc.dart';
import 'package:edspert_course/core/core.dart';
import 'package:edspert_course/domain/usecases/get_bannerlist_usecase.dart';
import 'package:edspert_course/models/banner_response_model.dart';
import 'package:meta/meta.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final GetBannerListUseCase getBannerListUsecase;

  BannerBloc({required this.getBannerListUsecase}) : super(BannerInitial()) {
    on<BannerEvent>((event, emit) async {
      if (event is GetBannerEvent) {
        emit(BannerLoading());
        final result = await getBannerListUsecase();
        if (result == null) {
          emit(BannerLoadFailed());
          return;
        }
        emit(BannerLoadSuccess(listBanner: result));
      } else if (event is GetLatestBannerEvent) {
        logThis('GetLatestBannerEvent');
      }
    });
  }
}
