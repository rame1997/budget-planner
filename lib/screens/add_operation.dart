import 'package:badgetplanner/models/models/category.dart';
import 'package:badgetplanner/models/models/currency.dart';
import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/button.dart';
import 'package:badgetplanner/widgets/fixed_create_account_filed.dart';
import 'package:badgetplanner/widgets/income_expenses_contanier.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

import 'currency_screen.dart';
import 'new_operation_category.dart';

class AddOperation extends StatefulWidget {

  @override
  _AddOperationState createState() => _AddOperationState();
}

class _AddOperationState extends State<AddOperation> {
  late TextEditingController _notetextEditingController;
  late TextEditingController _moneytextEditingController;
  String? _nameError;
  String pinCode = '';
  int press1 = 0;
  int press2 = 0;
  String hint = 'Thu 2 Sep';
  DateTime? date =null;
  Currency? currency;
  Category? category;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _notetextEditingController = TextEditingController();
    _moneytextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _notetextEditingController.dispose();
    _moneytextEditingController.dispose();
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
                                controller: _moneytextEditingController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '\$ 0,00',
                                    hintStyle: TextStyle(
                                      color: AppColors.TITLE,
                                      fontSize: SizeConfig.scaleTextFont(21),
                                      fontWeight: FontWeight.w800
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.scaleHeight(11),
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
                                      hint: category != null ? category!.name : 'Food',
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
                                          category = selectedCategory;
                                        });
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
                                      hint:date == null ? hint : date.toString(),
                                      onpress: () {
                                        DateTime dateSelection=datePicker(context);
                                        setState(() {
                                          date = dateSelection;


                                        });
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
                                      hint: currency == null ? 'US dollars' : currency!.nameEn,
                                      onpress: () async {
                                        Currency selectedCurrency = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => CurrencyScreen(),
                                          ),
                                        );
                                        setState(() {
                                          currency = selectedCurrency;
                                        });
                                      },
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
                              controller: _notetextEditingController,
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
                              text: 'Add',
                              onPressed: () {
                                performLogin();
                              },
                              color: AppColors.BOTTON_SHADOW),
                        ]))))));
  }
  void performLogin() {
    if (checkData()) {
      send();
    }
  }

  bool checkData() {
    if (_notetextEditingController.text.isNotEmpty) {
      checkErrors();
      return true;
    }
    checkErrors();
    showSnackBar(message: 'Please, enter required data', error: true);
    return false;
  }

  void send() {}

  void showSnackBar({required String message, bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: error ? Colors.red : Colors.green,
      ),
    );
  }

  void checkErrors() {
    setState(() {
      _nameError = _notetextEditingController.text.isEmpty ? 'Enter Name ' : '';
    });
  }

DateTime datePicker(BuildContext context){
  late DateTime selectDate;
  DatePicker.showDatePicker(context,
      showTitleActions: true,
      minTime: DateTime(2015, 3, 5),
      maxTime: DateTime.now(), onChanged: (date) {
      }, onConfirm: (date) {
        selectDate=date;
      }, currentTime: DateTime.now(), locale: LocaleType.en);
  return selectDate;
}
}