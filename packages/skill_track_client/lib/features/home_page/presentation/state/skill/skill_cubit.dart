import 'package:flutter_bloc/flutter_bloc.dart';

part 'skill_state.dart';

class SkillCubit extends Cubit<SkillState> {
  SkillCubit() : super(DataSkillState());
}
