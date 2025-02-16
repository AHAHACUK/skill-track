import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_track_client/core/domain/entity/skill.dart';
import 'package:skill_track_client/features/home_page/presentation/state/skill_create/skill_create_effect.dart';
import 'package:skill_track_client/features/home_page/presentation/state/skill_create/skill_create_state.dart';

class SkillCreateCubit extends Cubit<SkillCreateState>
    with BlocPresentationMixin<SkillCreateState, SkillCreateEffect> {
  SkillCreateCubit()
      : super(
          const SkillCreateState(
            name: '',
            expPerLevel: null,
          ),
        );

  void changeName(String name) {
    emit(state.copyWith(name: name));
  }

  void changeExpPerLevel(double? value) {
    emit(state.copyWith(expPerLevel: value));
  }

  void finish() {
    final skill = _buildSkill();
    emitPresentation(FinishSkillCreateEffect(skill));
  }

  Skill _buildSkill() {
    return Skill(
      id: null,
      name: state.name,
      expSum: 0,
      expPerLevel: state.expPerLevel!,
      lastUpdate: null,
    );
  }
}
