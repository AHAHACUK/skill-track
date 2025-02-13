import 'package:flutter/material.dart';
import 'package:skill_track_client/app.dart';
import 'package:skill_track_client/dependency/dependency.dart';
import 'package:skill_track_client/window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependency();
  await initWindow();
  runApp(const App());
}
