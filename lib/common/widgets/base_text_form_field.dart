import 'package:e_learning_klass/common/values/colors.dart';
import 'package:flutter/material.dart';

Widget buildTextFormField({
  required String labelText,
  bool isRequired = false,
  TextEditingController? controller,
  TextInputType keyboardType = TextInputType.text,
  String? Function(String?)? validator,
  bool readOnly = false,
  VoidCallback? onTap,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    validator: validator ??
        (value) {
          if (isRequired && (value == null || value.isEmpty)) {
            return 'This field is required';
          }
          return null;
        },
    onTap: onTap,
    readOnly: readOnly,
    decoration: InputDecoration(
      label: RichText(
        text: TextSpan(
          text: labelText,
          style: const TextStyle(color: Colors.grey, fontSize: 14.0),
          children: isRequired
              ? [
                  const TextSpan(
                    text: '*',
                    style: TextStyle(color: Colors.red),
                  ),
                ]
              : [],
        ),
      ),
      floatingLabelStyle:
          const TextStyle(color: AppColors.primaryElementStatus),
      border: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1.0),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide:
            BorderSide(color: AppColors.primaryThirdElementText, width: 1.0),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide:
            BorderSide(color: AppColors.primarySecondaryElement, width: 2.0),
      ),
    ),
    style: const TextStyle(fontSize: 16.0, color: Colors.black),
  );
}
