import 'package:badgetplanner/models/income_with_price.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/button.dart';
import 'package:badgetplanner/widgets/home_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter/material.dart';

class ActionsScreen extends StatefulWidget {
  const ActionsScreen({Key? key}) : super(key: key);

  @override
  _ActionsScreenState createState() => _ActionsScreenState();
}

class _ActionsScreenState extends State<ActionsScreen> {
  List<HomeItem> data_income_with_price = dataIncomeWithPrice;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon:
                  Icon( Icons.arrow_back,color: AppColors.BOTTON),
                ),
                title:  TextCustom(
                    title: AppLocalizations.of(context)!.actions,
                    fontfamily: 'mon',
                    fontweight: FontWeight.w700,
                    size: SizeConfig.scaleTextFont(20),
                    color: AppColors.TITLE,
                    align: TextAlign.center),

              ),body: Padding(
              padding:  EdgeInsets.only(left: SizeConfig.scaleWidth(20),right: SizeConfig.scaleWidth(20),top: SizeConfig.scaleHeight(20)),
              child: Column(
                children: [
                  Container(
                    height: SizeConfig.scaleHeight(44),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.TIP_COLOR,
                      borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(12)),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.only(left: SizeConfig.scaleWidth(13),right: SizeConfig.scaleWidth(13)),
                      child: Row(
                        children: [
                          Icon(Icons.search,color: AppColors.TITLE,size: SizeConfig.scaleHeight(24),),
                          SizedBox(width: SizeConfig.scaleWidth(8),),
                          Expanded(child: TextField(onTap : (){},
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search',
                              )
                          ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.scaleHeight(15),),
                  Expanded(
                   child: Scrollbar(
                      child:  Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.09),
                              spreadRadius: 0,
                              blurRadius: 2,
                              offset: Offset(3, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: SizeConfig.scaleHeight(15),
                                    right: SizeConfig.scaleWidth(8),
                                    left: SizeConfig.scaleWidth(8)),
                                child: ListView.separated(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 8,
                                  itemBuilder: (context, index) {
                                    return HomeItem(
                                      title: data_income_with_price[index].title,
                                      icon: data_income_with_price[index].icon,
                                      onTap: () {},
                                      date: data_income_with_price[index].date,
                                      money: data_income_with_price[index].money,
                                      subTitle:
                                      data_income_with_price[index].subTitle,
                                      priveousDate: data_income_with_price[index]
                                          .priveousDate, ic_ex: data_income_with_price[index].ic_ex,
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Padding(
                                      padding:  EdgeInsets.only(bottom: SizeConfig.scaleHeight(8)),
                                      child: Divider(
                                        color: AppColors.SUB_TITLE,
                                        height: SizeConfig.scaleHeight(2),
                                        indent: SizeConfig.scaleWidth(15),
                                        endIndent: SizeConfig.scaleWidth(15),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),)));
  }
}