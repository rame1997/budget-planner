import 'package:badgetplanner/models/income_with_price.dart';
import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/button.dart';
import 'package:badgetplanner/widgets/home_item.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../expense_details_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<HomeItem> data_income_with_price = dataIncomeWithPrice;
  String date = DateFormat.MMMd('en').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: TextCustom(
                      title: AppLocalizations.of(context)!.home,
                      fontfamily: 'mon',
                      fontweight: FontWeight.w700,
                      size: SizeConfig.scaleTextFont(20),
                      color: AppColors.TITLE,
                      align: TextAlign.center),
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/setting_screen');
                      },
                      icon: Icon(
                        Icons.settings,
                        color: AppColors.BOTTON,
                      ),
                    )
                  ],
                ),
                body: Padding(
                  padding: EdgeInsets.only(
                      right: SizeConfig.scaleWidth(20),
                      left: SizeConfig.scaleWidth(20)),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(
                          child: CircularPercentIndicator(
                            radius: 220.0,
                            lineWidth: 13.0,
                            animation: true,
                            percent: 0.7,
                            progressColor: AppColors.BOTTON,
                            center: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.scaleWidth(30),
                                  vertical: SizeConfig.scaleHeight(40)),
                              child: Column(
                                children: [
                                  TextCustom(
                                      title: '\$ 765',
                                      fontfamily: 'mon',
                                      fontweight: FontWeight.w800,
                                      size: SizeConfig.scaleTextFont(18),
                                      color: AppColors.TITLE,
                                      align: TextAlign.center),
                                  SizedBox(
                                    height: SizeConfig.scaleHeight(3),
                                  ),
                                  TextCustom(
                                      title: AppLocalizations.of(context)!
                                          .spent_today,
                                      fontfamily: 'mon',
                                      fontweight: FontWeight.w400,
                                      size: SizeConfig.scaleTextFont(16.5),
                                      color: AppColors.SUB_TITLE,
                                      align: TextAlign.center),
                                  Divider(
                                    indent: SizeConfig.scaleWidth(15),
                                    endIndent: SizeConfig.scaleWidth(15),
                                    color: AppColors.BACKGROUND,
                                    height: 30,
                                  ),
                                  TextCustom(
                                      title: AppLocalizations.of(context)!
                                          .balance_for_today,
                                      fontfamily: 'mon',
                                      fontweight: FontWeight.w400,
                                      size: SizeConfig.scaleTextFont(16.5),
                                      color: AppColors.SUB_TITLE,
                                      align: TextAlign.center),
                                  TextCustom(
                                      title: '\$ 1267 ',
                                      fontfamily: 'mon',
                                      fontweight: FontWeight.w400,
                                      size: SizeConfig.scaleTextFont(16.5),
                                      color: AppColors.GREEN,
                                      align: TextAlign.center),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.scaleHeight(23),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: TextCustom(
                              title: AppLocalizations.of(context)!.last_actions,
                              fontfamily: 'mon',
                              fontweight: FontWeight.w700,
                              size: SizeConfig.scaleTextFont(20),
                              color: AppColors.TITLE,
                              align: TextAlign.start),
                        ),
                        SizedBox(
                          height: SizeConfig.scaleHeight(21),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: SizeConfig.scaleHeight(15)),
                          child: Container(
                            height: SizeConfig.scaleHeight(487),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
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
                                      itemCount: 4,
                                      itemBuilder: (context, index) {
                                        return HomeItem(
                                          title: data_income_with_price[index].title,
                                          icon: data_income_with_price[index].icon,
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => ExpenseDetailsScreen(title: data_income_with_price[index].title, money: data_income_with_price[index].money, note: '', currany: 'Dollar (\$)', date: data_income_with_price[index].date,in_ex:data_income_with_price[index].ic_ex ,
                                                      )),
                                            );
                                          },
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
                                SizedBox(
                                  height: SizeConfig.scaleHeight(20),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: SizeConfig.scaleWidth(16),
                                      left: SizeConfig.scaleWidth(16)),
                                  child: button(
                                    text: AppLocalizations.of(context)!.see_more,
                                    onPressed: () {
                                      print(date);
                                      Navigator.pushNamed(context, '/actions_screen');


                                    }, color:AppColors.BOTTON,
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig.scaleHeight(20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))));
  }
}
