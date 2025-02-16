import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_track_client/core/domain/entity/skill.dart';
import 'package:skill_track_client/core/domain/interactor/skill_interactor.dart';

part 'skill_state.dart';

class SkillCubit extends Cubit<SkillState> {
  final SkillInteractor _skillInteractor;

  SkillCubit({
    required SkillInteractor skillInteractor,
  })  : _skillInteractor = skillInteractor,
        super(LoadingSkillState());

  void set(Skill skill) {
    emit(DataSkillState(skill: skill));
  }

  void addExp() {
    assert(state is DataSkillState);
    const amount = 1.0;
    final skill = (state as DataSkillState).skill;
    unawaited(_skillInteractor.addExp(skill, amount));
    emit(DataSkillState(skill: skill.copyWith(exp: skill.expSum + amount)));
  }

  void removeExp() {
    assert(state is DataSkillState);
    const amount = 1.0;
    final skill = (state as DataSkillState).skill;
    unawaited(_skillInteractor.removeExp(skill, amount));
    emit(DataSkillState(skill: skill.copyWith(exp: skill.expSum - amount)));
  }
}
