import 'package:edspert_course/data/data_sources/banner_data_source.dart';
import 'package:edspert_course/models/banner_response_model.dart';

import '../../domain/repositories/banner_repository.dart';

class BannerRepositoryImpl implements BannerRepository {
  final BannerDataSource bannerDataSource;

  BannerRepositoryImpl(this.bannerDataSource);

  @override
  Future<List<BannerItem>> getBannerList() async {
    BannerResponse? bannerResponse = await bannerDataSource.getBannerList();
    if (bannerResponse != null) {
      return bannerResponse.data ?? [];
    } else {
      return [];
    }
  }
}
