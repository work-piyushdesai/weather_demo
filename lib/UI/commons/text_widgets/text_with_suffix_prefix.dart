import 'package:flutter/material.dart';

class TextWithSuffixPrefix extends StatelessWidget {
  final Widget? prefix;
  final Widget? suffix;
  final Widget? child;
  final double? suffixSpace;
  final double? prefixSpace;

  const TextWithSuffixPrefix({
    Key? key,
    this.prefix,
    this.suffix,
    this.child,
    this.prefixSpace,
    this.suffixSpace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        prefix!,
        SizedBox(
          width: prefixSpace,
        ),
        child!,
        SizedBox(
          width: suffixSpace,
        ),
        suffix!,
      ],
    );
  }
}
