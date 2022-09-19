import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/pages/face_sign/controller.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FaceSignPage extends StatelessWidget {
  FaceSignPage({Key? key}) : super(key: key);

  final FaceSignPageController _controller = Get.find<FaceSignPageController>();

//Widget _buildCard(String assetName, String title, {String? description}) {
//     return ClipRRect(
//       borderRadius: const BorderRadius.all(Radius.circular(12)),
//       child: Container(
//         color: DPColors.DARK6,
//         child: Padding(
//           padding: const EdgeInsets.all(18),
//           child: Row(
//             children: [
//               SvgPicture.asset(assetName),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(title, style: DPTextTheme.REGULAR),
//                     description == null
//                         ? Container()
//                         : Column(
//                             children: [
//                               const SizedBox(height: 6),
//                               Text(description, style: DPTextTheme.DESCRIPTION),
//                             ],
//                           ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset("asset/images/face_sign.svg"),
              const SizedBox(height: 24),
              const Text.rich(TextSpan(style: DPTextTheme.PAGE_HEADER, children: [
                TextSpan(text: "얼굴인증을 이용하면\n"),
                TextSpan(text: "더 빠르게 결제할 수 있어요"),
              ])),
              const SizedBox(height: 32),
              const Text.rich(TextSpan(style: DPTextTheme.PAGE_DESCRIPTION, children: [
                TextSpan(text: "얼굴인증은 매점의 결제단말기에서 사용자의 얼굴을인식해서 결제하는 본인인증 수단이에요.\n"),
                TextSpan(text: "\n본인의 사진을 한번만 등록해두면, 휴대폰 없이도 빠르게 결제할 수 있어요.\n"),
                TextSpan(text: "\n서버에는 사용자의 이미지가 아닌 얼굴의 특징만 저장돼서, 안전하게 사용할 수 있어요."),
              ])),
              const SizedBox(height: 32),
              //description 생략
              //"네이버 클라우드와 CLOVA가 개발한 인공지능 기술로 안전하게 인증할 수 있습니다"
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Container(
                  color: DPColors.DARK6,
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      children: [
                        SvgPicture.asset("asset/images/naver_cloud.svg"),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("네이버 클라우드의 기술로 더 안전하게", style: DPTextTheme.REGULAR),
                              SizedBox(height: 6),
                              Text('네이버 클라우드와 CLOVA가 개발한 인공지능 기술로 안전하게 인증할 수 있습니다', style: DPTextTheme.DESCRIPTION),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Container(
                  color: DPColors.DARK6,
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      children: [
                        Image.asset('asset/images/security.png'),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("휴대폰 없이도 얼굴인증만으로 결제 가능", style: DPTextTheme.REGULAR),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: DPMediumTextButton(
                      onTap: () {
                        Get.back();
                      },
                      text: "다음에",
                      color: DPColors.DARK4,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: DPMediumTextButton(
                      onTap: _controller.registerFaceSign,
                      text: "사용하기",
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: DPMediumTextButton(
                      color: DPColors.ERROR,
                      onTap: _controller.deleteFaceSign,
                      text: "삭제하기",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
