import 'package:badgetplanner/screens/about_screen.dart';
import 'package:badgetplanner/screens/tab_navigation/tip/tip/tip_detiles_screen.dart';
import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CardTip extends StatelessWidget {
String image;
String title;
String subtitle;
String data;

CardTip({required this.image, required this.title, required this.subtitle,required this.data});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    Detiles(title: title, mainImage: image, date: data,))
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Container(
              child: SvgPicture.asset(image),
              width: double.infinity,
              height: SizeConfig.scaleHeight(157),
            ),
            Column(
              children: [
                TextCustom(
                    title: title,
                    fontfamily: 'mon',
                    fontweight: FontWeight.w800,
                    size: SizeConfig.scaleTextFont(15),
                    color: AppColors.TITLE,
                    align: TextAlign.center),
                SizedBox(
                  height: SizeConfig.scaleHeight(6),
                ),
                TextCustom(
                    title:subtitle,
                    fontfamily: 'mon',
                    fontweight: FontWeight.w400,
                    size: SizeConfig.scaleTextFont(13),
                    color: AppColors.SUB_TITLE,
                    align: TextAlign.center),
              ],
            )
          ],
        ),
      ),
    );
  }
}
