import 'package:badgetplanner/models/models/category.dart';
import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter/material.dart';
class ListIncome extends StatelessWidget {
  final Category category;
  final void Function() onTap;

  ListIncome({required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: SizeConfig.scaleWidth(20)),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.BOTTON,
              radius: SizeConfig.scaleHeight(20),
              child:
              TextCustom(
                  title: category.name[0].toUpperCase(),
                  fontfamily: 'mon',
                  fontweight: FontWeight.w500,
                  size: SizeConfig.scaleTextFont(15),
                  color: AppColors.TITLE,
                  align: TextAlign.center),
            ),
            SizedBox(width: SizeConfig.scaleWidth(20)),
            Column(
              children: [
                TextCustom(
                    title: category.name,
                    fontfamily: 'mon',
                    fontweight: FontWeight.w500,
                    size: SizeConfig.scaleTextFont(15),
                    color: AppColors.TITLE,
                    align: TextAlign.center),
                TextCustom(
                    title: category.name,
                    fontfamily: 'mon',
                    fontweight: FontWeight.w300,
                    size: SizeConfig.scaleTextFont(15),
                    color: AppColors.SUB_TITLE,
                    align: TextAlign.center),
              ],
            ),

          ],
        ),
      ),
    );
  }
}