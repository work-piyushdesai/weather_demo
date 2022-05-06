import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_demo/infrastructure/commons/constants/color_constants.dart';

class DigitalCodeBox extends StatelessWidget {
  const DigitalCodeBox(
      {Key? key,
      required this.controller,
      this.focusNode,
      this.textInputAction})
      : super(key: key);

  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: ColorConstants.textFieldBorderColor),
        ),
        color: ColorConstants.white,
        shadows: [
          BoxShadow(
            offset: const Offset(0, 0),
            blurRadius: 5,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: TextFormField(
        textAlign: TextAlign.center,
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,

        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(01)
        ],
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        textInputAction: textInputAction,
        // maxLength: 1,
      ),
    );
  }
}
