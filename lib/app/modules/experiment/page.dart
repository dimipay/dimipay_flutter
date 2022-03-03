import 'package:dimipay/app/widgets/button.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(title: const Text('Experiment')),
      body: Column(
        children: [
          const TextField(),
          DPKeyboardReactiveButton(
            child: const Text('hi'),
            innerPadding: const EdgeInsets.all(20),
            onTap: () {},
            padding: const EdgeInsets.all(24),
          ),
          const DPLargeButton(child: Text('hi')),
        ],
      ),
    );
  }
}
