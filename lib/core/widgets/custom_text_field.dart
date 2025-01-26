import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shoppe_ui/core/AppTheme.dart';

// class CustomTextField extends StatefulWidget {
//   final String hintText;
//   final TextEditingController controller;
//   final bool isPassword;
//   final TextInputType keyboardType;
//   final double borderRadius;
//   final bool showBorder;
//   final ValueChanged<String>? onChanged; // Added onChanged
//
//   const CustomTextField({
//     required this.hintText,
//     required this.controller,
//     this.isPassword = false,
//     this.keyboardType = TextInputType.text,
//     this.borderRadius = 20.0,
//     this.showBorder = true,
//     this.onChanged,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   _CustomTextFieldState createState() => _CustomTextFieldState();
// }
//
// class _CustomTextFieldState extends State<CustomTextField> {
//   bool _obscureText = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(widget.borderRadius),
//         color: AppTheme.priceColor,
//       ),
//       child: TextField(
//         controller: widget.controller,
//         obscureText: widget.isPassword ? _obscureText : false,
//         keyboardType: widget.keyboardType,
//         onChanged: widget.onChanged, // Added onChanged callback
//         decoration: InputDecoration(
//           hintText: widget.hintText,
//           border: widget.showBorder ? OutlineInputBorder() : InputBorder.none,
//           filled: true,
//           fillColor: Colors.grey[200],
//           contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
//           suffixIcon: widget.isPassword
//               ? IconButton(
//             icon: Icon(
//               _obscureText ? Icons.visibility : Icons.visibility_off,
//               color: AppTheme.priceColor,
//             ),
//             onPressed: () {
//               setState(() {
//                 _obscureText = !_obscureText;
//               });
//             },
//           )
//               : null,
//         ),
//       ),
//     );
//   }
// }
//
//
// class CustomPhoneNumberInput extends StatelessWidget {
//   final TextEditingController controller;
//   final PhoneNumber initialNumber;
//   final ValueChanged<PhoneNumber> onChanged; // Type-safe function parameter
//
//   const CustomPhoneNumberInput({
//     required this.controller,
//     required this.initialNumber,
//     required this.onChanged,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       decoration: BoxDecoration(
//         color: AppTheme.secondaryColor,
//         borderRadius: BorderRadius.circular(15),
//         border: Border.all(color: AppTheme.priceColor),
//
//       ),
//       child: InternationalPhoneNumberInput(
//         onInputChanged: onChanged,
//         textFieldController: controller,
//         initialValue: initialNumber,
//         selectorConfig: const SelectorConfig(
//           selectorType: PhoneInputSelectorType.DROPDOWN,
//           setSelectorButtonAsPrefixIcon: true,
//           showFlags: true,
//         ),
//         inputDecoration: const InputDecoration(
//           hintText: 'Your number',
//           border: InputBorder.none,
//           contentPadding: EdgeInsets.symmetric(vertical: 14.0),
//         ),
//         formatInput: false,
//         keyboardType: const TextInputType.numberWithOptions(
//           signed: true,
//           decimal: false,
//         ),
//       ),
//     );
//   }
// }




class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType keyboardType;
  final double borderRadius; // إضافة borderRadius
  final bool showBorder;
  final ValueChanged<String>? onChanged;
  final Widget? prefixIcon;
  final Color? fillColor;
  final EdgeInsetsGeometry? contentPadding;

  const CustomTextField({
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.borderRadius = 30.0, // جعل القيمة الافتراضية دائرية
    this.showBorder = true,
    this.onChanged,
    this.prefixIcon,
    this.fillColor,
    this.contentPadding,
    Key? key,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        color: AppTheme.priceColor,
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPassword ? _obscureText : false,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: widget.showBorder
              ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius), // جعل الحقل دائري
            borderSide: BorderSide(color: AppTheme.primaryColor),
          )
              : InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius), // جعل الحقل دائري
            borderSide: BorderSide(color: AppTheme.primaryColor.withOpacity(0.5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius), // جعل الحقل دائري
            borderSide: BorderSide(color: AppTheme.primaryColor),
          ),
          filled: true,
          fillColor: widget.fillColor ?? AppTheme.background,
          contentPadding: widget.contentPadding ?? const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.isPassword
              ? IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: AppTheme.priceColor,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          )
              : null,
        ),
      ),
    );
  }
}