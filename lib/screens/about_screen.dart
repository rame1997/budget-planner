import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: AppColors.BOTTON),
            ),
            title: TextCustom(
                title: AppLocalizations.of(context)!.title_about_app_bar,
                fontfamily: 'mon',
                fontweight: FontWeight.w700,
                size: SizeConfig.scaleTextFont(20),
                color: AppColors.TITLE,
                align: TextAlign.center),
          ),
          body: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: SizeConfig.scaleHeight(140),
                      width: SizeConfig.scaleWidth(143),
                      child: SvgPicture.asset('images/launch.svg'),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(40)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.scaleHeight(15),
                    ),
                    TextCustom(
                        title: AppLocalizations.of(context)!.title_lanuch,
                        fontfamily: 'mon',
                        fontweight: FontWeight.w900,
                        size: SizeConfig.scaleTextFont(24),
                        color: AppColors.TITLE,
                        align: TextAlign.center),
                    SizedBox(
                      height: SizeConfig.scaleHeight(13),
                    ),
                    TextCustom(
                        title: AppLocalizations.of(context)!.sub_title_about,
                        fontfamily: 'mon',
                        fontweight: FontWeight.w300,
                        size: SizeConfig.scaleTextFont(18),
                        color: AppColors.TITLE,
                        align: TextAlign.center),
                    SizedBox(
                      height: SizeConfig.scaleHeight(7),
                    ),
                    TextCustom(
                        title: AppLocalizations.of(context)!.name_student_about,
                        fontfamily: 'mon',
                        fontweight: FontWeight.w300,
                        size: SizeConfig.scaleTextFont(18),
                        color: AppColors.TITLE,
                        align: TextAlign.center)
                  ],
                ),
              ),
              Positioned(
                  right: SizeConfig.scaleWidth(0),
                  left: SizeConfig.scaleWidth(0),
                  bottom: SizeConfig.scaleHeight(10),
                  child: TextCustom(
                      title: 'V 1.0.0',
                      fontfamily: 'mon',
                      fontweight: FontWeight.w300,
                      size: SizeConfig.scaleTextFont(15),
                      color: AppColors.TITLE,
                      align: TextAlign.center))
            ],
          ),
        ),
      ),
    );
  }
}
