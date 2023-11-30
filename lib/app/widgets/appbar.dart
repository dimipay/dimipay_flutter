import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dimipay/app/core/theme/color_theme.dart';

class DPAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool automaticallyImplyLeading;
  final List<Widget>? actions;

  const DPAppBar(
      {Key? key,
      this.title,
      this.automaticallyImplyLeading = true,
      this.actions})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title ?? "",
        style: DPTextTheme.PAGE_HEADER,
      ),
      automaticallyImplyLeading: automaticallyImplyLeading,
      actions: actions,
      iconTheme: const IconThemeData(color: DPColors.DARK500, size: 20),
      leading: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => {Get.back()},
        ),
      ),
    );
  }
}
