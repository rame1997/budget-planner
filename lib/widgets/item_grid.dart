import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter/material.dart';

class ItemGrid extends StatelessWidget {
String number;
Function() onTap;

ItemGrid({required this.number,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: SizeConfig.scaleHeight(60),
        width: SizeConfig.scaleWidth(60),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: TextCustom(
              title: number,
              fontfamily: 'mon',
              fontweight: FontWeight.w700,
              size: SizeConfig.scaleTextFont(23),
              color: AppColors.BOTTON,
              align: TextAlign.center),
        ),
      ),
    );
  }
}
