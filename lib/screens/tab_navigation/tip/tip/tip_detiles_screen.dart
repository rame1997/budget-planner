import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Detiles extends StatefulWidget {
  String mainImage;
  String title;
  String date;

  Detiles({required this.mainImage, required this.title, required this.date});

  @override
  _DetilesState createState() => _DetilesState();
}

class _DetilesState extends State<Detiles> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon:
                      Icon(Icons.arrow_back, color: AppColors.BOTTON),
                ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon:
                  Icon(Icons.logout, color: AppColors.BOTTON),
                ),
              ],
              ),
              body: Scrollbar(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.scaleWidth(16),
                        vertical: SizeConfig.scaleHeight(16)),
                    child: Column(
                      children: [
                        Container(
                          child: SvgPicture.asset(
                            widget.mainImage,
                          ),
                          width: double.infinity,
                          height: SizeConfig.scaleHeight(220),
                        ),
                        SizedBox(
                          height: SizeConfig.scaleHeight(11),
                        ),
                        TextCustom(
                            title:widget.title,
                            fontfamily: 'mon',
                            fontweight: FontWeight.w700,
                            size: SizeConfig.scaleTextFont(20),
                            color: AppColors.TITLE,
                            align: TextAlign.center),
                        TextCustom(
                            title: widget.date,
                            fontfamily: 'mon',
                            fontweight: FontWeight.w400,
                            size: SizeConfig.scaleTextFont(15),
                            color: AppColors.TITLE,
                            align: TextAlign.start),
                    ]
                ),
              ),
            )))));
  }
}
