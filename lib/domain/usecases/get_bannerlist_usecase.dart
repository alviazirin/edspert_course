import 'package:edspert_course/models/banner_response_model.dart';

import '../repositories/domain_repositories.dart';

class GetBannerListUseCase {
  final BannerRepository repository;

  GetBannerListUseCase(this.repository);

  Future<List<BannerItem>?> call() {
    return repository.getBannerList();
  }
}
