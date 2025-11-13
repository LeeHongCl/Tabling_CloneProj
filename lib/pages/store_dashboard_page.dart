import 'package:flutter/material.dart';
import './waiting_list_page.dart'; // 상대 경로

class StoreDashboardPage extends StatelessWidget {
  const StoreDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0060FF), // 배경 파란색
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const Center(
              child: Text(
                '테이블링 사장님보드',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                '음식점 운영을 더 쉽게',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ),
            const SizedBox(height: 24),

            // 본문 영역 시작
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                padding: const EdgeInsets.all(20),
                child: ListView(
                  children: [
                    // 가이드 카드
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            ListTile(
                              leading: Icon(Icons.info_outline),
                              title: Text('서비스 이용 가이드'),
                              trailing: Icon(Icons.chevron_right),
                            ),
                            Divider(),
                            ListTile(
                              leading: Icon(Icons.menu_book),
                              title: Text('대기 이용 가이드'),
                              trailing: Icon(Icons.chevron_right),
                            ),
                            Divider(),
                            ListTile(
                              leading: Icon(Icons.menu_book_outlined),
                              title: Text('테이블오더 가이드'),
                              trailing: Icon(Icons.chevron_right),
                            ),
                            Divider(),
                            ListTile(
                              leading: Icon(Icons.refresh),
                              title: Text('업데이트 안내'),
                              trailing: Icon(Icons.chevron_right),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // 대기열 현황
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
                            builder: (context) =>
                                const WaitingListPage(), // ✅ 대기 리스트로 이동
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

// 대기 상태 카드 위젯
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
