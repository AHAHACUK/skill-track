import 'package:skill_track_client/core/domain/entity/skill.dart';
import 'package:skill_track_client/core/domain/entity/skill_gain.dart';
import 'package:skill_track_client/core/domain/repository/skill_repository.dart';
import 'package:skill_track_db/skill_track_db.dart';

class DbSkillRepository implements SkillRepository {
  final SkillTrackDatabase database;

  DbSkillRepository({required this.database});

  @override
  Future<List<Skill>> getCurrentSkills() {
    // TODO: implement getCurrentSkills
    throw UnimplementedError();
  }

  @override
  Future<List<SkillGain>> getSkillsHistory(int skillId) {
    // TODO: implement getSkillsHistory
    throw UnimplementedError();
  }
}
