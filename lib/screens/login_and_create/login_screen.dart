import 'package:badgetplanner/Database/controllers/user_db_controller.dart';
import 'package:badgetplanner/getx/users_getx_controller.dart';
import 'package:badgetplanner/models/models/user.dart';
import 'package:badgetplanner/preferences/user_preferences.dart';
import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/button.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:badgetplanner/widgets/text_filed.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<LoginScreen> with Helpers{
  UsersGetxController _usersController = Get.put(UsersGetxController());
  late TextEditingController _emailTextEditingController;
  late TextEditingController _pinTextEditingController;
  String? _emailError;
  String? _pinError;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pinTextEditingController = TextEditingController();
    _emailTextEditingController = TextEditingController();

  }



  @override
  void dispose() {
    // TODO: implement dispose
    _pinTextEditingController.dispose();
    _emailTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(right: SizeConfig.scaleWidth(20),left: SizeConfig.scaleWidth(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: SizeConfig.scaleHeight(81),
              ),
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
                  title: AppLocalizations.of(context)!.login,
                  fontfamily: 'mon',
                  fontweight: FontWeight.w700,
                  size: SizeConfig.scaleTextFont(20),
                  color: AppColors.TITLE,
                  align: TextAlign.center),
              SizedBox(
                height: SizeConfig.scaleHeight(11),
              ),
              TextCustom(
                  title: AppLocalizations.of(context)!.login_message,
                  fontfamily: 'mon',
                  fontweight: FontWeight.w400,
                  size: SizeConfig.scaleTextFont(15),
                  color: AppColors.SUB_TITLE,
                  align: TextAlign.center),
              SizedBox(
                height: SizeConfig.scaleHeight(45),
              ),
              TextFiled('Email address', _emailTextEditingController, _emailError,
                  1, 1, TextInputType.text, false),
              SizedBox(
                height: SizeConfig.scaleHeight(15),
              ),
              TextFiled('Pin code', _pinTextEditingController, _pinError, 1, 1,
                  TextInputType.text, true),
              SizedBox(
                height: SizeConfig.scaleHeight(30),
              ),
              button(
                text: 'Login',
                onPressed: () {
                  performLogin();
                },
                  color: AppColors.BOTTON
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextCustom(
                      title: AppLocalizations.of(context)!.login_sub_message,
                      fontfamily: 'mon',
                      fontweight: FontWeight.w400,
                      size: SizeConfig.scaleTextFont(15),
                      color: AppColors.SUB_TITLE,
                      align: TextAlign.center),
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context, '/create_account_screen');

                  }, child: TextCustom(
                      title: AppLocalizations.of(context)!.login_create_message,
                      fontfamily: 'mon',
                      fontweight: FontWeight.w400,
                      size: SizeConfig.scaleTextFont(15),
                      color: AppColors.TEXT_SPAN,
                      align: TextAlign.center),)

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (_emailTextEditingController.text.isNotEmpty &&
        _pinTextEditingController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context, message: AppLocalizations.of(context)!.empty_field_error, error: true);

    return false;
  }

  Future<void> login() async {
    bool status = await _usersController.login(
        email: _emailTextEditingController.text, pin: _pinTextEditingController.text);
    if (status) {
      Navigator.pushReplacementNamed(context, '/bottom_bavigation_bar_screen');
    } else {
      showSnackBar(context, message: AppLocalizations.of(context)!.invalid_email_or_pin, error: true);

    }
  }

}



