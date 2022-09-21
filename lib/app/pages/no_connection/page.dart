import 'package:flutter/material.dart';

class NoConnectionPage extends StatelessWidget {
  const NoConnectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("인터넷 연결이 끊겼습니다"),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {},
                child: const Text("다시 시도"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
