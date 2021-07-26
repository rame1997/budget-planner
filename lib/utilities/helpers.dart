import 'package:badgetplanner/getx/users_getx_controller.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'app_colors.dart';
mixin Helpers {
  void showSnackBar(BuildContext context,
      {required String message, bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
  Future<bool> deleteDialog({
    required BuildContext context,
    required String title,
    required String content,
  }) async {
    bool status = await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(SizeConfig.scaleHeight(12)),
                side: BorderSide(
                    color: Colors.red.shade900,
                    width: 2
                )
            ),
            title: TextCustom(
                title: title,
                fontfamily: 'mon',
                fontweight: FontWeight.w500,
                size: SizeConfig.scaleTextFont(15),
                color: AppColors.RED,
                align: TextAlign.left),
            content: TextCustom(
                title: content,
                fontfamily: 'mon',
                fontweight: FontWeight.w400,
                size: SizeConfig.scaleTextFont(12),
                color: AppColors.TITLE,
                align: TextAlign.left),
            actions: [
              TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },child: TextCustom(
                  title: AppLocalizations.of(context)!
                      .no,
                  fontfamily: 'mon',
                  fontweight: FontWeight.w500,
                  size: SizeConfig.scaleTextFont(12),
                  color: AppColors.TITLE,
                  align: TextAlign.left),),
              TextButton(
                onPressed: ()async {
                  await UsersGetxController.to.clearAccountData();
                   showSnackBar(context, message: 'User account data cleared',);
                },child: TextCustom(
                  title: AppLocalizations.of(context)!.yes,
                  fontfamily: 'mon',
                  fontweight: FontWeight.w500,
                  size: SizeConfig.scaleTextFont(12),
                  color: AppColors.RED,
                  align: TextAlign.left),)
            ],

          );
        });
    return status;
  }
}
showAlertDialog(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
            side: BorderSide(color:AppColors.RED)),
        title: TextCustom(
            title: AppLocalizations.of(context)!
                .alet_clear_account_title,
            fontfamily: 'mon',
            fontweight: FontWeight.w500,
            size: SizeConfig.scaleTextFont(15),
            color: AppColors.RED,
            align: TextAlign.left),
        content: TextCustom(
            title: AppLocalizations.of(context)!
                .alet_clear_account_message,
            fontfamily: 'mon',
            fontweight: FontWeight.w400,
            size: SizeConfig.scaleTextFont(12),
            color: AppColors.TITLE,
            align: TextAlign.left),
        actions: [
          TextButton(
            onPressed: (){
              Navigator.of(context).pop();
            },child: TextCustom(
              title: AppLocalizations.of(context)!
                  .no,
              fontfamily: 'mon',
              fontweight: FontWeight.w500,
              size: SizeConfig.scaleTextFont(12),
              color: AppColors.TITLE,
              align: TextAlign.left),),
          TextButton(
            onPressed: (){
            },child: TextCustom(
              title: AppLocalizations.of(context)!.yes,
              fontfamily: 'mon',
              fontweight: FontWeight.w500,
              size: SizeConfig.scaleTextFont(12),
              color: AppColors.RED,
              align: TextAlign.left),)
        ],
      ));
}