import 'package:flutter/material.dart';
import 'pages/store_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StorePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
