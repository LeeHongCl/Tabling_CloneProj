import 'package:flutter/material.dart';

class WaitingConfirmPage extends StatelessWidget {
  final String waitingType;
  final int teamCount;
  final int peopleCount;

  const WaitingConfirmPage({
    required this.waitingType,
    required this.teamCount,
    required this.peopleCount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("웨이팅 등록 확인")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("웨이팅 유형: $waitingType"),
            Text("현재 대기 팀: $teamCount"),
            Text("입장 인원: $peopleCount"),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("웨이팅이 등록되었습니다.")),
                );
              },
              child: const Text("웨이팅 등록하기"),
            ),
          ],
        ),
      ),
    );
  }
}
