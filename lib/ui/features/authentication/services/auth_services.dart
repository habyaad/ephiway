import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../../utils/app_router/app_router.gr.dart';
import '../../../../utils/helpers.dart';
import '../../../../utils/toast_message_helper.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/services/database_services.dart';

class AuthServices{
  static void signupUser(User user) async {
    try {
      int? result = await DatabaseHelper().signUpUser(user.toJson());
      if (result != null) {
        ToastMessageHelper.showSuccess(
            "${user.username} registered successfully");
        getIt<AppRouter>().pushNamed("/login-screen");
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

  static Future<Map<String, Object?>?> signinUser(Map<String, dynamic> user) async {
    try {
      Map<String, Object?>? result = await DatabaseHelper().getUser(user);
      if (result != null) {
        ToastMessageHelper.showSuccess(
            "${user["email"]} logged  in successfully");
        return result;

      } else {
        ToastMessageHelper.showError("wrong credentials");
      }
    } catch (e) {
      getIt<Logger>().e(e);
    }
    return null;
  }
}
