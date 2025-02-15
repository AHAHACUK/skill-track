import 'package:skill_track_client/core/domain/entity/skill_gain.dart';
import 'package:skill_track_db/skill_track_db.dart';

extension SkillGainParser on SkillExpHistoryEntryModel {
  SkillGain toSkillGain() {
    return SkillGain(
      id: skillExpId,
      dateTime: dateTime,
      skillName: skillName,
      amount: amount,
    );
  }
}
