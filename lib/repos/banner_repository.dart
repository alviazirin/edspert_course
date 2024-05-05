// import 'dart:developer';

// import 'package:edspert_course/core/api_constant.dart';
// import 'package:edspert_course/core/dio_service.dart';
// import 'package:edspert_course/models/banner_response_model.dart';

// class BannerRepository {
//   Future<BannerResponse> getBannerList() async {
//     try {
//       final response = await DioService().get(ApiContants.bannerPath);
//       final data = BannerResponse.fromJson(response.data);
//       return data;
//     } catch (e, stack) {
//       log(e.toString(), name: "getBannerListError", stackTrace: stack);
//       return BannerResponse();
//     }
//   }
// }
