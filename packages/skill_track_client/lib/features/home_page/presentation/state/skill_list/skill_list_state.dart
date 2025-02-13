import 'package:skill_track_client/core/domain/entity/skill.dart';

sealed class SkillListState {
  const SkillListState();
}

final class LoadingSkillListState extends SkillListState {}

final class DataSkillListState extends SkillListState {
  final List<Skill> skills;

  const DataSkillListState({required this.skills});
}
