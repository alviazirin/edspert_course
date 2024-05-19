import 'package:edspert_course/core/core.dart';
import 'package:edspert_course/models/user_by_email_response_model.dart';

class AuthDataSource {
  Future<bool> checkIfUserRegistered(String email) async {
    try {
      final response = await DioService().get(ApiContants().user(email));
      final data = UserByEmailResponse.fromJson(response.data);
      if (data.status == 0) return false;
      return true;
    } catch (e) {
      return false;
    }
  }
}
