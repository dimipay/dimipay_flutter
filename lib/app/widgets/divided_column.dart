import 'package:flutter/material.dart';

class DividedColumn extends StatelessWidget {
  final List<Widget> children;
  final Widget? divider;
  const DividedColumn({Key? key, this.children = const <Widget>[], this.divider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> dividedChildren = [];
    if (divider != null) {
      for (var child in children) {
        dividedChildren.add(child);
        dividedChildren.add(divider!);
      }
      dividedChildren.removeLast();
    } else {
      dividedChildren = children;
    }
    return Column(
      children: dividedChildren,
    );
  }
}
