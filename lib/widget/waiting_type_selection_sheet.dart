import 'package:flutter/material.dart';
import '../pages/visitor_count_page.dart';

void showWaitingTypeSelectionSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) => const WaitingTypeSelectionSheet(),
  );
}

class WaitingTypeSelectionSheet extends StatelessWidget {
  const WaitingTypeSelectionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("웨이팅 유형 선택하기", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              "원하는 웨이팅 유형을 선택해주세요.\n* 가장 빠른 대기 순서 기준입니다.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _WaitingTypeButton(type: "먹고 갈게요", teamCount: 115),
                _WaitingTypeButton(type: "포장 할게요", teamCount: 103),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _WaitingTypeButton extends StatelessWidget {
  final String type;
  final int teamCount;

  const _WaitingTypeButton({required this.type, required this.teamCount});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context); // 모달 닫기
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VisitorCountPage(
              waitingType: type,
              teamCount: teamCount,
            ),
          ),
        );
      },
      child: Container(
        width: 140,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.redAccent),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(type, style: const TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text("$teamCount 팀"),
          ],
        ),
      ),
    );
  }
}
