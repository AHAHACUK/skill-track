import 'package:skill_track_client/core/domain/entity/skill.dart';
import 'package:skill_track_db/skill_track_db.dart';

extension SkillParser on SkillSummaryModel {
  Skill toSkill() {
    return Skill(
      id: skillId,
      name: name,
      exp: expSum,
      expPerLevel: expPerLevel,
      lastUpdate: lastUpdateDateTime,
    );
  }
}
