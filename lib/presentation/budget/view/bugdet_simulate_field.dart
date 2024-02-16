import 'package:alladin/common/components/textfield/custom_textfield.dart';
import 'package:flutter/material.dart';

class BudgetSimulateField extends StatelessWidget {
  final String label;
  final String hint;
  final bool enabled;
  final TextEditingController controller;
  final Function(String) onChanged;

  const BudgetSimulateField(
      {super.key,
      required this.label,
      required this.hint,
      required this.controller,
      required this.enabled,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CustomTextfield(
        enabled: enabled,
        label: label,
        hint: hint,
        controller: controller,
        errorText: errorHandler(controller.text),
        inputType: const TextInputType.numberWithOptions(decimal: true),
        onChanged: (value) {
          onChanged(value);
        });
  }

  String? errorHandler(String value) {
    if (value.isEmpty || double.tryParse(value) != null) {
      return null;
    } else {
      return "Insira um valor válido.";
    }
  }
}
