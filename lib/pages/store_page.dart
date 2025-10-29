import 'package:flutter/material.dart';
import '../widgets/store_header.dart';
import '../widgets/store_tabbar.dart';
import '../widgets/menu_list.dart';
import '../widgets/waiting_type_selection_sheet.dart' as WaitingSheet;

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // 여기 const 제거
            children: [
              StoreHeader(),
              StoreTabBar(),
              MenuList(),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: ElevatedButton(
          onPressed: () {
            WaitingSheet.showWaitingTypeSelectionSheet(context); 
          },
          child: const Text("예약하기"),
        ),
      ),
    );
  }
}
