part of 'banner_bloc.dart';

@immutable
sealed class BannerState {}

final class BannerInitial extends BannerState {}

final class BannerLoading extends BannerState {}

final class BannerLoadSuccess extends BannerState {
  final List<BannerItem> listBanner;

  BannerLoadSuccess({required this.listBanner});
}

final class BannerLoadFailed extends BannerState {
  final String message;

  BannerLoadFailed({this.message = "Unexpected Error"});
}
