import 'package:badgetplanner/Database/controllers/user_db_controller.dart';
import 'package:badgetplanner/getx/currency_getx_controller.dart';
import 'package:badgetplanner/getx/users_getx_controller.dart';
import 'package:badgetplanner/models/models/currency.dart';
import 'package:badgetplanner/models/models/user.dart';
import 'package:badgetplanner/screens/login_and_create/pin_code_screen.dart';
import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/helpers.dart';
import 'package:badgetplanner/widgets/button.dart';
import 'package:badgetplanner/widgets/fixed_create_account_filed.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:badgetplanner/widgets/textfiled_account.dart';
import 'package:flutter/material.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

import '../currency_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen>
    with Helpers {
  late TextEditingController _emailTextEditingController;
  late TextEditingController _nameTextEditingController;
  late TextEditingController _limitedTextEditingController;
  Currency? currency;
  String pinCode = '';
  bool _createdEnabled = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextEditingController = TextEditingController();
    _emailTextEditingController = TextEditingController();
    _limitedTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameTextEditingController.dispose();
    _emailTextEditingController.dispose();
    _limitedTextEditingController.dispose();
    super.dispose();
  }

  bool bottom = false;

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
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, color: AppColors.BOTTON),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      right: SizeConfig.scaleWidth(20),
                      left: SizeConfig.scaleWidth(20)),
                  child: Column(
                    children: [
                      Container(
                        height: SizeConfig.scaleHeight(100),
                        width: SizeConfig.scaleWidth(105),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
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
                          child: SvgPicture.asset('images/login.svg'),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.scaleHeight(13),
                      ),
                      TextCustom(
                          title: AppLocalizations.of(context)!.get_started,
                          fontfamily: 'mon',
                          fontweight: FontWeight.w700,
                          size: SizeConfig.scaleTextFont(20),
                          color: AppColors.TITLE,
                          align: TextAlign.center),
                      SizedBox(
                        height: SizeConfig.scaleHeight(11),
                      ),
                      TextCustom(
                          title:
                              AppLocalizations.of(context)!.get_started_message,
                          fontfamily: 'mon',
                          fontweight: FontWeight.w400,
                          size: SizeConfig.scaleTextFont(15),
                          color: AppColors.SUB_TITLE,
                          align: TextAlign.center),
                      SizedBox(
                        height: SizeConfig.scaleHeight(21),
                      ),
                      Container(
                        height: SizeConfig.scaleHeight(344),
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
                              TextfileCreateAccount(
                                prifixColor: AppColors.PRFIX_TEXTFILED,
                                prifix:
                                    AppLocalizations.of(context)!.prifix_name,
                                hintColor: AppColors.SUB_TITLE,
                                hint: 'None',
                                textEditingController:
                                    _nameTextEditingController, onChanged: (String value) => validateForm())
                              ,
                              Divider(
                                height: SizeConfig.scaleHeight(4),
                                color: AppColors.SUB_TITLE,
                              ),
                              TextfileCreateAccount(
                                prifixColor: AppColors.PRFIX_TEXTFILED,
                                prifix:
                                    AppLocalizations.of(context)!.prifix_email,
                                hintColor: AppColors.SUB_TITLE,
                                hint: 'None',
                                textEditingController:
                                    _emailTextEditingController, onChanged: (String value)  => validateForm() ,
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
                                  prifix: AppLocalizations.of(context)!
                                      .prifix_Currency,
                                  hintColor: AppColors.SUB_TITLE,
                                  hint: currency == null
                                      ? 'US dollars'
                                      : currency!.nameEn,
                                  onpress: () => navigateToCurrencyScreen()
                                ),
                              ),
                              Divider(
                                height: SizeConfig.scaleHeight(4),
                                color: AppColors.SUB_TITLE,
                              ),
                              TextfileCreateAccount(
                                prifixColor: AppColors.PRFIX_TEXTFILED,
                                prifix: AppLocalizations.of(context)!
                                    .prifix_Daily_limit,
                                hintColor: AppColors.SUB_TITLE,
                                hint: '\$ 5000',
                                textEditingController:
                                    _limitedTextEditingController, onChanged: (String value) => validateForm(),
                              ),
                              Divider(
                                height: SizeConfig.scaleHeight(4),
                                color: AppColors.SUB_TITLE,
                              ),
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: ()=>navigateToPinCodeScreen(),
                                    child: TextCustom(
                                        title: AppLocalizations.of(context)!
                                            .prifix_Set_your_pin,
                                        fontfamily: 'mon',
                                        fontweight: FontWeight.w500,
                                        size: SizeConfig.scaleTextFont(15),
                                        color: AppColors.PRFIX_TEXTFILED,
                                        align: TextAlign.center),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.scaleHeight(80),
                      ),
                      button(
                        text:AppLocalizations.of(context)!
                            .create_account,
                        onPressed: () async{
                         await performCreateAccount();
                        },
                        color: _createdEnabled
                            ? AppColors.BOTTON
                            : AppColors.BOTTON_SHADOW,
                      )
                    ],
                  ),
                ),
              ),
            )));
  }




  bool checkData() {
    if (_nameTextEditingController.text.isNotEmpty &&
        _emailTextEditingController.text.isNotEmpty &&
        _limitedTextEditingController.text.isNotEmpty &&
        pinCode.isNotEmpty  &&
        currency != null) {
      return true;
    }


    return false;
  }

  User get user {
    User user = User();
    user.name = _nameTextEditingController.text;
    user.email = _emailTextEditingController.text;
    user.currencyId = currency!.id;
    user.dayLimit = double.parse(_limitedTextEditingController.text);
    user.pin = int.parse(pinCode);
    return user;

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
        currency = selectedCurrency;
      });
      validateForm();
    }
  }
  void navigateToPinCodeScreen() async {
    String code = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PinCodeScreen(),
      ),
    );
    if (code != null) {
      setState(() {
        pinCode = code;
      });
      validateForm();
    }
  }
  void validateForm() {
    updateEnableStatus(checkData());
  }

  void updateEnableStatus(bool status) {
    setState(() {
      _createdEnabled = status;
    });
  }


  Future<void> performCreateAccount() async {
    if (_createdEnabled) {
      await createAccount();
    } else {
      showSnackBar(context,
          message: AppLocalizations.of(context)!.invalid_email_or_pin, error: true);    }
  }
  Future<void> createAccount() async {
    bool status = await UsersGetxController.to.createAccount(user: user);
    if(status){
      CurrencyGetxController.to.undoCheckedCurrency();
      Navigator.pushReplacementNamed(context, '/create_account_success_screen');
    }else{
      //SHOW MESSAGE - ERROR
    }
  }
}

