import 'package:alladin/common/inputformatter/commainputformatter.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType inputType;
  final String? errorText;
  final Function(String) onChanged;
  final bool enabled;

  const CustomTextfield(
      {required this.label,
      required this.hint,
      required this.controller,
      required this.inputType,
      required this.errorText,
      required this.onChanged,
      required this.enabled,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      TextField(
          enabled: enabled,
          onChanged: onChanged,
          inputFormatters: [CommaTextInputFormatter()],
          keyboardType: inputType,
          textCapitalization: TextCapitalization.words,
          controller: controller,
          decoration: InputDecoration(
              errorText: errorText,
              hintStyle:
                  TextStyle(color: enabled ? Colors.black38 : Colors.black12),
              hintText: hint,
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none))
    ]);
  }
}
