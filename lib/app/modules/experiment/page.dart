import 'package:dimipay/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';

class ExperimentPage extends StatefulWidget {
  const ExperimentPage({Key? key}) : super(key: key);

  @override
  State<ExperimentPage> createState() => _ExperimentPageState();
}

class _ExperimentPageState extends State<ExperimentPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Experiment')),
      body: Column(
        children: [
          TextField(),
          DPKeyboardReactiveButton(
            child: Text('hi'),
            innerPadding: EdgeInsets.all(20),
            onTap: () {},
            padding: EdgeInsets.all(24),
          ),
          DPLargeButton(child: Text('hi')),
        ],
      ),
    );
  }
}
