import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_track_client/features/home_page/presentation/state/skill_state.dart';

class SkillCubit extends Cubit<SkillState> {
  SkillCubit() : super(InitialSkillState());
}
