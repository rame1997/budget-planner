import 'package:badgetplanner/getx/actions_getx_controller.dart';
import 'package:badgetplanner/getx/category_getx_controller.dart';
import 'package:badgetplanner/getx/currency_getx_controller.dart';
import 'package:badgetplanner/getx/users_getx_controller.dart';
import 'package:badgetplanner/models/models/actions.dart';
import 'package:badgetplanner/models/models/category.dart';
import 'package:badgetplanner/models/models/currency.dart';
import 'package:badgetplanner/preferences/user_preferences.dart';
import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/enums.dart';
import 'package:badgetplanner/utilities/helpers.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/button.dart';
import 'package:badgetplanner/widgets/fixed_create_account_filed.dart';
import 'package:badgetplanner/widgets/income_expenses_contanier.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../currency_screen.dart';
import 'new_operation_category.dart';

class AddOperation extends StatefulWidget {

  @override
  _AddOperationState createState() => _AddOperationState();
}

class _AddOperationState extends State<AddOperation> with Helpers {
  CategoryType? _categoryType;
  bool _addEnabled = false;
  Currency? _currency;
  Category? _category;
String hint='10/7/2020';
  DateTime? _pickedDateValue;
  String? _pickedDate;

  late TextEditingController _actionAmountTextController;
  late TextEditingController _noteTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _actionAmountTextController = TextEditingController();
    _noteTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _actionAmountTextController.dispose();
    _noteTextController.dispose();
    CategoryGetxController.to.undoCheckedCategory();
    CurrencyGetxController.to.undoCheckedCurrency();
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
                              title:
                                  AppLocalizations.of(context)!.add_operation,
                              fontfamily: 'mon',
                              fontweight: FontWeight.w700,
                              size: SizeConfig.scaleTextFont(20),
                              color: AppColors.TITLE,
                              align: TextAlign.center),
                          SizedBox(
                            height: SizeConfig.scaleHeight(30),
                          ),
                          Center(
                            child: Container(
                              height: SizeConfig.scaleHeight(23),
                              width: SizeConfig.scaleHeight(67),
                              child: TextField(
                                controller: _actionAmountTextController,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                maxLength: 8,
                                onChanged: (String value) => validateForm(),
                                style: TextStyle(
                                  color: AppColors.SUB_TITLE,
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeConfig.scaleTextFont(21),
                                ),
                                decoration: InputDecoration(
                                  counterText: '',
                                  hintText: '\$ 0,00',
                                  hintStyle: TextStyle(
                                    color: AppColors.PRFIX_TEXTFILED,
                                    fontWeight: FontWeight.bold,
                                    fontSize: SizeConfig.scaleTextFont(21),
                                  ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.scaleHeight(11),
                          ),
                          Row(
                            children: [
                              IncomeExpensesContanier(
                                onTap: () {},
                                title: 'Expenses',
                                selected: _categoryType == CategoryType.Expense,
                                icon: Icons.arrow_upward,
                                iconColor: AppColors.RED,
                              ),
                              SizedBox(width: SizeConfig.scaleWidth(5)),
                              IncomeExpensesContanier(
                                onTap: () {},
                                title: 'Income',
                                selected: _categoryType == CategoryType.Income,
                                icon: Icons.arrow_downward,
                                iconColor: AppColors.GREEN,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.scaleHeight(5),
                          ),
                          Container(
                            height: SizeConfig.scaleHeight(208),
                            width: SizeConfig.scaleWidth(374),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
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
                                  horizontal: SizeConfig.scaleWidth(22),
                                  vertical: SizeConfig.scaleHeight(15)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: SizeConfig.scaleHeight(10),
                                        bottom: SizeConfig.scaleHeight(10)),
                                    child: TextFiledAccount(
                                      prifixColor: AppColors.PRFIX_TEXTFILED,
                                      prifix: AppLocalizations.of(context)!
                                          .categorie,
                                      hintColor: AppColors.SUB_TITLE,
                                      hint: _category != null ? _category!.name : 'Food',
                                      onpress: () async {
                                        Category selectedCategory =
                                            await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                NewOperationCategory(),
                                          ),
                                        );
                                        setState(() {
                                          _category = selectedCategory;
                                          changeCategoryType(
                                              _category!.expense ? CategoryType.Expense : CategoryType.Income);
                                        });
                                        validateForm();
                                      },
                                    ),
                                  ),
                                  Divider(
                                    height: SizeConfig.scaleHeight(4),
                                    color: AppColors.SUB_TITLE,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: SizeConfig.scaleHeight(10),
                                        bottom: SizeConfig.scaleHeight(10)),
                                    child: TextFiledAccount(
                                      prifixColor: AppColors.PRFIX_TEXTFILED,
                                      prifix:
                                          AppLocalizations.of(context)!.date,
                                      hintColor: AppColors.SUB_TITLE,
                                      hint:_pickedDate ?? hint,
                                      onpress: () async {
                                        await datePicker();
                                      },
                                    ),
                                  ),
                                  Divider(
                                    height: SizeConfig.scaleHeight(4),
                                    color: AppColors.SUB_TITLE,
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(top: SizeConfig.scaleHeight(10),bottom: SizeConfig.scaleHeight(10)),
                                    child:TextFiledAccount(
                                      prifixColor: AppColors.PRFIX_TEXTFILED,
                                      prifix: AppLocalizations.of(context)!
                                          .prifix_Currency,
                                      hintColor: AppColors.SUB_TITLE,
                                      hint: _currency == null ? 'US dollars' : _currency!.nameEn,
                                      onpress: () => navigateToCurrencyScreen()
                                      ,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.scaleHeight(11),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(8),vertical: SizeConfig.scaleHeight(8)),
                            clipBehavior: Clip.antiAlias,
                            height: SizeConfig.scaleHeight(100),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
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
                            child: TextField(
                              controller: _noteTextController,
                              maxLines: 3,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                  hintText: 'Note'
                              )
                              ,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.scaleHeight(25),
                          ),
                          button(
                              text: AppLocalizations.of(context)!
                                  .add,
                              onPressed: () async{
                                await performAdd();
                              },
                            color:_addEnabled
                                ? AppColors.BOTTON
                                : AppColors.BOTTON_SHADOW,),
                        ]))))));
  }
  Future performAdd() async {
    if (checkData()) {
      await save();
    }
  }

  Future<void> save() async {
    if (_addEnabled) {
      print(_pickedDate);
      bool created = await ActionGetxController.to.create(action: action);
      print(created);
      if (created) {
        showSnackBar(context,
            message: AppLocalizations.of(context)!.success_add_operation);
        Navigator.pushReplacementNamed(
            context, '/new_operation_success');
      } else {
        showSnackBar(context,
            message: AppLocalizations.of(context)!.operation_created_field,
            error: true);
      }
      if (created) clear();
    }
  }

  ActionClass get action {
    ActionClass action = ActionClass();
    action.amount = double.parse(_actionAmountTextController.text);
    action.expense = _category!.expense;
    action.date = _pickedDateValue!;
    action.userId = UsersGetxController.to.user.id;
    action.currencyId = _currency!.id;
    action.categoryId = _category!.id;
    action.notes = _noteTextController.text;
    return action;
  }

  void clear() {
    CategoryGetxController.to.undoCheckedCategory();
    CurrencyGetxController.to.undoCheckedCurrency();
    _actionAmountTextController.text = '';
    _noteTextController.text = '';
    setState(() {
      _pickedDateValue = null;
      _pickedDate = null;
      _categoryType = null;
      _category = null;
      _currency = null;
    });
  }
  Future datePicker() async {
    DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: _pickedDateValue ?? DateTime.now(),
      firstDate: DateTime(2021, 1, 1),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (dateTime != null) {
      _pickedDateValue = dateTime;
      var format = DateFormat.yMd('en');
      setState(() {
        _pickedDate = format.format(dateTime);
      });
      validateForm();
    }
  }

  void validateForm() {
    updateEnableStatus(checkData());
  }

  void updateEnableStatus(bool status) {
    setState(() {
      _addEnabled = status;
    });
  }

  bool checkData() {
    if (_actionAmountTextController.text.isNotEmpty &&
        _category != null &&
        _pickedDate != null &&
        _currency != null) {
      return true;
    }
    return false;
  }
  void navigateToCurrencyScreen() async {
    Currency selectedCurrency =
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CurrencyScreen(),
      ),
    );
    if (selectedCurrency != null) {
      setState(() {
        _currency = selectedCurrency;
      });
      validateForm();
    }
  }
  void changeCategoryType(CategoryType? categoryType) {
    setState(() {
      _categoryType = categoryType;
    });
    validateForm();
  }

}
