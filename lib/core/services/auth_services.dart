import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

import '../../utils/helpers.dart';
import '../models/user_model.dart';
import 'database_services.dart';

class AuthServices {
  static Future signupUser(User user) async {
    try {
      int? result = await DatabaseHelper().signUpUser(user.toJson());
      if (result != null) {
        getIt<Logger>()
            .d("${user.username} registered successfully at index $result");
      }
    } catch (e) {
      getIt<Logger>().e(e);
    }
  }

  static Future signinUser(Map<String, dynamic> user) async {
    try {
      int? result = await DatabaseHelper().signInUser(user);
      if (result != null) {
        getIt<Logger>()
            .d("${user["email"]} login successful");
      }
    } catch (e) {
      getIt<Logger>().e(e);
    }
  }


}
