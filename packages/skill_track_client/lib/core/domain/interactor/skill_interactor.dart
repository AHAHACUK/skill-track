import 'package:skill_track_client/core/domain/entity/skill.dart';
import 'package:skill_track_client/core/domain/entity/skill_gain.dart';
import 'package:skill_track_client/core/domain/repository/skill_repository.dart';

class SkillInteractor {
  final SkillRepository _repository;

  SkillInteractor({
    required SkillRepository repository,
  }) : _repository = repository;

  Future<List<Skill>> getCurrentSkills() {
    return _repository.getCurrentSkills();
  }

  Future<List<SkillGain>> getSkillsHistory(int skillId) {
    return _repository.getSkillsHistory(skillId);
  }
}
