import 'package:badgetplanner/models/tip_data.dart';
import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/card_tip.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

class TipScreen extends StatefulWidget {
  const TipScreen({Key? key}) : super(key: key);

  @override
  _TipScreenState createState() => _TipScreenState();
}

class _TipScreenState extends State<TipScreen> {
  List<CardTip> data_Tip_Content =dataTipContent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Scaffold(
              backgroundColor: AppColors.TIP_COLOR,
              appBar: AppBar(
                backgroundColor: AppColors.TIP_COLOR,
                elevation: 0,
                title:  TextCustom(
                    title: AppLocalizations.of(context)!.tips,
                    fontfamily: 'mon',
                    fontweight: FontWeight.w700,
                    size: SizeConfig.scaleTextFont(20),
                    color: AppColors.TITLE,
                    align: TextAlign.center),

              ),body: Padding(
              padding:  EdgeInsets.only(left: SizeConfig.scaleWidth(20),right: SizeConfig.scaleWidth(20),top: SizeConfig.scaleHeight(30)),
                child: Column(
                children: [
                  Container(
                    height: SizeConfig.scaleHeight(44),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(12)),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.only(left: SizeConfig.scaleWidth(13),right: SizeConfig.scaleWidth(13)),
                      child: Row(
                        children: [
                          Icon(Icons.search,color: AppColors.TITLE,size: SizeConfig.scaleHeight(24),),
                          SizedBox(width: SizeConfig.scaleWidth(8),),
                      Expanded(child: TextField(onTap : (){},
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                             )
                         ),
                      )
                        ],
                      ),
                    ),
                  ),
              SizedBox(height: SizeConfig.scaleHeight(25),),
              Expanded(
                child: Scrollbar(
                  child: GridView.builder(
                      itemCount: data_Tip_Content.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 7,
                        crossAxisSpacing: 7,
                        childAspectRatio: (SizeConfig.scaleWidth(190)/SizeConfig.scaleHeight(260)),
                      ),

                      itemBuilder: (context, index) {
                        return  CardTip(image: data_Tip_Content[index].image, title: data_Tip_Content[index].title, subtitle: data_Tip_Content[index].subtitle,data: data_Tip_Content[index].data,);
                      }),
                ),
              )
                ],
            ),
              ),)));
  }
}
