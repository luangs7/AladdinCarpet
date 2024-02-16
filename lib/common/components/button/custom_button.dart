import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String label;
  VoidCallback onPressed;
  bool isEnabled;

  CustomButton(
      {super.key,
      required this.label,
      required this.onPressed,
      required this.isEnabled});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      disabledColor: Colors.redAccent.withOpacity(0.5),
      color: Colors.redAccent,
      padding: const EdgeInsets.all(10),
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      onPressed: isEnabled ? onPressed : null,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
