import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

class NewOperationSuccess extends StatefulWidget {
  @override
  _NewOperationSuccessState createState() => _NewOperationSuccessState();
}

class _NewOperationSuccessState extends State<NewOperationSuccess> {
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

            SizedBox(height: SizeConfig.scaleHeight(28),),
            TextCustom(
                title: AppLocalizations.of(context)!.well_done,
                fontfamily: 'mon',
                fontweight: FontWeight.w700,
                size: SizeConfig.scaleTextFont(15),
                color: AppColors.TITLE,
                align: TextAlign.center),
            SizedBox(height: SizeConfig.scaleHeight(12),),

            TextCustom(
                title: AppLocalizations.of(context)!.message_operation_success,
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
