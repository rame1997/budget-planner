import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter/material.dart';
class TextFiledPinCode extends StatelessWidget {
  final String number;
  final isFill;


  TextFiledPinCode({required this.number, required this.isFill});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 50,
      width: 50,
      alignment: Alignment.center,

      child: TextCustom(
          title: number,
          fontfamily: 'mon',
          fontweight: FontWeight.w700,
          size: SizeConfig.scaleTextFont(23),
          color: Colors.white,
          align: TextAlign.center),

      decoration: BoxDecoration(

          color: isFill==false?Colors.white:AppColors.BOTTON,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 0),
                color:AppColors.BOTTON.withOpacity(0.16),
                spreadRadius: 0,
                blurRadius: 5
            )
          ]
      ),
    );
  }
}
/*import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';

class BinCodeWidget extends StatelessWidget {
  late final String number;
  late final void Function() onTap;


  BinCodeWidget({required this.number,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Container(
            height: 70,
            width: 70,
            alignment: Alignment.center,

            child: AppTextWidget(number,
              color: AppStyleColors.PRIMARY_COLOR,
              fontFamily: 'montserrat',
              fontSize: 23,
              fontWeight: FontWeight.bold,),

            decoration: BoxDecoration(

                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    color: Colors.black.withOpacity(0.16),
                    spreadRadius: 0,
                    blurRadius: 18
                  )
                ]
            ),
        ),
      ),
    );
  }
}*/
