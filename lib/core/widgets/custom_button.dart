import 'package:flutter/material.dart';
import 'package:shoppe_ui/core/AppTheme.dart';

// class CustomButton extends StatelessWidget {
//   final String text;
//   final VoidCallback? onPressed;
//
//   const CustomButton({
//     required this.text,
//     this.onPressed,
//
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Center( // Center widget to align the button horizontally and vertically
//       child: Opacity(
//         opacity: onPressed != null ? 1.0 : 0.6,
//         child: SizedBox(
//           width: 335,
//           height: 61,
//           child: ElevatedButton(
//             onPressed: onPressed,
//             style: ElevatedButton.styleFrom(
//               backgroundColor: AppTheme.priceColor,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             child: Text(
//               text,
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor; // لون الخلفية
  final Color textColor; // لون النص

  const CustomButton({
    required this.text,
    this.onPressed,
    this.backgroundColor = AppTheme.priceColor, // قيمة افتراضية
    this.textColor = AppTheme.background,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Opacity(
        opacity: onPressed != null ? 1.0 : 0.6,
        child: SizedBox(
          width: 335,
          height: 61,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor, // استخدام لون الخلفية المخصص
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor, // استخدام لون النص المخصص
              ),
            ),
          ),
        ),
      ),
    );
  }
}