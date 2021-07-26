import 'package:badgetplanner/getx/currency_getx_controller.dart';
import 'package:badgetplanner/getx/language_getx_controller.dart';
import 'package:badgetplanner/getx/users_getx_controller.dart';
import 'package:badgetplanner/preferences/user_preferences.dart';
import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/helpers.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/container_setting.dart';
import 'package:badgetplanner/widgets/contanier_setting_custom.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> with Helpers {
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
                      title: AppLocalizations.of(context)!.settings,
                      fontfamily: 'mon',
                      fontweight: FontWeight.w700,
                      size: SizeConfig.scaleTextFont(20),
                      color: AppColors.TITLE,
                      align: TextAlign.center),
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back, color: AppColors.BOTTON),
                  ),
                ),
                body: Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.scaleWidth(20),
                      top: SizeConfig.scaleHeight(30),
                      right: SizeConfig.scaleWidth(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCustom(
                          title: AppLocalizations.of(context)!.about_app,
                          fontfamily: 'mon',
                          fontweight: FontWeight.w500,
                          size: SizeConfig.scaleTextFont(15),
                          color: AppColors.TITLE,
                          align: TextAlign.left),
                      SizedBox(
                        height: SizeConfig.scaleHeight(15),
                      ),
                      ContainerSetting(
                        title: AppLocalizations.of(context)!.about_app,
                        trellingicon: Icons.arrow_back_ios,
                        leadingicon: Icons.info,
                        onTap: () {
                          Navigator.pushNamed(context, '/about_screen');
                        },
                      ),
                      SizedBox(
                        height: SizeConfig.scaleHeight(15),
                      ),
                      ContainerSetting(
                        title: AppLocalizations.of(context)!.language,
                        trellingicon: Icons.arrow_back_ios,
                        leadingicon: Icons.language,
                        onTap: () {
                          changeLang();
                        },
                      ),
                      SizedBox(
                        height: SizeConfig.scaleHeight(15),
                      ),
                      contanier_setting(
                        title: AppLocalizations.of(context)!.logout,
                        color: Colors.white,
                        icon: Icons.logout,
                        iconcolor: AppColors.TITLE,
                        titlecolor: AppColors.TITLE,
                        onTap: () async {
                          await logout(context);
                        },
                      ),
                      SizedBox(height: SizeConfig.scaleHeight(25)),
                      TextCustom(
                          title: AppLocalizations.of(context)!.account_data,
                          fontfamily: 'mon',
                          fontweight: FontWeight.w500,
                          size: SizeConfig.scaleTextFont(15),
                          color: AppColors.TITLE,
                          align: TextAlign.left),
                      SizedBox(
                        height: SizeConfig.scaleHeight(15),
                      ),
                      InkWell(
                        onTap: () {
                          clearData(context);
                        },
                        child: Container(
                          height: SizeConfig.scaleHeight(70),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                SizeConfig.scaleHeight(12)),
                            border: Border.all(color: AppColors.RED, width: 2),
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
                            padding: EdgeInsets.only(
                                left: SizeConfig.scaleWidth(13),
                                right: SizeConfig.scaleWidth(13)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.delete,
                                  color: AppColors.RED,
                                ),
                                SizedBox(
                                  width: SizeConfig.scaleWidth(8),
                                ),
                                TextCustom(
                                    title: AppLocalizations.of(context)!
                                        .clear_account,
                                    fontfamily: 'mon',
                                    fontweight: FontWeight.w500,
                                    size: SizeConfig.scaleTextFont(15),
                                    color: AppColors.RED,
                                    align: TextAlign.left),
                                SizedBox(
                                  height: SizeConfig.scaleHeight(10),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.scaleHeight(15),
                      ),
                      contanier_setting(
                        title: AppLocalizations.of(context)!.remove_account,
                        color: AppColors.RED,
                        icon: Icons.person_remove,
                        iconcolor: Colors.white,
                        titlecolor: Colors.white,
                        onTap: () {
                          deleteAccount(context);
                        },
                      ),
                    ],
                  ),
                ))));
  }

  void changeLang() {
    String newLanguageCode =
        SharedPrefController().languageCode == 'en' ? 'ar' : 'en';
    print(newLanguageCode);
    LanguageGetxController.to.changeLanguage(newLanguageCode);
  }

  Future<void> clearData(BuildContext context) async {
    bool cleared = false;
    bool status = await deleteDialog(
      context: context,
      title: AppLocalizations.of(context)!.alet_clear_account_title,
      content: AppLocalizations.of(context)!.alet_clear_account_message,
    );
    if (status) {
      cleared = await UsersGetxController.to.clearAccountData();
    }

    String message =
        cleared ? 'User account data cleared' : 'Failed to clear account data';
    showSnackBar(context, message: message, error: !cleared);
  }

  Future<void> logout(BuildContext context) async {
    bool status = await SharedPrefController().logout();
    if (status) {
      CurrencyGetxController.to.undoCheckedCurrency();
      Navigator.pushReplacementNamed(context, '/login_screen');
    }
  }

  Future<void> deleteAccount(BuildContext context) async {
    bool removed = await UsersGetxController.to.removeUserAccount();
    String message = removed
        ? 'User account removed successfully'
        : 'Failed to remove user account';
    showSnackBar(context, message: message, error: !removed);
    if (removed) Navigator.pushReplacementNamed(context, '/login_screen');
  }
}
