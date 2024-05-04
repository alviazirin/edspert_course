import 'package:edspert_course/models/banner_response_model.dart';

abstract class BannerRpository {
  Future<List<BannerItem>> getBannerList();
}
