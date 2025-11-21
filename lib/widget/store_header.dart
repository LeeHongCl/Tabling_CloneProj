import 'package:flutter/material.dart';

class StoreHeader extends StatelessWidget {
  const StoreHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(
              'assets/images/store_image.jpg',
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.home, color: Colors.white),
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Row(
                children: const [
                  Icon(Icons.search, color: Colors.white),
                  SizedBox(width: 10),
                  Icon(Icons.bookmark_border, color: Colors.white),
                  SizedBox(width: 10),
                  Icon(Icons.share, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '런던베이글뮤지엄 안국',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '방금 나온 베이글, 따뜻한 수프가 기다리는 가장 가까운 런던 속 베이글 뮤지엄',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.location_on, size: 18),
                  SizedBox(width: 6),
                  Text('안국역에서 307m'),
                  Spacer(),
                  Text('위치', style: TextStyle(color: Colors.blue)),
                ],
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.access_time, size: 18),
                  SizedBox(width: 6),
                  Text('영업 중 · 19:00 영업 마감'),
                ],
              ),
              SizedBox(height: 12),
              Text('무선인터넷', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ],
    );
  }
}
