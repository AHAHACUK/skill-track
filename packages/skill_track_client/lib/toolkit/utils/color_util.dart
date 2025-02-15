import 'dart:math';

import 'package:flutter/material.dart';

extension ColorUtil on Color {
  Color withBrightness(double fraction) {
    return Color.fromRGBO(
      min(255, (red * fraction).floor()),
      min(255, (green * fraction).floor()),
      min(255, (blue * fraction).floor()),
      opacity,
    );
  }
}

Color colorFromSeed(int seed) {
  final hue = (seed % 360).toDouble();
  final color = HSLColor.fromAHSL(1, hue, 1, 0.5).toColor();
  return color;
}
