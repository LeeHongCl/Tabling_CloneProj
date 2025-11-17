// lib/widgets/waiting_info_text.dart
import 'package:flutter/material.dart';

class WaitingInfoText extends StatelessWidget {
  final String label;
  final String value;

  const WaitingInfoText({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Text("$label: $value", style: const TextStyle(fontSize: 16)),
    );
  }
}
