import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {
String date;
String priveousDate;
String title;
String subTitle;
String money;
Function() onTap;
IconData icon;
int ic_ex;
HomeItem(
    {required this.date,
      required this.title,
      required this.subTitle,
      required this.money,
      required this.onTap,
      required this.icon,required this.priveousDate,required this.ic_ex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: date!=priveousDate
          ,
          child: TextCustom(
              title:date,
              fontfamily: 'mon',
              fontweight: FontWeight.w800,
              size: SizeConfig.scaleTextFont(12),
              color: AppColors.SUB_TITLE,
              align: TextAlign.center),
        ),
        ListTile(
          onTap: onTap,
          leading: Icon(icon),//Icons.note
          title:
          TextCustom(
              title:title,//'Food',
              fontfamily: 'mon',
              fontweight: FontWeight.w800,
              size: SizeConfig.scaleTextFont(15),
              color: AppColors.TITLE,
              align: TextAlign.start),
          subtitle:TextCustom(
              title:subTitle,//'Pizza Day',
              fontfamily: 'mon',
              fontweight: FontWeight.w400,
              size: SizeConfig.scaleTextFont(15),
              color: AppColors.SUB_TITLE,
              align: TextAlign.start),
          trailing:TextCustom(
              title:money,//'-\$223'
              fontfamily: 'mon',
              fontweight: FontWeight.w800,
              size: SizeConfig.scaleTextFont(15),
              color: AppColors.RED,
              align: TextAlign.center),
        ),
      ],
    );
  }
}
