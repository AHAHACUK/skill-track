import 'package:flutter/material.dart';
import 'package:skill_track_client/core/domain/entity/skill.dart';
import 'package:skill_track_client/toolkit/utils/screen_util.dart';

class SkillCard extends StatelessWidget {
  final Skill skill;

  const SkillCard({
    required this.skill,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).textTheme;
    return Row(
      children: [
        Text(
          skill.name,
          style: styles.bodyMedium?.r,
        ),
        const SizedBox(width: 4).r,
        Text(
          skill.exp.toString(),
          style: styles.bodyMedium?.r,
        ),
      ],
    );
  }
}
