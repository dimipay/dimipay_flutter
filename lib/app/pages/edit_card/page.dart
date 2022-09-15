import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/pages/edit_card/controller.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class EditCardPage extends GetView<EditCardPageController> {
  final FocusNode textFieldFocusNode = FocusNode();
  EditCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    const Text(
                      '카드의 이름을 입력해주세요',
                      style: DPTextTheme.PAGE_HEADER,
                    ),
                    Expanded(
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            textFieldFocusNode.requestFocus();
                          },
                          child: Container(
                            width: 200,
                            height: 100,
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: controller.paymentMethod.color?.isEmpty ?? true ? DPColors.MAIN_THEME : Color(int.parse('FF${controller.paymentMethod.color}', radix: 16)),
                              boxShadow: const [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.12), offset: Offset(0, 4), blurRadius: 72)],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  autofocus: true,
                                  focusNode: textFieldFocusNode,
                                  controller: controller.textEditingController,
                                  cursorColor: Colors.white,
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: const EdgeInsets.all(0),
                                    border: InputBorder.none,
                                    hintText: controller.paymentMethod.name,
                                    hintStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromRGBO(255, 255, 255, 0.5)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Obx(
              () => DPKeyboardReactiveButton(
                disabled: controller.cardName.value.isEmpty,
                onTap: () {},
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                child: const Text('다음', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
