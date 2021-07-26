import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:badgetplanner/models/on-boarding_data.dart';
import 'package:badgetplanner/widgets/button.dart';
import 'package:badgetplanner/widgets/on_boarding_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

List<OnBoardingContent> data_boarding_content = dataBoardingContent;

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  late bool _loading;
  late double _progressValue;

  @override
  void initState() {
// TODO: implement initState
    super.initState();
    _loading = false;
    _progressValue = 0.0;
    _pageController = PageController();
  }

  @override
  void dispose() {
// TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
            left: SizeConfig.scaleWidth(16),
            top: SizeConfig.scaleHeight(62),
            bottom: SizeConfig.scaleHeight(30),
            right: SizeConfig.scaleWidth(16)),
        child: Column(
          children: [
            Container(
              width: SizeConfig.scaleWidth(199),
              clipBehavior: Clip.antiAlias,
              height: SizeConfig.scaleHeight(9),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5)
              ),
              child: LinearProgressIndicator(
                backgroundColor: AppColors.BACKGROUND.withOpacity(0.1),
                color: AppColors.BOTTON,
                value: (_currentPage+1)/3,
              ),
            ),
            SizedBox(
              height: SizeConfig.scaleHeight(45),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int selectedPage) {
                  setState(() {
                    _currentPage = selectedPage;
                  });
                },
                children: [
                  OnBoardingContent(
                    title: data_boarding_content[0].title,
                    sub_title: data_boarding_content[0].sub_title,
                    image: data_boarding_content[0].image,
                  ),
                  OnBoardingContent(
                    title: data_boarding_content[1].title,
                    sub_title: data_boarding_content[1].sub_title,
                    image: data_boarding_content[1].image,
                  ),
                  OnBoardingContent(
                    title: data_boarding_content[2].title,
                    sub_title: data_boarding_content[2].sub_title,
                    image: data_boarding_content[2].image,
                  ),
                ],
              ),
            ),

            Visibility(
              visible: _currentPage != 2,
              replacement: button(
                text: AppLocalizations.of(context)!.start,
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/login_screen'), color: AppColors.BOTTON,
              ),
              child: button(
                text: AppLocalizations.of(context)!.next,
                onPressed: () => _pageController.nextPage(
                    duration: (Duration(seconds: 2)),
                    curve: Curves.easeOutBack),
                  color: AppColors.BOTTON
              ),
            ),
            TextButton(
                onPressed: () => _pageController.jumpToPage(2),
                child: TextCustom(
                    title: AppLocalizations.of(context)!.skip,
                    fontfamily: 'mon',
                    fontweight: FontWeight.w400,
                    size: SizeConfig.scaleTextFont(15),
                    color: AppColors.SUB_TITLE,
                    align: TextAlign.center)),
          ],
        ),
      ),
    );
  }

 
}
