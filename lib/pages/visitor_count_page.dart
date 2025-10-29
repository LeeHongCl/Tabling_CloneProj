import 'package:flutter/material.dart';
import 'waiting_confirm_page.dart';

class VisitorCountPage extends StatefulWidget {
  final String waitingType;
  final int teamCount;

  const VisitorCountPage({required this.waitingType, required this.teamCount});

  @override
  State<VisitorCountPage> createState() => _VisitorCountPageState();
}

class _VisitorCountPageState extends State<VisitorCountPage> {
  int count = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('인원 선택')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("총 방문 인원 수를 선택해주세요"),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  if (count > 1) setState(() => count--);
                },
                icon: const Icon(Icons.remove_circle_outline),
              ),
              Text('$count', style: const TextStyle(fontSize: 20)),
              IconButton(
                onPressed: () {
                  setState(() => count++);
                },
                icon: const Icon(Icons.add_circle_outline),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => WaitingConfirmPage(
                    waitingType: widget.waitingType,
                    teamCount: widget.teamCount,
                    peopleCount: count,
                  ),
                ),
              );
            },
            child: const Text("다음"),
          ),
        ],
      ),
    );
  }
}
