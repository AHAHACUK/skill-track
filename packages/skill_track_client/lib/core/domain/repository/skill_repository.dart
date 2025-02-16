import 'package:skill_track_client/core/domain/entity/skill.dart';
import 'package:skill_track_client/core/domain/entity/skill_gain.dart';

abstract class SkillRepository {
  Future<Skill> createSkill(Skill skill);

  Future<Skill> addSkillExp(Skill skill, double amount);

  Future<Skill> removeSkillExp(Skill skill, double amount);

  Future<List<Skill>> getCurrentSkills();

  Future<List<SkillGain>> getSkillHistory(int skillId);
}
