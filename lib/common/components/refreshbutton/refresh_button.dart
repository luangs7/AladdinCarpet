import 'package:flutter/material.dart';

class RefreshButton extends StatelessWidget {
  final VoidCallback onTap;

  const RefreshButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: onTap,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
