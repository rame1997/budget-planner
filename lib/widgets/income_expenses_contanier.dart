import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter/material.dart';

class IncomeExpensesContanier extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final bool selected;
  final void Function() onTap;

  IncomeExpensesContanier({
    required this.onTap,
    required this.title,
    required this.icon,
    required this.iconColor,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: SizeConfig.scaleHeight(92),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            border: selected ? Border.all(color: iconColor, width: 2) : null,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 3),
                  color: Colors.black.withOpacity(0.16),
                  blurRadius: 6,
                  spreadRadius: 0
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: iconColor,
              ),
              SizedBox(height: SizeConfig.scaleHeight(8)),
              Text(
                title,
                style: TextStyle(
                  color: AppColors.PRFIX_TEXTFILED,
                  fontSize: SizeConfig.scaleTextFont(15),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
