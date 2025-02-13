import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_track_client/features/home_page/presentation/state/skill_list/skill_list_state.dart';

class SkillListCubit extends Cubit<SkillListState> {
  SkillListCubit() : super(LoadingSkillListState());
}
