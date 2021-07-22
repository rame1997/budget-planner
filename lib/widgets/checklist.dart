import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter/material.dart';

class CheckList extends StatelessWidget {
  String title;
  String image;
  Function()? onPressed;
  int press=0;

  CheckList({required this.title, required this.image,required this.onPressed,required this.press});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(onPressed != null){
          onPressed!();
        }
      },
      child: Padding(
        padding: EdgeInsets.only(
            right: SizeConfig.scaleWidth(16),
            left: SizeConfig.scaleWidth(16),
            top: SizeConfig.scaleHeight(20),
            bottom: SizeConfig.scaleHeight(15)
        ),
        child: Row(
          children: [
            Image.asset(image),
            SizedBox(width: SizeConfig.scaleWidth(7),),
            TextCustom(
                title: title,
                fontfamily: 'mon',
                fontweight: FontWeight.w500,
                size: SizeConfig.scaleTextFont(15),
                color: AppColors.TITLE,
                align: TextAlign.center),
            Spacer(),
            Icon(press!=0?null:Icons.check,color: AppColors.BOTTON,size: SizeConfig.scaleHeight(15))
          ],
        ),
      ),
    );
  }
}
