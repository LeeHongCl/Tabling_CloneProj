import 'package:flutter/material.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/dashboard_guide_card.dart';
import '../widgets/wait_status_card.dart';
import './waiting_list_page.dart';

class StoreDashboardPage extends StatelessWidget {
  const StoreDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0060FF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DashboardHeader(),
            const SizedBox(height: 24),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                padding: const EdgeInsets.all(20),
                child: ListView(
                  children: [
                    const DashboardGuideCard(),
                    const SizedBox(height: 24),
                    const Text(
                      '대기열 현황',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        WaitStatusCard(
                          title: '홀',
                          status: '접수 중',
                          teamCount: 12,
                        ),
                        WaitStatusCard(
                          title: '테라스',
                          status: '접수 중',
                          teamCount: 32,
                        ),
                        WaitStatusCard(title: '포장', status: '마감', teamCount: 0),
                        WaitStatusCard(
                          title: '테라스',
                          status: '접수 중',
                          teamCount: 32,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WaitingListPage(),
                          ),
                        );
                      },
                      child: const Text("접수 / 마감 관리"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
