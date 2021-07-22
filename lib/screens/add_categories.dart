import 'package:badgetplanner/getx/category_getx_controller.dart';
import 'package:badgetplanner/models/models/category.dart';
import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/helpers.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/button.dart';
import 'package:badgetplanner/widgets/income_expenses_contanier.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:badgetplanner/widgets/text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddCategories extends StatefulWidget {
  const AddCategories({Key? key}) : super(key: key);

  @override
  _AddCategoriesState createState() => _AddCategoriesState();
}

class _AddCategoriesState extends State<AddCategories> with Helpers{
  late TextEditingController _nameTextEditingController;
  String? _nameError;
  Color color = AppColors.BOTTON_SHADOW;
  int press1 = 0;
  int press2 = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameTextEditingController.dispose();
    super.dispose();
  }

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
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.clear_rounded,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                body: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.only(
                            right: SizeConfig.scaleWidth(20),
                            left: SizeConfig.scaleWidth(20)),
                        child: Column(children: [
                          Container(
                            height: SizeConfig.scaleHeight(100),
                            width: SizeConfig.scaleWidth(105),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
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
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.scaleWidth(25),
                                  vertical: SizeConfig.scaleHeight(22)),
                              child: SvgPicture.asset('images/add.svg'),
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.scaleHeight(13),
                          ),
                          TextCustom(
                              title: AppLocalizations.of(context)!.add_category,
                              fontfamily: 'mon',
                              fontweight: FontWeight.w700,
                              size: SizeConfig.scaleTextFont(20),
                              color: AppColors.TITLE,
                              align: TextAlign.center),
                          SizedBox(
                            height: SizeConfig.scaleHeight(50),
                          ),
                          GridView(
                            shrinkWrap: true,
                            padding: EdgeInsets.only(
                                bottom: SizeConfig.scaleHeight(20)),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 7,
                              crossAxisSpacing: 7,
                              childAspectRatio: (SizeConfig.scaleWidth(190) /
                                  SizeConfig.scaleHeight(92)),
                            ),
                            children: [
                              IncomeExpensesContanier(
                                title: AppLocalizations.of(context)!.expenses,
                                image: 'images/expe.png',
                                onPressed: () {
                                  setState(() {
                                   press1=1;
                                   press2=0;
                                  });
                                }, press: press1,
                              ),
                              IncomeExpensesContanier(
                                title: AppLocalizations.of(context)!.income,
                                image: 'images/income.png',
                                onPressed: () {
                                  setState(() {
                                    press2=2;
                                    press1=0;
                                  });
                                },
                                press: press2,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.scaleHeight(11),
                          ),
                          TextFiled(
                              'Enter category name',
                              _nameTextEditingController,
                              _nameError,
                              1,
                              1,
                              TextInputType.text,
                              false),
                          SizedBox(
                            height: SizeConfig.scaleHeight(150),
                          ),
                          button(
                              text: AppLocalizations.of(context)!.add,
                              onPressed: () {
                                performSave();
                              },
                              color: color),
                        ]))))));
  }

  Future performSave() async {
    if (checkData()) {
      await save();
      Navigator.pop(context);
    }
  }

  bool checkData() {
    if (_nameTextEditingController.text.isNotEmpty && categorySelect()) {
      return true;
    }
    showSnackBar(context, message:"add name" , error: true);
    return false;
  }

  Future save() async {
    bool created = await CategoryGetxController.to.createCategory(category);
    String message =
    created ?  AppLocalizations.of(context)!.category_created_successfully : AppLocalizations.of(context)!.category_created_field;
    showSnackBar(context, message: message, error: !created);
  }

  Category get category {
    Category category = Category();
    category.name = _nameTextEditingController.text;
    category.expense = press1 == 1;
    return category;
  }

  bool categorySelect() {
    if (press2 == 0) {
      if (press1 == 0) {
        return false;
      }
    }
    return true;
  }
}