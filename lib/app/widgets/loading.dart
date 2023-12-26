import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:flutter/material.dart';

class DPLoading extends StatelessWidget {
  const DPLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30.0,
            width: 30.0,
            child: CircularProgressIndicator(
              color: DPColors.DARK4,
              strokeWidth: 4.0,
            ),
          ),
          // SizedBox(width: 20),
          // Text(
          //   '로딩중...',
          //   style: TextStyle(
          //     color: DPColors.DARK400,
          //     fontSize: 20.0,
          //   ),
          // ),
        ],
      ),
    );
  }
}
