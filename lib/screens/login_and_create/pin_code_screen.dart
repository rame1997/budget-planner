import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:badgetplanner/utilities/helpers.dart';
import 'package:badgetplanner/utilities/size_config.dart';
import 'package:badgetplanner/widgets/button.dart';
import 'package:badgetplanner/widgets/item_grid.dart';
import 'package:badgetplanner/widgets/text.dart';
import 'package:badgetplanner/widgets/textfiled_pin_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({Key? key}) : super(key: key);

  @override
  _PinCodeScreenState createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> with Helpers{
  String? number1 = null;
  String? number2 = null;
  String? number3 = null;
  String? number4 = null;
  late String? pinCode;

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
                    Navigator.pop(context,pinCode);
                  },
                  icon: Icon(Icons.arrow_back, color: AppColors.BOTTON),
                ),
              ),
              body: Padding(
                padding: EdgeInsets.only(
                    right: SizeConfig.scaleWidth(20),
                    left: SizeConfig.scaleWidth(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextCustom(
                        title: AppLocalizations.of(context)!.enter_passcode,
                        fontfamily: 'mon',
                        fontweight: FontWeight.w700,
                        size: SizeConfig.scaleTextFont(20),
                        color: AppColors.TITLE,
                        align: TextAlign.center),
                    SizedBox(
                      height: SizeConfig.scaleHeight(6),
                    ),
                    TextCustom(
                        title: AppLocalizations.of(context)!.new_pin,
                        fontfamily: 'mon',
                        fontweight: FontWeight.w400,
                        size: SizeConfig.scaleTextFont(15),
                        color: AppColors.SUB_TITLE,
                        align: TextAlign.center),
                    SizedBox(
                      height: SizeConfig.scaleHeight(20),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: SizeConfig.scaleWidth(55),
                          left: SizeConfig.scaleWidth(55)),
                      child: Row(
                        children: [

                          TextFiledPinCode(
                            number: number1 ?? '',
                            isFill: number1 == null ? false : true,
                          ),
                          SizedBox(width: SizeConfig.scaleWidth(10)),
                          TextFiledPinCode(
                            number: number2 ?? '',
                            isFill: number2 == null ? false : true,
                          ),
                          SizedBox(width: SizeConfig.scaleWidth(10)),
                          TextFiledPinCode(
                            number: number3 ?? '',
                            isFill: number3 == null ? false : true,
                          ),
                          SizedBox(width: SizeConfig.scaleWidth(10)),
                          TextFiledPinCode(
                            number: number4 ?? '',
                            isFill: number4 == null ? false : true,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.scaleHeight(70),
                    ),
                    GridView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.only(
                          right: SizeConfig.scaleWidth(30),
                          left: SizeConfig.scaleWidth(30),
                          bottom: SizeConfig.scaleHeight(20)),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: SizeConfig.scaleHeight(32),
                        crossAxisSpacing: SizeConfig.scaleWidth(32),
                        // childAspectRatio:
                        // (SizeConfig.scaleWidth(100) / SizeConfig.scaleHeight(100)),
                      ),
                      children: [
                        ItemGrid(
                            number: '1',
                            onTap: () {
                              setState(() {
                                giveNumber('1');
                              });
                            }),
                        ItemGrid(
                          number: '2',
                          onTap: () {
                            setState(() {
                              giveNumber('2');
                            });
                          },
                        ),
                        ItemGrid(
                          number: '3',
                          onTap: () {
                            setState(() {
                              giveNumber('3');
                            });
                          },
                        ),
                        ItemGrid(
                          number: '4',
                          onTap: () {
                            setState(() {
                              giveNumber('4');
                            });
                          },
                        ),
                        ItemGrid(
                          number: '5',
                          onTap: () {
                            setState(() {
                              giveNumber('5');
                            });
                          },
                        ),
                        ItemGrid(
                          number: '6',
                          onTap: () {
                            setState(() {
                              giveNumber('6');
                            });
                          },
                        ),
                        ItemGrid(
                          number: '7',
                          onTap: () {
                            setState(() {
                              giveNumber('7');
                            });
                          },
                        ),
                        ItemGrid(
                          number: '8',
                          onTap: () {
                            setState(() {
                              giveNumber('8');
                            });
                          },
                        ),
                        ItemGrid(
                          number: '9',
                          onTap: () {
                            setState(() {
                              giveNumber('9');
                            });
                          },
                        ),

                        ItemGrid(
                          number: 'D',
                          onTap: () {
                            setState(() {
                              removeNumer();
                            });
                          },
                        ),
                        ItemGrid(
                          number: '0',
                          onTap: () {
                            setState(() {
                              giveNumber('0');
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.scaleHeight(50),
                    ),
                    button(
                        text:AppLocalizations.of(context)!.apply,
                        onPressed: () {
                          if (getNumber(context)) {
                            Navigator.pop(context, pinCode);
                          }
                        },
                        color: AppColors.BOTTON),
                  ],
                ),
              ),
            )));
  }

  void giveNumber(String number) {
    if (number1 == null) {
      number1 = number;
    } else if (number2 == null) {
      number2 = number;
    } else if (number3 == null) {
      number3 = number;
    } else if (number4 == null) {
      number4 = number;
    }
  }

  removeNumer() {
    if (number4 != null) {
      number4 = null;
      print(number4);
    } else if (number3 != null) {
      number3 = null;
    } else if (number2 != null) {
      number2 = null;
    } else if (number1 != null) {
      number1 = null;
    }
  }

  bool getNumber(BuildContext context) {
    if (number1 != null &&
        number2 != null &&
        number3 != null &&
        number4 != null) {
       pinCode = number1! + number2! + number3! + number4!;
      return true;
    } else {
      showSnackBar(context, message: AppLocalizations.of(context)!.empty_field_error, error: true);
      return false;
    }
  }
}