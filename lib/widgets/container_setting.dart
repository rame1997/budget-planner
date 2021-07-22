import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ContainerSetting extends StatelessWidget {
  String title;
  IconData leadingicon;
  IconData trellingicon;
Function()onTap;

  ContainerSetting({required this.title, required this.leadingicon, required this.trellingicon,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: SizeConfig.scaleHeight(70),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding:  EdgeInsets.only(left: SizeConfig.scaleWidth(13),right: SizeConfig.scaleWidth(13)),
        child: Row(
          children: [
            Icon(leadingicon),//Icons.language
            SizedBox(width: SizeConfig.scaleWidth(8),),
            TextCustom(
                title:title,
                fontfamily: 'mon',
                fontweight: FontWeight.w500,
                size: SizeConfig.scaleTextFont(15),
                color: AppColors.TITLE,
                align: TextAlign.left),
            Spacer(),
            Transform.rotate(angle: 180*math.pi/180, child: IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              onPressed: onTap, icon: Icon(trellingicon
            ),iconSize: SizeConfig.scaleHeight(13),)),


            SizedBox(height: SizeConfig.scaleHeight(10),),

          ],
        ),
      ),
    );
  }
}
