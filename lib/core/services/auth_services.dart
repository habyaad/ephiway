import 'package:logger/logger.dart';

import '../../utils/helpers.dart';
import '../../utils/toast_message_helper.dart';
import '../models/user_model.dart';
import 'database_services.dart';

class AuthServices {
  static Future signupUser(User user) async {
    try {
      int? result = await DatabaseHelper().signUpUser(user.toJson());
      if (result != null) {

        ToastMessageHelper.showSuccess(
            "${user.username} registered successfully");
        await Future.delayed(const Duration(seconds: 3), () {
          ToastMessageHelper.showInfo("login to access your portal");
        });
      } else {
        getIt<Logger>().e("email: ${user.email} already exist");
        ToastMessageHelper.showError("email: ${user.email} already exists");
      }
    } catch (e) {
      getIt<Logger>().e(e);
    }
  }

  static Future signinUser(Map<String, dynamic> user) async {
    try {
      int? result = await DatabaseHelper().signInUser(user);
      if (result != null) {
        ToastMessageHelper.showSuccess(
            "${user["email"]} logged  in successfully");
      } else {
        ToastMessageHelper.showError("wrong credentials");
      }
    } catch (e) {
      getIt<Logger>().e(e);
    }
  }
}
