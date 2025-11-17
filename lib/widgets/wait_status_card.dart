import 'package:flutter/material.dart';

class WaitStatusCard extends StatelessWidget {
  final String title;
  final String status;
  final int teamCount;

  const WaitStatusCard({
    super.key,
    required this.title,
    required this.status,
    required this.teamCount,
  });

  @override
  Widget build(BuildContext context) {
    final bool isClosed = status == '마감';
    final Color statusColor = isClosed ? Colors.red : Colors.green;

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            '$teamCount팀',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isClosed ? Colors.grey : Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: TextStyle(color: statusColor, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
