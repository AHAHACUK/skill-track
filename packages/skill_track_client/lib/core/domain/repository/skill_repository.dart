import 'package:skill_track_client/core/domain/entity/skill.dart';
import 'package:skill_track_client/core/domain/entity/skill_gain.dart';

abstract class SkillRepository {
  Future<List<Skill>> getCurrentSkills();

  Future<List<SkillGain>> getSkillsHistory(int skillId);
}
