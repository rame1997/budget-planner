import 'package:badgetplanner/screens/tab_navigation/tip/categories_actions_details.dart';
import 'package:badgetplanner/screens/tab_navigation/tip/home_screen.dart';
import 'package:badgetplanner/screens/tab_navigation/tip/profile.dart';
import 'package:badgetplanner/screens/tab_navigation/tip/tip/tip_screen.dart';
import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../operation/add_operation.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarScreenState createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Categories(),
    AddOperation(),
    Profile(),
    TipScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: AppLocalizations.of(context)!.categories,
          ),
          BottomNavigationBarItem(
            icon: FloatingActionButton(
              backgroundColor: AppColors.BOTTON,
              elevation: 0,
              onPressed: () {
                Navigator.pushNamed(context, '/add_operation_screen');
              },
              child: Icon(
                Icons.add,
                size: SizeConfig.scaleHeight(40),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: AppLocalizations.of(context)!.profile,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.privacy_tip_outlined),
            label: AppLocalizations.of(context)!.tips,
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: AppColors.NAVICATION_BAR_COLOR,
        onTap: _onItemTapped,
        iconSize: SizeConfig.scaleHeight(22),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.TITLE,
        unselectedItemColor: AppColors.SUB_TITLE,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        unselectedFontSize: SizeConfig.scaleTextFont(10),
        selectedFontSize: SizeConfig.scaleTextFont(10),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
