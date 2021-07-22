import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

class CreateAccountSuccessScreen extends StatefulWidget {
  @override
  _CreateAccountSuccessScreenState createState() => _CreateAccountSuccessScreenState();
}

class _CreateAccountSuccessScreenState extends State<CreateAccountSuccessScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/bottom_bavigation_bar_screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(23),vertical: SizeConfig.scaleHeight(29)),
              height: SizeConfig.scaleHeight(140),
              width: SizeConfig.scaleWidth(143),
              child: SvgPicture.asset('images/create_account_success.svg'),
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

            SizedBox(height: SizeConfig.scaleHeight(15),),
            TextCustom(
                title: AppLocalizations.of(context)!.title_success,
                fontfamily: 'mon',
                fontweight: FontWeight.w700,
                size: SizeConfig.scaleTextFont(15),
                color: AppColors.TITLE,
                align: TextAlign.center),
            SizedBox(height: SizeConfig.scaleHeight(7),),

            TextCustom(
                title: AppLocalizations.of(context)!.sub_title_success,
                fontfamily: 'mon',
                fontweight: FontWeight.w300,
                size: SizeConfig.scaleTextFont(15),
                color: AppColors.TITLE,
                align: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
