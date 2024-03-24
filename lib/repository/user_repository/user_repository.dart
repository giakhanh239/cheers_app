import 'package:freelance/models/user.dart';
import 'package:freelance/service/api/api_path.dart';
import 'package:freelance/service/api/api_service.dart';

class UserRepository {
  static Future<dynamic> updateProfile(User user) async {
    final response =
        await ApiService().put(ApiPath.updateProfile, data: user.toJson());
    final access = response.data;
    return access;
  }
}
