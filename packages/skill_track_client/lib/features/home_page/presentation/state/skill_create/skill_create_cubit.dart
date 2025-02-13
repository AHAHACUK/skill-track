import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_track_client/features/home_page/presentation/state/skill_create/skill_create_state.dart';

class SkillCreateCubit extends Cubit<SkillCreateState> {
  SkillCreateCubit() : super(const ProcessSkillCreateState());
}
