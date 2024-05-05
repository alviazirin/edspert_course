import '../../core/core.dart';
import '../../models/models.dart';

class BannerDataSource {
  Future<BannerResponse?> getBannerList() async {
    try {
      final response = await DioService().get(ApiContants.bannerPath);
      final data = BannerResponse.fromJson(response.data);
      return data;
    } catch (e, stack) {
      logThis(e.toString(), name: "getBannerListError", stackTrace: stack);
      return null;
    }
  }
}
