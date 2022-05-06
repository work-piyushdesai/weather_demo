import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_demo/UI/commons/text_widgets/base/headline_body_one_base_widget.dart';
import 'package:weather_demo/infrastructure/commons/constants/font_constant.dart';

import '../../infrastructure/commons/constants/color_constants.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  TextFieldWidget(
      {Key? key,
      required this.controller,
      required this.focusNode,
      this.onChanged,
      this.textInputAction,
      this.suffix,
      this.obscureText,
      this.keyboardType,
      this.hintText,
      this.onTap,
      this.title,
      this.isHeading = false,
      this.validator,
      this.inputFormatters})
      : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final Widget? suffix;
  bool? obscureText = false;
  final TextInputType? keyboardType;
  final String? hintText;
  final GestureTapCallback? onTap;
  final bool? isHeading;
  final String? title;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isHeading!
            ? HeadlineBodyOneBaseWidget(
                title: title,
                titleColor: ColorConstants.black,
                fontFamily: FontConstant.overPassMedium,
                fontSize: 16,
              )
            : Container(),
        isHeading!
            ? const SizedBox(
                height: 6,
              )
            : Container(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller,
                  focusNode: focusNode,
                  style: TextStyle(
                    color: ColorConstants.black.withOpacity(0.8),
                    fontFamily: FontConstant.overPassRegular,
                  ),
                  textAlign: TextAlign.start,
                  onChanged: onChanged,
                  textInputAction: textInputAction,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorConstants.white,
                    hintText: hintText,
                    hintStyle: const TextStyle(
                      fontSize: 16.0,
                      fontFamily: FontConstant.overPassRegular,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: ColorConstants.textFieldBorderColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: ColorConstants.textFieldBorderColor,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: ColorConstants.redReportColor,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: ColorConstants.redReportColor,
                      ),
                    ),
                    suffixIcon: suffix != null
                        ? Container(
                            padding: const EdgeInsets.all(16), child: suffix!)
                        : null,
                  ),
                  inputFormatters: inputFormatters,
                  validator: validator,
                  onTap: onTap,
                  keyboardType: keyboardType,
                  obscureText: obscureText ?? false,
                  obscuringCharacter: "⬤",
                ),
              ),
              // suffix != null ? Container(margin: const EdgeInsets.only(left: 16) ,child: suffix!,) : Container(),
            ],
          ),
        ),
      ],
    );
  }
}
