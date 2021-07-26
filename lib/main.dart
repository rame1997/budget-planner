import 'package:badgetplanner/Database/db_provider.dart';
import 'package:badgetplanner/preferences/user_preferences.dart';
import 'package:badgetplanner/screens/about_screen.dart';
import 'package:badgetplanner/screens/action/actions_screen.dart';
import 'package:badgetplanner/screens/add_categories.dart';
import 'package:badgetplanner/screens/operation/add_operation.dart';
import 'package:badgetplanner/screens/bottomna_vigation_bar/bottom_navigation_bar_screen.dart';
import 'package:badgetplanner/screens/login_and_create/create_account_screen.dart';
import 'package:badgetplanner/screens/login_and_create/create_account_success_screen.dart';
import 'package:badgetplanner/screens/currency_screen.dart';
import 'package:badgetplanner/screens/operation/new_operation_category.dart';
import 'package:badgetplanner/screens/operation/new_operation_success.dart';
import 'package:badgetplanner/screens/tab_navigation/tip/home_screen.dart';
import 'package:badgetplanner/screens/launch_screen.dart';
import 'package:badgetplanner/screens/login_and_create/login_screen.dart';
import 'package:badgetplanner/screens/on_boarding/on_boarding_screen.dart';
import 'package:badgetplanner/screens/login_and_create/pin_code_screen.dart';
import 'package:badgetplanner/screens/setting.dart';
import 'package:badgetplanner/screens/tab_navigation/tip/categories_actions_details.dart';
import 'package:badgetplanner/screens/tab_navigation/tip/tip/tip_screen.dart';
import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import 'getx/actions_getx_controller.dart';
import 'getx/category_getx_controller.dart';

import 'getx/currency_getx_controller.dart';
import 'getx/language_getx_controller.dart';
import 'getx/users_getx_controller.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBProvider().initDatabase();
  await SharedPrefController().initSharePre();
  runApp(MyApp());
}
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CategoryGetxController category_getx_controller = Get.put(CategoryGetxController());
  CurrencyGetxController currency_getx_controller = Get.put(CurrencyGetxController());
  ActionGetxController actions_getx_controller = Get.put(ActionGetxController());
  UsersGetxController user_getx_controller = Get.put(UsersGetxController());
  LanguageGetxController language_getx_controller =
  Get.put(LanguageGetxController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:
        ThemeData(
            appBarTheme: AppBarTheme(centerTitle: true, elevation: 0,
              color: Colors.transparent,
              iconTheme: IconThemeData(
                color: AppColors.BOTTON,
                size: 30,
              ),),
        ),
        initialRoute: '/launch_screen',
        routes: {
          '/launch_screen': (context) => LaunchScreen(),
          '/home_screen': (context) => HomeScreen(),
          '/about_screen': (context) => AboutScreen(),
          '/create_account_success_screen': (context) => CreateAccountSuccessScreen(),
          '/on_boarding_screen': (context) => OnBoardingScreen(),
          '/login_screen': (context) => LoginScreen(),
          '/create_account_screen': (context) => CreateAccountScreen(),
          '/pin_code_screen': (context) => PinCodeScreen(),
          '/currency_screen': (context) => CurrencyScreen(),
          '/setting_screen': (context) => SettingScreen(),
          '/tip_screen': (context) => TipScreen(),
          '/bottom_bavigation_bar_screen': (context) => BottomNavigationBarScreen(),
          '/categories_screen': (context) => Categories(),
          '/add_categories_screen': (context) => AddCategories(),
          '/actions_screen': (context) => ActionsScreen(),
          '/add_operation_screen': (context) => AddOperation(),
          '/new_operation_success': (context) => NewOperationSuccess(),
          '/new_operation_category': (context) => NewOperationCategory(),
        },
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,

        ],
        supportedLocales: [
          const Locale('en', ''),
          const Locale('ar', '')
        ],
        locale:Locale(language_getx_controller.languageCode.value),
      );
  });
  }
}