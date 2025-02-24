import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppe_ui/core/AppTheme.dart';
import 'package:shoppe_ui/features/Onpording/presintation/Widget/onboarding_page_model.dart';


class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: onboardingPages,
      onDone: () => Get.offAllNamed('/login'),
      onSkip: () => Get.offAllNamed('/login'),
      showSkipButton: true,
      skip: Text('تخطي', style: GoogleFonts.cairo(fontSize: 16)),
      next: Icon(Icons.arrow_forward, color: AppTheme.primary),
      done: Text('ابدأ الآن', style: GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.bold)),
      dotsDecorator: DotsDecorator(
        size: Size(8.0, 8.0),
        color: AppTheme.iconColor,
        activeSize: Size(16.0, 8.0),
        activeColor: AppTheme.primary,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
