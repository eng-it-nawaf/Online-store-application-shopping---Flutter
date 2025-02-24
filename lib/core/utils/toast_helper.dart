import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

class ToastHelper {
  static void showWarningToast(BuildContext context, String message) {
    MotionToast.warning(
      title: const Text("تحذير"),
      description: Text(message),
    ).show(context);
  }

  static void showErrorToast(BuildContext context, String message) {
    MotionToast.error(
      title: const Text("خطأ"),
      description: Text(message),
    ).show(context);
  }

  static void showSuccessToast(BuildContext context, String message) {
    MotionToast.success(
      title: const Text("نجاح"),
      description: Text(message),
    ).show(context);
  }
}