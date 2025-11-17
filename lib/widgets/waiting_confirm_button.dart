import 'package:flutter/material.dart';

class WaitingConfirmButton extends StatelessWidget {
  final VoidCallback onConfirm;

  const WaitingConfirmButton({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onConfirm,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      ),
      child: const Text("웨이팅 등록하기", style: TextStyle(fontSize: 16)),
    );
  }
}
