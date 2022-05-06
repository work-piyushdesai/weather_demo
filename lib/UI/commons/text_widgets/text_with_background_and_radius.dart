import 'package:flutter/material.dart';

class TextWithBackgroundAndRadius extends StatelessWidget {
  final double? borderRadius;
  final Color? backGroundColor;
  final Widget? child;
  final double? horizontalPadding;
  final double? verticalPadding;

  const TextWithBackgroundAndRadius({
    Key? key,
    this.borderRadius,
    this.backGroundColor,
    this.child,
    this.horizontalPadding,
    this.verticalPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding!, vertical: verticalPadding!),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
        color: backGroundColor,
      ),
      child: child,
    );
  }
}
