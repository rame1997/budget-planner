import 'package:badgetplanner/getx/category_getx_controller.dart';
import 'package:badgetplanner/models/models/category.dart';
import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/button.dart';
import 'package:badgetplanner/widgets/list_income.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: DefaultTabController(
                length: 2,
                initialIndex: 1,
                child: Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      title: TextCustom(
                          title: AppLocalizations.of(context)!.categories,
                          fontfamily: 'mon',
                          fontweight: FontWeight.w700,
                          size: SizeConfig.scaleTextFont(20),
                          color: AppColors.TITLE,
                          align: TextAlign.center),
                      leading: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back),
                        color: AppColors.BOTTON,
                      ),
                      actions: [
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, '/add_categories_screen');
                          },
                          icon: Icon(Icons.add),
                          color: AppColors.BOTTON,
                        )
                      ],
                    ),
                    body: GetBuilder(
                      builder: (CategoryGetxController controller) {
                        List<Category> expenses = controller.category
                            .where((element) => element.expense)
                            .toList();
                        List<Category> income = controller.category
                            .where((element) => !element.expense)
                            .toList();
                        return Column(
                          children: [
                            SizedBox(
                              height: SizeConfig.scaleHeight(10),
                            ),
                            Container(
                              height: SizeConfig.scaleHeight(40),
                              margin: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.scaleWidth(15)),
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: AppColors.TIP_COLOR,
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.scaleHeight(20)),
                              ),
                              child: TabBar(
                                controller: tabController,
                                unselectedLabelColor: Colors.black,
                                indicator: BoxDecoration(
                                  color: AppColors.BOTTON,
                                  borderRadius: BorderRadius.circular(
                                      SizeConfig.scaleHeight(40)),
                                ),
                                labelStyle: TextStyle(
                                  fontSize: SizeConfig.scaleTextFont(13),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                ),
                                tabs: [
                                  Tab(
                                      text: AppLocalizations.of(context)!
                                          .expenses),
                                  Tab(
                                      text:
                                          AppLocalizations.of(context)!.income),
                                ],
                              ),
                            ),
                            SizedBox(height: SizeConfig.scaleHeight(10)),
                            Expanded(
                              child: TabBarView(
                                controller: tabController,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: SizeConfig.scaleWidth(15),
                                        vertical: SizeConfig.scaleHeight(15)),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: SizeConfig.scaleWidth(15)),
                                    child: ListView.separated(
                                      itemCount: expenses.length,
                                      shrinkWrap: true,
                                      padding: EdgeInsets.zero,
                                      itemBuilder: (context, index) {
                                        return ListIncome(
                                          category: expenses[index],
                                          onTap: () {},
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return Divider(
                                            height: 0,
                                            color: AppColors.SUB_TITLE);
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          SizeConfig.scaleHeight(12)),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            offset: Offset(
                                                0, SizeConfig.scaleHeight(10)),
                                            color: AppColors.BOTTON_SHADOW,
                                            blurRadius:
                                                SizeConfig.scaleHeight(18),
                                            spreadRadius: 0),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: SizeConfig.scaleWidth(15),
                                        vertical: SizeConfig.scaleHeight(15)),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: SizeConfig.scaleWidth(15)),
                                    child: ListView.separated(
                                      itemCount: income.length,
                                      shrinkWrap: true,
                                      padding: EdgeInsets.zero,
                                      itemBuilder: (context, index) {
                                        return ListIncome(
                                          category: income[index],
                                          onTap: () {},
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return Divider(
                                          height: 0,
                                          color: AppColors.SUB_TITLE,
                                        );
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          SizeConfig.scaleHeight(12)),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            offset: Offset(
                                                0, SizeConfig.scaleHeight(10)),
                                            color: AppColors.BOTTON_SHADOW,
                                            blurRadius:
                                                SizeConfig.scaleHeight(18),
                                            spreadRadius: 0),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    )))));
  }
}
