import 'package:flutter/material.dart';
import '../widgets/waiting_info_text.dart';
import '../widgets/waiting_confirm_button.dart';

class WaitingConfirmPage extends StatelessWidget {
  final String waitingType;
  final int teamCount;
  final int peopleCount;

  const WaitingConfirmPage({
    super.key,
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
            WaitingInfoText(label: "웨이팅 유형", value: waitingType),
            WaitingInfoText(label: "현재 대기 팀", value: "$teamCount"),
            WaitingInfoText(label: "입장 인원", value: "$peopleCount"),
            const SizedBox(height: 24),
            WaitingConfirmButton(
              onConfirm: () {
                Navigator.popUntil(context, (route) => route.isFirst);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text("웨이팅이 등록되었습니다.")));
              },
            ),
          ],
        ),
      ),
    );
  }
}
