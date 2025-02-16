import 'package:skill_track_client/core/data/parser/skill_gain_parser.dart';
import 'package:skill_track_client/core/data/parser/skill_parser.dart';
import 'package:skill_track_client/core/domain/entity/skill.dart';
import 'package:skill_track_client/core/domain/entity/skill_gain.dart';
import 'package:skill_track_client/core/domain/repository/skill_repository.dart';
import 'package:skill_track_db/skill_track_db.dart';

class DbSkillRepository implements SkillRepository {
  final SkillTrackDatabase database;

  DbSkillRepository({required this.database});

  @override
  Future<List<Skill>> getCurrentSkills() async {
    final models = await database.skill.getSkillsSummary();
    return models.map((e) => e.toSkill()).toList();
  }

  @override
  Future<List<SkillGain>> getSkillHistory(int skillId) async {
    final models = await database.skill.getExpHistory();
    return models.map((e) => e.toSkillGain()).toList();
  }

  @override
  Future<Skill> createSkill(Skill skill) async {
    final id = await database.skill.createSkill(
      SkillModel(
        name: skill.name,
        expPerLevel: skill.expPerLevel,
      ),
    );
    return skill.copyWith(id: id);
  }

  @override
  Future<Skill> addSkillExp(Skill skill, double amount) async {
    await database.skill.createSkillExp(
      SkillExpModel(
        id: null,
        skillId: skill.id!,
        dateTime: DateTime.now(),
        amount: amount,
      ),
    );
    return skill.copyWith(expSum: skill.expSum + amount);
  }

  @override
  Future<Skill> removeSkillExp(Skill skill, double amount) async {
    await database.skill.createSkillExp(
      SkillExpModel(
        id: null,
        skillId: skill.id!,
        dateTime: DateTime.now(),
        amount: -amount,
      ),
    );
    return skill.copyWith(expSum: skill.expSum - amount);
  }

  @override
  Future<void> deleteSkill(Skill skill) async {
    await database.skill.deleteSkill(skill.id!);
  }
}
