import 'package:flutter/material.dart';

class DashboardGuideCard extends StatelessWidget {
  const DashboardGuideCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            ListTile(
              title: Text('사업체 정보 수정'),
              trailing: Icon(Icons.chevron_right),
            ),
            Divider(),
            ListTile(
              title: Text('대기 예약 관리'),
              trailing: Icon(Icons.chevron_right),
            ),
            Divider(),
            ListTile(title: Text('메뉴 관리'), trailing: Icon(Icons.chevron_right)),
            Divider(),
          ],
        ),
      ),
    );
  }
}
