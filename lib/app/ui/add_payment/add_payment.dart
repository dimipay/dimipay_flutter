import 'package:flutter/material.dart';

class AddPaymentPage extends StatelessWidget {
  const AddPaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('결제 수단'),
        centerTitle: false,
      ),
    );
  }
}
