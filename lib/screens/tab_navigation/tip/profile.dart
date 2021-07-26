import 'package:badgetplanner/getx/actions_getx_controller.dart';
import 'package:badgetplanner/getx/currency_getx_controller.dart';
import 'package:badgetplanner/getx/users_getx_controller.dart';
import 'package:badgetplanner/models/models/currency.dart';
import 'package:badgetplanner/models/models/user.dart';
import 'package:badgetplanner/screens/login_and_create/pin_code_screen.dart';
import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/helpers.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/button.dart';
import 'package:badgetplanner/widgets/fixed_create_account_filed.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:badgetplanner/widgets/textfiled_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../currency_screen.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with Helpers {
  UsersGetxController user_getx_controller = Get.put(UsersGetxController());
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
    // getUser().whenComplete((){
    //   setState(() {
    //
    //   });
    // });
    User user = user_getx_controller.user;
    _nameTextEditingController = TextEditingController(text: user.name);
    _emailTextEditingController = TextEditingController(text: user.email);
    _limitedTextEditingController =
        TextEditingController(text: user.dayLimit.toString());
    currency= CurrencyGetxController.to
        .getCurrencyById(id: user.currencyId, setSelected: true);
    pinCode = user.pin.toString();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameTextEditingController.dispose();
    _emailTextEditingController.dispose();
    _limitedTextEditingController.dispose();
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
               title: TextCustom( title: AppLocalizations.of(context)!.profile,
                   fontfamily: 'mon',
                   fontweight: FontWeight.w700,
                   size: SizeConfig.scaleTextFont(20),
                   color: AppColors.TITLE,
                   align: TextAlign.center),
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
                          child: SvgPicture.asset('images/profile.svg'),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.scaleHeight(13),
                      ),
                      TextCustom(
                          title: user_getx_controller.user.name,
                          fontfamily: 'mon',
                          fontweight: FontWeight.w700,
                          size: SizeConfig.scaleTextFont(20),
                          color: AppColors.TITLE,
                          align: TextAlign.center),
                      SizedBox(
                        height: SizeConfig.scaleHeight(20),
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                            right: SizeConfig.scaleWidth(8),
                            left: SizeConfig.scaleWidth(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
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
                                      hint: user_getx_controller.user.name,
                                      textEditingController:
                                      _nameTextEditingController, onChanged:(String value) => validateForm(),
                                    ),
                                    Divider(
                                      height: SizeConfig.scaleHeight(4),
                                      color: AppColors.SUB_TITLE,
                                    ),
                                    TextfileCreateAccount(
                                      prifixColor: AppColors.PRFIX_TEXTFILED,
                                      prifix:
                                      AppLocalizations.of(context)!.prifix_email,
                                      hintColor: AppColors.SUB_TITLE,
                                      hint: user_getx_controller.user.email,
                                      textEditingController:
                                      _emailTextEditingController, onChanged: (String value) => validateForm(),
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
                                            ? CurrencyGetxController.to
                                            .getCurrencyName(getUser.currencyId)
                                            : currency!.nameEn,
                                        onpress: () async {
                                          Currency selectedCurrency =
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => CurrencyScreen(),
                                            ),
                                          );
                                          setState(() {
                                            currency = selectedCurrency;
                                          });
                                          validateForm();
                                        },
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
                                      hint: user_getx_controller.user.dayLimit.toString(),
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
                                          onPressed: ()=> navigateToPinCodeScreen(),
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
                              height: SizeConfig.scaleHeight(10),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.scaleHeight(35),
                      ),
                      button(
                        text: AppLocalizations.of(context)!.save,
                        onPressed: () {
                          Navigator.pushNamed(context, '/bottom_bavigation_bar_screen');
                          performSave();


                        },color: _createdEnabled
                          ? AppColors.BOTTON
                          : AppColors.BOTTON_SHADOW,
                      )
                    ],
                  ),
                ),
              ),
            )));
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
  bool checkData() {
    return _emailTextEditingController.text.isNotEmpty &&
        _limitedTextEditingController.text.isNotEmpty &&
        currency != null &&
        _nameTextEditingController.text.isNotEmpty &&
        pinCode.isNotEmpty;
  }
  Future<void> performSave() async {
    if (_createdEnabled) {
      await updateProfile();
    } else {
      //SHOW ERROR MESSAGE
    }
  }
  Future<void> updateProfile() async {
    bool status = await UsersGetxController.to.createAccount(user: getUser);
    if (status) {
      CurrencyGetxController.to.undoCheckedCurrency();
      showSnackBar(context, message: AppLocalizations.of(context)!.account_updated_successfully);
      Navigator.pushReplacementNamed(context, '/success_screen');
    } else {
      showSnackBar(context, message:AppLocalizations.of(context)!.account_updated_field);    }
  }

  User get getUser {
    User user = UsersGetxController.to.user;
    user.name = _nameTextEditingController.text;
    user.email = _emailTextEditingController.text;
    user.pin = int.parse(pinCode);
    user.dayLimit = double.parse(_limitedTextEditingController.text);
    user.currencyId = currency!.id;
    return user;
  }


}





