import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shoppe_ui/core/AppTheme.dart';

// class CustomPhoneInput extends StatelessWidget {
//   final TextEditingController controller;
//   final PhoneNumber initialNumber;
//   final ValueChanged<PhoneNumber> onChanged; // Type-safe function parameter
//
//   const CustomPhoneInput({
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
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(15),
//         border: Border.all(color: Colors.grey),
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



class CustomPhoneNumberInput extends StatelessWidget {
  final TextEditingController controller;
  final PhoneNumber initialNumber;
  final ValueChanged<PhoneNumber> onChanged;
  final String hintText; // إضافة نص توضيحي مخصص

  const CustomPhoneNumberInput({
    required this.controller,
    required this.initialNumber,
    required this.onChanged,
    this.hintText = 'Your number', // قيمة افتراضية
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppTheme.secondaryColor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppTheme.priceColor),
      ),
      child: InternationalPhoneNumberInput(
        onInputChanged: onChanged,
        textFieldController: controller,
        initialValue: initialNumber,
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.DROPDOWN,
          setSelectorButtonAsPrefixIcon: true,
          showFlags: true,
        ),
        inputDecoration: InputDecoration(
          hintText: hintText, // استخدام النص التوضيحي المخصص
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 14.0),
        ),
        formatInput: false,
        keyboardType: const TextInputType.numberWithOptions(
          signed: true,
          decimal: false,
        ),
      ),
    );
  }
}