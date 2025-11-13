import 'package:flutter/material.dart';

class WaitingListPage extends StatelessWidget {
  const WaitingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('리스트'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 1,
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text('대기 마감하기', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                '현재 대기 접수 중',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
          bottom: const TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(text: '대기'),
              Tab(text: '예약'),
              Tab(text: '착석 중'),
              Tab(text: '히스토리'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [WaitingTab(), ReservationTab(), SeatedTab(), HistoryTab()],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

// ✅ 대기 탭
class WaitingTab extends StatelessWidget {
  const WaitingTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> waitingList = [
      {
        'number': 922,
        'time': '17:32',
        'name': '김길동',
        'phone': '01012345678',
        'adults': 2,
        'position': 1,
        'menus': ['클래식치즈버거 2개', '아보카도버거 1개'],
        'note': '예약 좌석',
      },
      {
        'number': 923,
        'time': '17:35',
        'name': '이둘링',
        'phone': '01012345678',
        'adults': 2,
        'position': 2,
        'menus': ['하와이안버거 1개', '아보카도버거 1개'],
        'note': '분할 결제',
      },
      {
        'number': 924,
        'time': '17:40',
        'name': '박둘링',
        'phone': '01012345678',
        'adults': 2,
        'position': 3,
        'menus': [],
        'note': '',
      },
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // 필터
        Wrap(
          spacing: 8,
          children: const [
            FilterChip(label: Text('홀 (12)'), selected: true, onSelected: null),
            FilterChip(
              label: Text('테라스 (32)'),
              selected: false,
              onSelected: null,
            ),
            FilterChip(
              label: Text('포장 (0)'),
              selected: false,
              onSelected: null,
            ),
            FilterChip(label: Text('빈 자리'), selected: false, onSelected: null),
          ],
        ),
        const SizedBox(height: 16),

        // 웨이팅 카드 리스트
        ...waitingList.map((item) => WaitingCard(data: item)).toList(),
      ],
    );
  }
}

class WaitingCard extends StatelessWidget {
  final Map<String, dynamic> data;

  const WaitingCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 번호, 시간
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red),
                  ),
                  child: Text(
                    '${data['number']}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  data['time'],
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // 이름, 전화번호
            Text(
              '${data['name']} / ${data['phone']}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text('성인 ${data['adults']} / 입장순서: ${data['position']}위'),

            // 메뉴 목록
            if (data['menus'].isNotEmpty) ...[
              const SizedBox(height: 8),
              ...data['menus'].map<Widget>((menu) => Text('• $menu')).toList(),
            ],

            const SizedBox(height: 12),

            // 버튼 3개
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow[700],
                    ),
                    child: const Text(
                      '호출',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('입장'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[100],
                    ),
                    child: const Text(
                      '취소',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),

            // 메모 박스
            if (data['note'] != '') ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(data['note']),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ✅ 예약 탭
class ReservationTab extends StatelessWidget {
  const ReservationTab({super.key});

  @override
  Widget build(BuildContext context) {
    final reservations = [
      {'name': '예약자 A', 'time': '18:00', 'count': 2},
      {'name': '예약자 B', 'time': '18:30', 'count': 3},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: reservations.length,
      itemBuilder: (context, index) {
        final item = reservations[index];
        return ListTile(
          leading: const Icon(Icons.schedule),
          title: Text(item['name'] as String),

          subtitle: Text('${item['time']} / ${item['count']}명'),
          trailing: const Icon(Icons.chevron_right),
        );
      },
    );
  }
}

// ✅ 착석 중 탭
class SeatedTab extends StatelessWidget {
  const SeatedTab({super.key});

  @override
  Widget build(BuildContext context) {
    final seatedList = [
      {'name': '김착석', 'table': 'A1', 'startTime': '17:45'},
      {'name': '박착석', 'table': 'B2', 'startTime': '17:50'},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: seatedList.length,
      itemBuilder: (context, index) {
        final item = seatedList[index];
        return ListTile(
          leading: const Icon(Icons.chair),
          title: Text(item['name'] as String),

          subtitle: Text('테이블 ${item['table']} / ${item['startTime']} 착석'),
        );
      },
    );
  }
}

// ✅ 히스토리 탭
class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    final historyList = [
      {'name': '김이력', 'status': '입장', 'time': '17:00'},
      {'name': '이이력', 'status': '취소', 'time': '17:10'},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: historyList.length,
      itemBuilder: (context, index) {
        final item = historyList[index];
        final isCancelled = item['status'] == '취소';

        return ListTile(
          leading: Icon(
            isCancelled ? Icons.cancel : Icons.check_circle,
            color: isCancelled ? Colors.red : Colors.green,
          ),
          title: Text(item['name'] as String),
          subtitle: Text('${item['status']} / ${item['time']}'),
        );
      },
    );
  }
}
