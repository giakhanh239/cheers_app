import 'package:freelance/models/user.dart';
import 'package:freelance/models/wallet.dart';
import 'package:freelance/service/api/api_path.dart';
import 'package:freelance/service/api/api_service.dart';

class AuthRepository {
  static Future<dynamic> auth(Wallet wallet) async {
    final response =
        await ApiService().post(ApiPath.auth, data: wallet.toJson());
    final data = response.data;
    return data;
  }
}
