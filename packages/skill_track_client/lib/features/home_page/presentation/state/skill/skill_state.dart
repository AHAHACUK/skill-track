part of 'skill_cubit.dart';

sealed class SkillState {
  const SkillState();
}

final class DataSkillState extends SkillState {
  final Skill skill;

  const DataSkillState({required this.skill});
}

final class LoadingSkillState extends SkillState {}
