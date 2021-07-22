import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingContent extends StatelessWidget {
  final String title;
  final String sub_title;
  final String image;

  OnBoardingContent({
    required this.title,
    required this.sub_title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextCustom(
            title: title,
            fontfamily: 'mon',
            fontweight: FontWeight.w700,
            size: SizeConfig.scaleTextFont(20),
            color: AppColors.TITLE,
            align: TextAlign.center),
        SizedBox(
          height: SizeConfig.scaleHeight(11),
        ),
        TextCustom(
            title: sub_title,
            fontfamily: 'mon',
            fontweight: FontWeight.w400,
            size: SizeConfig.scaleTextFont(15),
            color: AppColors.SUB_TITLE,
            align: TextAlign.center),
       Spacer(),
        Container( height: SizeConfig.scaleHeight(456.53),
            width: SizeConfig.scaleWidth(390),child: SvgPicture.asset(image)),
        Spacer(),
      ],
    );
  }
}
