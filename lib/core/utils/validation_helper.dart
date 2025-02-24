import 'package:flutter/material.dart';
import 'toast_helper.dart';

class ValidationHelper {
  static bool validateLoginInputs({
    required BuildContext context,
    required String username,
    required String password,
  }) {

    if (password.length < 6) {
      ToastHelper.showWarningToast(context, "كلمة المرور يجب أن تكون على الأقل 6 أحرف");
      return false;
    }

    return true;
  }

  static bool validateSignUpInputs({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    if (name.isEmpty) {
      ToastHelper.showWarningToast(context, "الرجاء تعبئة الحقول");
      return false;
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      ToastHelper.showWarningToast(context, "البريد الإلكتروني غير صحيح");
      return false;
    }

    if (password.length < 6) {
      ToastHelper.showWarningToast(context, "كلمة المرور يجب أن تكون على الأقل 6 أحرف");
      return false;
    }

    if (password != confirmPassword) {
      ToastHelper.showWarningToast(context, "كلمة المرور غير متطابقة");
      return false;
    }

    return true;
  }

  static void handleLoginErrors(BuildContext context, int statusCode) {
    switch (statusCode) {
      case 401:
        ToastHelper.showErrorToast(context, "اسم المستخدم أو كلمة المرور غير صحيحة");
        break;
      case 500:
        ToastHelper.showErrorToast(context, "خطأ في الخادم، يرجى المحاولة لاحقاً");
        break;
      default:
        ToastHelper.showErrorToast(context, "حدث خطأ غير متوقع: $statusCode");
    }
  }
}
