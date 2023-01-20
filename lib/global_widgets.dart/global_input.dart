import 'package:flutter/material.dart';
import 'package:social_media/styles/styles/custom_text_style.dart';

import '../../styles/colors/app_colors.dart';
import '../styles/styles/global_border_style.dart';

class GlobalInput extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final bool isPassword;
  final String? Function(String?)? validator;
  final bool isCorrect;
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final FocusNode textFocus;

  const GlobalInput({
    Key? key,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.isPassword,
    this.validator,
    required this.isCorrect,
    required this.onChanged,
    required this.controller,
    required this.textFocus,
  }) : super(key: key);

  @override
  State<GlobalInput> createState() => _GlobalInputState();
}

class _GlobalInputState extends State<GlobalInput> {
  final formKey = GlobalKey<FormState>();

  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      focusNode: widget.textFocus,
      controller: widget.controller,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      textInputAction: TextInputAction.done,
      onChanged: widget.onChanged,
      validator: widget.validator,
      style: CustomTextStyle.tinyStyleItalic,
      obscureText: widget.isPassword ? isVisible : false,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: isVisible
                    ? Icon(Icons.visibility, color: AppColor.primaryColor)
                    : Icon(Icons.visibility_off, color: AppColor.primaryColor),
              )
            : widget.suffixIcon,
        labelText: widget.labelText,
        hintText: widget.hintText,
        border: GlobalBorderStyle.borderStyle,
        focusedBorder:
            GlobalBorderStyle.focusBorderStyle(isCorrect: widget.isCorrect),
        enabledBorder: GlobalBorderStyle.enabledBorderStyle,
        errorBorder: GlobalBorderStyle.errorBorderStyle,
      ),
    );
  }
}
