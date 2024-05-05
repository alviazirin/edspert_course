import 'package:edspert_course/models/banner_response_model.dart';

abstract class BannerRepository {
  Future<List<BannerItem>> getBannerList();
}
