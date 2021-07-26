import 'package:badgetplanner/getx/currency_getx_controller.dart';
import 'package:badgetplanner/models/models/currency.dart';
import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/currency_item.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({Key? key}) : super(key: key);

  @override
  _CurrencyScreenState createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  CurrencyGetxController controller = Get.put(CurrencyGetxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: TextCustom(
              title: AppLocalizations.of(context)!.currency,
              fontfamily: 'mon',
              fontweight: FontWeight.w700,
              size: SizeConfig.scaleTextFont(20),
              color: AppColors.TITLE,
              align: TextAlign.center),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => popFromCurrency(),
      ),),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          top: SizeConfig.scaleHeight(100),
          start: SizeConfig.scaleWidth(20),
          end: SizeConfig.scaleWidth(20),
        ),
        child: Container(
          clipBehavior: Clip.antiAlias,
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(15)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(7)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  offset: Offset(0, SizeConfig.scaleHeight(10)),
                  color: AppColors.BOTTON_SHADOW,
                  blurRadius: SizeConfig.scaleHeight(18),
                  spreadRadius: 0),
            ],
          ),
          child: GetX<CurrencyGetxController>(
            builder: (CurrencyGetxController controller) {
              return ListView.separated(
                itemCount: controller.currencies.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return CurrencyItem(
                    checked: controller.currencies[index].checked,
                    onTap: () {
                      controller.changeCheckStatus(index);
                    },
                    currency: controller.currencies[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                      height: SizeConfig.scaleHeight(4),
                      color: AppColors.SUB_TITLE);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void popFromCurrency() {
    Navigator.pop(context, CurrencyGetxController.to.getSelectedCurrency());
  }
}
