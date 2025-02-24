import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shoppe_ui/core/constants/animations.dart';
import 'package:shoppe_ui/core/AppTheme.dart';

List<PageViewModel> onboardingPages = [
  _buildPage(
    animation: AppAnimations.onboardingAnimations[0], // العنصر الأول
    title: "مرحباً بك في التسوق السهل!",
    description: "اكتشف تجربة تسوق مميزة وسهلة مع أفضل المنتجات والعروض الحصرية.",
  ),
  _buildPage(
    animation: AppAnimations.onboardingAnimations[1],
    title: "تجربة استخدام سلسة",
    description: "نحن نوفر لك تجربة مستخدم مريحة، مع تصميم بسيط وسهل الاستخدام.",
  ),
  _buildPage(
    animation: AppAnimations.onboardingAnimations[2],
    title: "منتجات متنوعة وأسعار مذهلة",
    description: "استمتع بمجموعة واسعة من المنتجات بأسعار تنافسية وخيارات متعددة للدفع.",
  ),
  _buildPage(
    animation: AppAnimations.onboardingAnimations[3],
    title: "ابدأ التسوق الآن!",
    description: "انضم إلينا اليوم وابدأ رحلة التسوق السهلة والممتعة من أي مكان وفي أي وقت.",
  ),
];

PageViewModel _buildPage({
  required String animation,
  required String title,
  required String description,
}) {
  return PageViewModel(
    title: title,
    body: description,
    image: Lottie.asset(animation, height: 300, width: 300),
    decoration: PageDecoration(
      titleTextStyle: GoogleFonts.cairo(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.primary),
      bodyTextStyle: GoogleFonts.cairo(fontSize: 16, color: AppTheme.iconColor),
      imagePadding: EdgeInsets.only(top: 40),
    ),
  );
}