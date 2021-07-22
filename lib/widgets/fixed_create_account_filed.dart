import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class TextFiledAccount extends StatelessWidget {

  String hint;
  Color hintColor;
  Color prifixColor;
  String prifix;
  Function() onpress;

  TextFiledAccount(
      {required this.hint, required this.hintColor, required this.prifixColor, required this.prifix, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextCustom(
            title: prifix,
            fontfamily: 'mon',
            fontweight: FontWeight.w500,
            size: SizeConfig.scaleTextFont(15),
            color: prifixColor,
            align: TextAlign.center),
        Spacer(),
        TextCustom(
            title: hint??'',
            fontfamily: 'mon',
            fontweight: FontWeight.w500,
            size: SizeConfig.scaleTextFont(15),
            color: hintColor,
            align: TextAlign.end),
        Transform.rotate(angle: 180*math.pi/180, child: IconButton(
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          onPressed: onpress, icon: Icon(Icons.arrow_back_ios),iconSize: SizeConfig.scaleHeight(13),)),

      ],
    );
  }
}
