import 'package:flutter/material.dart';
import 'package:skill_track_client/app_localization.dart';

extension ContextUtil on BuildContext {
  AppLocalizations get locale => AppLocalizations.of(this)!;
  ThemeData get theme => Theme.of(this);
}
