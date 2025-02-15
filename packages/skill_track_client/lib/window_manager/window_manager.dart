import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

const defaultWindowSize = Size(640, 640);

Future<void> initWindow() async {
  await WindowManager.instance.ensureInitialized();
  await WindowManager.instance.setSize(defaultWindowSize);
}
