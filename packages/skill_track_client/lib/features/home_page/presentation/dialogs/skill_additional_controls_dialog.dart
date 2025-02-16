import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_track_client/features/home_page/presentation/entity/skill_action.dart';
import 'package:skill_track_client/features/home_page/presentation/widgets/action_button.dart';
import 'package:skill_track_client/toolkit/utils/context_util.dart';
import 'package:skill_track_client/toolkit/utils/screen_util.dart';
import 'package:skill_track_client/toolkit/utils/text_util.dart';

class SkillAdditionalControlsDialog extends StatelessWidget {
  const SkillAdditionalControlsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colors = theme.colorScheme;
    final locale = context.locale;
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(16).r,
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: const BorderRadius.all(Radius.circular(16)).r,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ActionButton(
              text: locale.delete.capitalized,
              onTap: () {
                context.pop(SkillAction.delete);
              },
            ),
            const SizedBox(height: 16).r,
            ActionButton(
              text: locale.cancel.capitalized,
              onTap: () {
                context.pop(null);
              },
            ),
          ],
        ),
      ),
    );
  }
}
