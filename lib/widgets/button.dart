import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter/material.dart';

class button extends StatelessWidget {
  String text;
  Function() onPressed;
  Color color;

  button({required this.text, required this.onPressed,required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: TextCustom(
          title: text,
          fontfamily: 'mon',
          fontweight: FontWeight.w700,
          size: SizeConfig.scaleTextFont(15),
          align: TextAlign.center,
          color: Colors.white,
        ),
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
            primary: color,
            minimumSize: Size(double.infinity, 60)));
  }
}
