import 'package:badgetplanner/models/models/currency.dart';
import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class CurrencyItem extends StatelessWidget {
  final Currency currency;
  final void Function() onTap;
  final bool checked;

  CurrencyItem(
      {required this.currency, required this.onTap, required this.checked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            CircleAvatar(
              child: Text(
                currency.nameEn[0],
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: AppColors.BOTTON,
              radius: 20,
            ),
            SizedBox(width: 15),
            Text(currency.nameEn),
            Spacer(),
            Icon(
              Icons.check,
              color: checked ? AppColors.BOTTON : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
