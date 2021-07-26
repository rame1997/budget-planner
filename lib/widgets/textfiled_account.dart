import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter/material.dart';

class TextfileCreateAccount extends StatelessWidget {
String hint;
Color hintColor;
Color prifixColor;
String prifix;
final void Function(String value)? onChanged;
TextEditingController textEditingController;
TextfileCreateAccount(
    {required this.hint, required this.hintColor, required this.prifixColor, required this.prifix,required this.textEditingController,required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextCustom(
            title: prifix,
            fontfamily: 'mon',
            fontweight: FontWeight.w500,
            size: SizeConfig.scaleTextFont(15),
            color: prifixColor,
            align: TextAlign.center),
        Expanded(
          child: TextField(
            onChanged: onChanged,
            controller: textEditingController,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: TextStyle(
                  fontFamily: 'mon',
                  fontSize: SizeConfig.scaleTextFont(15),
                  fontWeight: FontWeight.w500,
                  color: hintColor),

            ),
          ),
        ),
      ],
    );
  }
}
