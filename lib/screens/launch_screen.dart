import 'package:badgetplanner/preferences/user_preferences.dart';
import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      String route = SharedPrefController().loggedIn ? '/bottom_bavigation_bar_screen' : '/on_boarding_screen';
      Navigator.pushReplacementNamed(context, route);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
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
                align: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
