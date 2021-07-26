import 'package:badgetplanner/getx/category_getx_controller.dart';
import 'package:badgetplanner/getx/currency_getx_controller.dart';
import 'package:badgetplanner/models/models/actions.dart';
import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/fixed_create_account_filed.dart';
import 'package:badgetplanner/widgets/income_expenses_contanier.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:badgetplanner/widgets/text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

class ActionDetailsScreen extends StatefulWidget {
  ActionClass actionClass;
  ActionDetailsScreen({required this.actionClass});

  @override
  _ActionDetailsScreenState createState() => _ActionDetailsScreenState();
}

class _ActionDetailsScreenState extends State<ActionDetailsScreen> {
  late TextEditingController _notetextEditingController;
  String? _nameError;
  String pinCode='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _notetextEditingController = TextEditingController(text: widget.actionClass.notes);

  }



  @override
  void dispose() {
    // TODO: implement dispose
    _notetextEditingController.dispose();
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
                  title: TextCustom(
                      title: AppLocalizations.of(context)!.expense_details,
                      fontfamily: 'mon',
                      fontweight: FontWeight.w700,
                      size: SizeConfig.scaleTextFont(20),
                      color: AppColors.TITLE,
                      align: TextAlign.center),
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
                              title:CategoryGetxController.to
                                  .getCategoryName(widget.actionClass.categoryId),
                              fontfamily: 'mon',
                              fontweight: FontWeight.w700,
                              size: SizeConfig.scaleTextFont(20),
                              color: AppColors.TITLE,
                              align: TextAlign.center),
                          SizedBox(
                            height: SizeConfig.scaleHeight(9),
                          ),
                          TextCustom(
                              title: widget.actionClass.currencyId==1?'\# '+widget.actionClass.amount.toString():widget.actionClass.currencyId==2?'\$ '+widget.actionClass.amount.toString():'\@ '+widget.actionClass.amount.toString(),
                              fontfamily: 'mon',
                              fontweight: FontWeight.w800,
                              size: SizeConfig.scaleTextFont(21),
                              color: AppColors.TITLE,
                              align: TextAlign.center),
                          SizedBox(
                            height: SizeConfig.scaleHeight(11),
                          ),
                          Row(
                            children: [
                              IncomeExpensesContanier(
                                onTap: () {},
                                title: 'Expenses',
                                selected: widget.actionClass.expense ? true : false,
                                icon: Icons.arrow_upward,
                                iconColor: AppColors.RED,
                              ),
                              SizedBox(width: SizeConfig.scaleWidth(5)),
                              IncomeExpensesContanier(
                                onTap: () {},
                                title: 'Income',
                                selected: widget.actionClass.expense ? false : true,
                                icon: Icons.arrow_downward,
                                iconColor: AppColors.GREEN,
                              ),
                            ],
                          ),

                          SizedBox(
                            height: SizeConfig.scaleHeight(11),
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
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(top: SizeConfig.scaleHeight(10),bottom: SizeConfig.scaleHeight(10)),
                                    child: TextFiledAccount(
                                      prifixColor: AppColors.PRFIX_TEXTFILED,
                                      prifix: AppLocalizations.of(context)!
                                          .categorie,
                                      hintColor: AppColors.SUB_TITLE,
                                      hint: CategoryGetxController.to
                                          .getCategoryName(widget.actionClass.categoryId),
                                      onpress: () {
                                        Navigator.pushNamed(context, '/currency_screen');
                                      },
                                    ),
                                  ),
                                  Divider(
                                    height: SizeConfig.scaleHeight(4),
                                    color: AppColors.SUB_TITLE,
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(top: SizeConfig.scaleHeight(10),bottom: SizeConfig.scaleHeight(10)),
                                    child: TextFiledAccount(
                                      prifixColor: AppColors.PRFIX_TEXTFILED,
                                      prifix: AppLocalizations.of(context)!
                                          .date,
                                      hintColor: AppColors.SUB_TITLE,
                                      hint: widget.actionClass.date.toString(),
                                      onpress: () {
                                        Navigator.pushNamed(context, '/currency_screen');
                                      },
                                    ),
                                  ),
                                  Divider(
                                    height: SizeConfig.scaleHeight(4),
                                    color: AppColors.SUB_TITLE,
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(top: SizeConfig.scaleHeight(10),bottom: SizeConfig.scaleHeight(10)),
                                    child: TextFiledAccount(
                                      prifixColor: AppColors.PRFIX_TEXTFILED,
                                      prifix: AppLocalizations.of(context)!
                                          .prifix_Currency,
                                      hintColor: AppColors.SUB_TITLE,
                                      hint: CurrencyGetxController.to
                                          .getCurrencyName(widget.actionClass.id),
                                      onpress: () {
                                        Navigator.pushNamed(context, '/currency_screen');
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
                          TextFiled(
                              widget.actionClass.notes,
                              _notetextEditingController,
                              _nameError,
                              1,
                              4,
                              TextInputType.text,
                              false),


                        ]))))));
  }}
