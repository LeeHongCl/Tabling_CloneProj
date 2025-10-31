import 'package:flutter/material.dart';
import 'login.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('로그인해 주세요'),
              SizedBox(width: 5),
              Icon(Icons.arrow_forward, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}
