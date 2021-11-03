import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      onPressed: onPressed,
      constraints: const BoxConstraints(minWidth: 7.0, minHeight: 7.0),
      shape: const CircleBorder(),
      // fillColor: const Color(0xFF4C4F5E),
    );
  }
}
