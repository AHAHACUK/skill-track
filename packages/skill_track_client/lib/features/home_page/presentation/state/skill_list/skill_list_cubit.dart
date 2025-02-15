import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_track_client/core/domain/entity/skill.dart';
import 'package:skill_track_client/core/domain/interactor/skill_interactor.dart';
import 'package:skill_track_client/features/home_page/presentation/state/skill_list/skill_list_state.dart';

class SkillListCubit extends Cubit<SkillListState> {
  final SkillInteractor _skillInteractor;

  SkillListCubit({
    required SkillInteractor skillInteractor,
  })  : _skillInteractor = skillInteractor,
        super(const DataSkillListState(skills: []));

  void createSkill(Skill skill) async {
    assert(state is DataSkillListState);
    final skills = (state as DataSkillListState).skills;
    emit(LoadingSkillListState());
    skill = await _skillInteractor.createSkill(skill);
    emit(DataSkillListState(skills: [...skills, skill]));
  }

  void update() async {
    assert(state is DataSkillListState);
    emit(LoadingSkillListState());
    final skills = await _skillInteractor.getCurrentSkills();
    emit(DataSkillListState(skills: skills));
  }
}
