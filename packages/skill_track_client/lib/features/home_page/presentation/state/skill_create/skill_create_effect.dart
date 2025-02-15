import 'package:skill_track_client/core/domain/entity/skill.dart';

sealed class SkillCreateEffect {
  const SkillCreateEffect();
}

final class FinishSkillCreateEffect extends SkillCreateEffect {
  final Skill skill;

  const FinishSkillCreateEffect(this.skill);
}
