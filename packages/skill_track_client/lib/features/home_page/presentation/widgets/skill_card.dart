import 'package:flutter/material.dart';
import 'package:skill_track_client/core/domain/entity/skill.dart';
import 'package:skill_track_client/features/home_page/presentation/widgets/skill_progress_bar.dart';
import 'package:skill_track_client/toolkit/utils/color_util.dart';
import 'package:skill_track_client/toolkit/utils/context_util.dart';
import 'package:skill_track_client/toolkit/utils/screen_util.dart';

class SkillCard extends StatelessWidget {
  final Skill skill;

  const SkillCard({
    required this.skill,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final styles = theme.textTheme;
    final colors = theme.colorScheme;
    final color = colorFromSeed(skill.name.hashCode);
    return Container(
      height: 64.r,
      padding: const EdgeInsets.all(8).r,
      decoration: BoxDecoration(
        color: colors.surfaceContainer,
        borderRadius: const BorderRadius.all(Radius.circular(8)).r,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              skill.name,
              style: styles.bodyLarge?.r,
            ),
          ),
          const SizedBox(width: 4).r,
          Expanded(
            child: SkillProgressBar(
              progress: 4,
              maxProgress: skill.expPerLevel,
              sections: skill.expPerLevel,
              sectionsSpace: 2.r,
              color: color,
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  color.withBrightness(0.75),
                  color.withBrightness(1.33)
                ],
              ),
              borderRadius: const BorderRadius.all(Radius.circular(32)).r,
            ),
          ),
        ],
      ),
    );
  }
}
