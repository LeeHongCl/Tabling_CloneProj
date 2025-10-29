import 'package:flutter/material.dart';
import 'category_chip.dart';

class StoreTabBar extends StatelessWidget {
  const StoreTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Text('홈   소식   ',
                  style: TextStyle(fontSize: 16, color: Colors.black54)),
              Text('메뉴',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text('   사진', style: TextStyle(color: Colors.black54)),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: const [
              CategoryChip(label: 'bagel'),
              CategoryChip(label: 'sandwich'),
              CategoryChip(label: 'cream cheese'),
              CategoryChip(label: 'soup'),
              CategoryChip(label: 'other'),
            ],
          ),
        ),
      ],
    );
  }
}
