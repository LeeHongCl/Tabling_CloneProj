import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  final List<Map<String, dynamic>> menuItems = const [
    {
      'name': '플레인 베이글',
      'desc': '부드럽고 쫄깃한 식감과 촉촉함이 매력적인 베이글',
      'price': '3,800원',
      'image': 'assets/images/plain_bagel.jpg',
    },
    {
      'name': '토마토 허브 베이글',
      'desc': '진한 토마토향과 허브향이 느껴지면서 톡톡 튀는 약간의 매콤함이 매력적인 베이글',
      'price': '4,700원',
      'image': 'assets/images/tomato_bagel.jpg',
    },
    {
      'name': '참깨 베이글',
      'desc': '더욱 고소하고 톡톡 씹히는 깨의 식감이 매력적인 베이글',
      'price': '4,700원',
      'image': 'assets/images/sesame_bagel.jpg',
    },
    {
      'name': '소금빵 베이글',
      'desc': '버터향이 가득 느껴지면서 버터로 튀겨진 바닥은 바삭하고 속은 부드럽고 쫄깃한 식감...',
      'price': '4,700원',
      'image': 'assets/images/butter_bagel.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final item = menuItems[index];
        return ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          title:
              Text(item['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(item['desc']),
              const SizedBox(height: 6),
              Text(item['price'], style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          trailing: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              item['image'],
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
