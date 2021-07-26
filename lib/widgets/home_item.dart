import 'package:badgetplanner/getx/actions_getx_controller.dart';
import 'package:badgetplanner/getx/category_getx_controller.dart';
import 'package:badgetplanner/models/models/actions.dart';
import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeItem extends StatelessWidget {
  final ActionClass action;
  Function() onTap;
  HomeItem({ required this.action,
  required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding:  EdgeInsets.all(SizeConfig.scaleHeight(7)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(
                end: SizeConfig.scaleWidth(11),
              ),
              height: SizeConfig.scaleHeight(50),
              width: SizeConfig.scaleWidth(50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.TIP_COLOR,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  action.category.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.scaleTextFont(15),
                    color: AppColors.TITLE,
                  ),
                ),
                Visibility(
                  visible: action.notes.isNotEmpty,
                  child: Text(
                    action.notes,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: SizeConfig.scaleTextFont(15),
                      color: AppColors.SUB_TITLE,
                    ),
                  ),
                )
              ],
            ),
            Spacer(),
            Text(
              amount,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.scaleTextFont(15),
                color: action.expense ? AppColors.RED : AppColors.GREEN,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String get amount {
    String currencySymbol = getCurrencySymbol();
    return action.expense
        ? '- $currencySymbol ${action.amount}'
        : '+ $currencySymbol ${action.amount}';
  }

  String getCurrencySymbol() {
    if (action.currencyId == 1) {
      return '₪';
    } else if (action.currencyId == 2) {
      return '\$';
    } else {
      return 'JOD';
    }
  }
}
