import 'package:badgetplanner/getx/actions_getx_controller.dart';
import 'package:badgetplanner/getx/category_getx_controller.dart';
import 'package:badgetplanner/models/models/actions.dart';
import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {

  Function() onTap;
  int index;
  ActionClass actionClass;

  HomeItem({required this.index,
    required this.actionClass,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: ActionsGetxController.to.action[index].date !=
              ActionsGetxController.to.action[index - 1].date,
          child: TextCustom(
              title: actionClass.date,
              fontfamily: 'mon',
              fontweight: FontWeight.w800,
              size: SizeConfig.scaleTextFont(12),
              color: AppColors.SUB_TITLE,
              align: TextAlign.center),
        ),
        ListTile(
          onTap: onTap,
          leading: Icon(Icons.note),
          //Icons.note
          title: TextCustom(
              title: CategoryGetxController.to
                  .getCategoryName(actionClass.categoryId),
              //'Food',
              fontfamily: 'mon',
              fontweight: FontWeight.w800,
              size: SizeConfig.scaleTextFont(15),
              color: AppColors.TITLE,
              align: TextAlign.start),
          subtitle: TextCustom(
              title: actionClass.notes,
              //'Pizza Day',
              fontfamily: 'mon',
              fontweight: FontWeight.w400,
              size: SizeConfig.scaleTextFont(15),
              color: AppColors.SUB_TITLE,
              align: TextAlign.start),
          trailing: TextCustom(
              title: actionClass.expense
                  ? '- \$' + actionClass.amount.toString()
                  : '+ \$' + actionClass.amount.toString(),
              //'-\$223'
              fontfamily: 'mon',
              fontweight: FontWeight.w800,
              size: SizeConfig.scaleTextFont(15),
              color:actionClass.expense ? AppColors.RED : AppColors.GREEN ,
              align: TextAlign.center),
        ),
      ],
    );
  }
}
