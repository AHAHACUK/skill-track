import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

extension TextStyleScreenUtil on TextStyle {
  TextStyle get r => copyWith(
        fontSize: fontSize != null ? ScreenUtil().radius(fontSize!) : null,
      );
}

extension NumScreenUtil on num {
  double get r => ScreenUtil().radius(this);
}

extension SizedBoxScreenUtil on SizedBox {
  SizedBox get r => SizedBox(
        width: width != null ? ScreenUtil().radius(width!) : null,
        height: height != null ? ScreenUtil().radius(height!) : null,
      );
}

extension EdgeInsectsScreenUtil on EdgeInsets {
  EdgeInsets get r => EdgeInsets.fromLTRB(
        ScreenUtil().radius(left),
        ScreenUtil().radius(top),
        ScreenUtil().radius(right),
        ScreenUtil().radius(bottom),
      );
}

extension BorderRadiusScreenUtil on BorderRadius {
  BorderRadius get r => BorderRadius.only(
        topLeft: topLeft.r,
        topRight: topRight.r,
        bottomLeft: bottomLeft.r,
        bottomRight: bottomRight.r,
      );
}
