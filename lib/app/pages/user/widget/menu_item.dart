import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserPageListItem extends StatelessWidget {
  final String title;
  final bool trailing;
  final String? trailingText;
  final void Function()? onTap;
  const UserPageListItem({
    super.key,
    required this.title,
    this.trailingText,
    this.onTap,
    this.trailing = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: DPTextTheme.REGULAR_IMPORTANT),
            Row(
              children: [
                trailingText?.isNotEmpty == true ? Text(trailingText!, style: DPTextTheme.DESCRIPTION) : Container(),
                const SizedBox(width: 16),
                trailing ? SvgPicture.asset('asset/images/arrow_right.svg') : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
