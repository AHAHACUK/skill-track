import 'package:flutter/material.dart';
import 'package:skill_track_client/utils/screen_util.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const ActionButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final styles = theme.textTheme;
    final colors = theme.colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4).r,
        decoration: BoxDecoration(
          color: colors.onSurface,
        ),
        child: Text(
          text,
          style: styles.bodyMedium,
        ),
      ),
    );
  }
}
