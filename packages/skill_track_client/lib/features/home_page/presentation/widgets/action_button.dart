import 'package:flutter/material.dart';
import 'package:skill_track_client/toolkit/utils/screen_util.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final TextStyle? style;
  final bool isActive;

  const ActionButton({
    super.key,
    required this.text,
    required this.onTap,
    this.style,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final styles = theme.textTheme;
    final colors = theme.colorScheme;
    return GestureDetector(
      onTap: isActive ? onTap : null,
      child: Container(
        padding: const EdgeInsets.all(4).r,
        decoration: BoxDecoration(
          color: isActive ? colors.surfaceContainer : colors.surfaceDim,
          borderRadius: const BorderRadius.all(Radius.circular(8)).r,
        ),
        child: Text(
          text,
          style: style ?? styles.bodyMedium,
        ),
      ),
    );
  }
}
