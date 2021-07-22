import 'package:badgetplanner/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class TextFiled extends StatelessWidget {
  String _hint;
  TextEditingController _nameTextEditingController;
  String? _emailError;
  int _minLines;
  int _maxLines;
  TextInputType _textInputType;
  bool _obscureText;

  TextFiled(this._hint, this._nameTextEditingController, this._emailError,
      this._minLines, this._maxLines, this._textInputType,this._obscureText);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
        controller: _nameTextEditingController,
        minLines: _minLines,
        maxLines: _maxLines,
        cursorColor: AppColors.BOTTON,
        keyboardType: _textInputType,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: _hint,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: AppColors.BACKGROUND.withOpacity(0.1),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.BOTTON,
            ),
          ),
          errorText: _emailError,
          errorMaxLines: 1,
          // errorStyle: ,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 1,
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 1,
              color: Colors.red,
            ),
          ),
        ));
  }
}
