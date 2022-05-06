import 'package:flutter/material.dart';

enum SmartTextType { T, B, I, hyperlink, bullet }

extension SmartTextStyle on SmartTextType {
  TextStyle get textStyle {
    switch (this) {
      case SmartTextType.T:
        return const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black);
      case SmartTextType.B:
        return const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black);

      case SmartTextType.I:
        return const TextStyle(
            fontSize: 16, fontStyle: FontStyle.italic, color: Colors.black);

      case SmartTextType.hyperlink:
        return const TextStyle(
            fontSize: 16, fontStyle: FontStyle.italic, color: Colors.blue);

      default:
        return const TextStyle(fontSize: 16, color: Colors.black);
    }
  }

  EdgeInsets get padding {
    switch (this) {
      case SmartTextType.bullet:
        return const EdgeInsets.fromLTRB(24, 8, 16, 8);
      default:
        return const EdgeInsets.fromLTRB(16, 8, 16, 8);
    }
  }

  String get prefix {
    switch (this) {
      case SmartTextType.bullet:
        return '\u2022 ';
      default:
        return '';
    }
  }
}

class SmartTextField extends StatelessWidget {
  const SmartTextField(
      {Key? key,
      required this.type,
      required this.controller,
      required this.focusNode})
      : super(key: key);

  final SmartTextType type;
  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        focusNode: focusNode,
        autofocus: true,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        // cursorColor: ColorConstants.defaultBlue,
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixText: type.prefix,
            prefixStyle: type.textStyle,
            isDense: true,
            contentPadding: type.padding),
        style: type.textStyle);
  }
}
