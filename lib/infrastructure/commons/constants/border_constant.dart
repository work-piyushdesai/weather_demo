import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BorderConstant {
  //Simple Card BorderConstant
  static const BorderRadiusGeometry allCornerBorderConstant =
      BorderRadius.all(Radius.circular(24.0));
  static const BorderRadiusGeometry noneBorderConstant =
      BorderRadius.all(Radius.zero);
  static const BorderRadiusGeometry oneThreeBorderConstant = BorderRadius.only(
    topLeft: Radius.circular(
      24.0,
    ),
    topRight: Radius.circular(
      0.0,
    ),
    bottomRight: Radius.circular(
      24.0,
    ),
    bottomLeft: Radius.circular(
      0.0,
    ),
  );
  static const BorderRadiusGeometry twoFourBorderConstant = BorderRadius.only(
    topLeft: Radius.circular(
      0.0,
    ),
    topRight: Radius.circular(
      24.0,
    ),
    bottomRight: Radius.circular(
      0.0,
    ),
    bottomLeft: Radius.circular(
      24.0,
    ),
  );
  static const BorderRadiusGeometry oneTwoFourBorderConstant =
      BorderRadius.only(
    topLeft: Radius.circular(
      24.0,
    ),
    topRight: Radius.circular(
      24.0,
    ),
    bottomRight: Radius.circular(
      0.0,
    ),
    bottomLeft: Radius.circular(
      24.0,
    ),
  );
  static const BorderRadiusGeometry oneTwoThreeBorderConstant =
      BorderRadius.only(
    topLeft: Radius.circular(
      24.0,
    ),
    topRight: Radius.circular(
      24.0,
    ),
    bottomRight: Radius.circular(
      24.0,
    ),
    bottomLeft: Radius.circular(
      0.0,
    ),
  );

  //TwoFolder Card BorderConstant
  static const BorderRadiusGeometry twoFolderAllCornerBorderConstant =
      BorderRadius.all(Radius.circular(16.0));
}
