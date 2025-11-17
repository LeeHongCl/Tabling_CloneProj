import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 24),
        Center(
          child: Text(
            '테이블링 사장님보드',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 8),
        Center(
          child: Text(
            '음식점 운영을 더 쉽게',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
