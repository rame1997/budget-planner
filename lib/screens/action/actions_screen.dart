import 'package:badgetplanner/getx/actions_getx_controller.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/home_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'action_details_screen.dart';

class ActionsScreen extends StatefulWidget {
  const ActionsScreen({Key? key}) : super(key: key);

  @override
  _ActionsScreenState createState() => _ActionsScreenState();
}

class _ActionsScreenState extends State<ActionsScreen> {

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
                    child: Container(
                      margin: EdgeInsets.only(bottom: SizeConfig.scaleHeight(10), top: SizeConfig.scaleHeight(10)),
                      child: GetBuilder<ActionGetxController>(
                          builder: (ActionGetxController controller) {
                            return ListView.separated(
                              itemCount: controller.actions.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                return HomeItem(
                                  action: controller.actions.elementAt(index),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ActionDetailsScreen(
                                           actionClass: controller.actions.elementAt(index),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Divider(
                                    height: 0, color: AppColors.SUB_TITLE,
                                endIndent: SizeConfig.scaleWidth(15),
                                indent: SizeConfig.scaleWidth(15),
                                );
                              },
                            );
                          }),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(20)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            offset: Offset(0, SizeConfig.scaleHeight(10)),
                            color: AppColors.BOTTON_SHADOW,
                            blurRadius: SizeConfig.scaleHeight(18),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),)));
  }
}