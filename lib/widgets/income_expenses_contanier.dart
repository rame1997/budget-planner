import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter/material.dart';

class IncomeExpensesContanier extends StatelessWidget {
 String title;
 String image;
 Function()? onPressed;
int press=0;

 IncomeExpensesContanier({required this.title, required this.image,required this.onPressed,required this.press});

 @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(onPressed != null){
          onPressed!();
        }
      },
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: press == 0?Colors.white:press == 1?Colors.red:Colors.green),
            borderRadius: BorderRadius.circular(15),
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
          child:
          Padding(
            padding: EdgeInsets.only(
                right: SizeConfig.scaleWidth(25),
                left: SizeConfig.scaleWidth(25),
                top: SizeConfig.scaleHeight(20),
                bottom: SizeConfig.scaleHeight(5)
            ),
            child: Column(
              children: [
                Image.asset(image),
                SizedBox(height: SizeConfig.scaleHeight(10),),
                TextCustom(
                    title: title,
                    fontfamily: 'mon',
                    fontweight: FontWeight.w500,
                    size: SizeConfig.scaleTextFont(15),
                    color: AppColors.TITLE,
                    align: TextAlign.center),
              ],
            ),
          )

      ),
    );
  }
}
