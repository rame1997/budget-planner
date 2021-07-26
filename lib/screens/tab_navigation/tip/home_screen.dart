import 'package:badgetplanner/getx/actions_getx_controller.dart';
import 'package:badgetplanner/getx/users_getx_controller.dart';
import 'package:badgetplanner/models/models/actions.dart';
import 'package:badgetplanner/models/models/user.dart';
import 'package:badgetplanner/preferences/user_preferences.dart';
import 'package:badgetplanner/screens/action/action_details_screen.dart';
import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/CircularProgressInfo.dart';
import 'package:badgetplanner/widgets/button.dart';
import 'package:badgetplanner/widgets/home_item.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String date = DateFormat.MMMd('en').format(DateTime.now());
  ActionGetxController actions_getx_controller = Get.put(ActionGetxController());
  UsersGetxController user_getx_controller = Get.put(UsersGetxController());

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
                body: GetBuilder(
                builder: (ActionGetxController controller) {

    return Padding(
                    padding: EdgeInsets.only(
                        right: SizeConfig.scaleWidth(20),
                        left: SizeConfig.scaleWidth(20)),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Center(
                            child: CircularPercentIndicator(
                              radius: SizeConfig.scaleHeight(260),
                              lineWidth: 11.0,
                              percent: controller.totalExpenses.value /
                                  UsersGetxController.to.user.dayLimit,
                              backgroundColor: AppColors.BOTTON.withOpacity(0.1),
                              progressColor: AppColors.BOTTON,
                              circularStrokeCap: CircularStrokeCap.round,
                              center: CircularProgressInfo(
                                expenses: controller.totalExpenses.value,
                                balance:user_getx_controller.user.dayLimit
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
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(SizeConfig.scaleHeight(8)),
                                            boxShadow: [
                                              BoxShadow(
                                                offset: Offset(0, SizeConfig.scaleHeight(5)),
                                                blurRadius: SizeConfig.scaleHeight(18),
                                                spreadRadius: 0,
                                                color: AppColors.BOTTON_SHADOW,
                                              )
                                            ]),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: ListView.separated(
                                                shrinkWrap: true,
                                                padding: EdgeInsets.only(
                                                  left: SizeConfig.scaleWidth(12),
                                                  right: SizeConfig.scaleWidth(12),
                                                  top: SizeConfig.scaleHeight(10),
                                                  bottom: SizeConfig.scaleHeight(27),
                                                ),
                                                itemCount: controller.getTheLastActions().length,
                                                separatorBuilder:
                                                    (BuildContext context, int index) {
                                                  return Divider(
                                                    height: SizeConfig.scaleHeight(2),
color: AppColors.SUB_TITLE,
                                                  );
                                                },
                                                itemBuilder: (BuildContext context, int index) {
                                                  return Column(
                                                    children: [
                                                      index == 0
                                                          ? Column(
                                                        children: [
                                                          TextCustom(
                                                              title: DateFormat.yMd('en').format(controller.actions[index].date),
                                                              fontfamily: 'mon',
                                                              fontweight: FontWeight.w700,
                                                              size: SizeConfig.scaleTextFont(12),
                                                              color: AppColors.SUB_TITLE,
                                                              align: TextAlign.center),
                                                          SizedBox(
                                                            height:
                                                            SizeConfig.scaleHeight(20),
                                                          ),
                                                          HomeItem(
                                                            action: controller.actions[index],
                                                              onTap: () {
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder: (context) => ActionDetailsScreen(
                                                                      actionClass: controller.actions.elementAt(index),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                          ),
                                                        ],
                                                      )
                                                          : Column(
                                                        children: [
                                                          Visibility(
                                                            visible: controller
                                                                .actions[index].date !=
                                                                controller
                                                                    .actions[index - 1].date,
                                                            child:
                                                            TextCustom(
                                                                title: DateFormat.yMd('en').format(controller.actions[index].date),
                                                                fontfamily: 'mon',
                                                                fontweight: FontWeight.w700,
                                                                size: SizeConfig.scaleTextFont(12),
                                                                color: AppColors.SUB_TITLE,
                                                                align: TextAlign.center),
                                                          ),
                                                          HomeItem(
                                                            action: controller.actions[index],
                                                              onTap: () {
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder: (context) => ActionDetailsScreen(
                                                                      actionClass: controller.actions.elementAt(index),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              height: SizeConfig.scaleHeight(10),
                                            ),
                                            button(
                                              text: AppLocalizations.of(context)!.see_more,
                                              onPressed: () {
                                                print(date);
                                                Navigator.pushNamed(context, '/actions_screen');


                                              }, color:AppColors.BOTTON,
                                            ),
                                            SizedBox(
                                              height: SizeConfig.scaleHeight(20),
                                            ),
                                          ],
                                        )),
                                  )



                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
    ;}
                ))));
  }
  User get user {
    User user = SharedPrefController().getUser();
    return user;
  }


}
