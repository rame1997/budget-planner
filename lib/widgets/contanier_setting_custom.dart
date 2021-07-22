import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class contanier_setting extends StatelessWidget {
Color color;
String title;
IconData icon;
Color titlecolor;
Color iconcolor;
Function() onTap;
contanier_setting({required this.color, required this.title, required this.icon,required this.titlecolor,required this.iconcolor,required this.onTap});




  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.scaleHeight(70),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
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
            Icon(icon,color: iconcolor,),
            SizedBox(width: SizeConfig.scaleWidth(8),),
            InkWell(
              onTap: onTap,
              child: TextCustom(
                  title:title ,
                  fontfamily: 'mon',
                  fontweight: FontWeight.w500,
                  size: SizeConfig.scaleTextFont(15),
                  color: titlecolor,
                  align: TextAlign.left),
            ),


            SizedBox(height: SizeConfig.scaleHeight(10),),

          ],
        ),
      ),
    );
  }
}
