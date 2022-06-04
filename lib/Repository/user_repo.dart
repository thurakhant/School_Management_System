import 'package:school_management/DataModel/user.dart';

class UserRepo {
  static Future<User> authenticate(String mobile, String pass) async {
    return await Future.delayed(const Duration(seconds: 3)).then((value) {
      if (mobile == "2" && pass == "1") {
        Map<String, dynamic> res = {
          "id": 1,
          "name": "Thura",
          "family": "Thein Wai",
          "mobile": "123",
          "type": 1,
          "active": 1
        };
        return User.fromJson(res);
      }
      throw Exception("mobile/password was wrong");
    });
  }
}
