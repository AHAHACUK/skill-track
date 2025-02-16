import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_track_client/features/home_page/presentation/dialogs/skill_additional_controls_dialog.dart';
import 'package:skill_track_client/features/home_page/presentation/entity/skill_action.dart';
import 'package:skill_track_client/features/home_page/presentation/state/skill/skill_cubit.dart';
import 'package:skill_track_client/features/home_page/presentation/state/skill_list/skill_list_cubit.dart';
import 'package:skill_track_client/toolkit/utils/context_util.dart';
import 'package:skill_track_client/toolkit/utils/screen_util.dart';

class SkillControls extends StatelessWidget {
  const SkillControls({
    super.key,
  });

  void _menu(BuildContext context) async {
    final skillCubit = BlocProvider.of<SkillCubit>(context);
    final skillState = skillCubit.state;
    assert(skillState is DataSkillState);
    final skill = (skillState as DataSkillState).skill;
    final action = await showDialog<SkillAction>(
      context: context,
      builder: (_) => const SkillAdditionalControlsDialog(),
    );
    if (action == null) return;
    if (!context.mounted) return;
    switch (action) {
      case SkillAction.delete:
        final listCubit = BlocProvider.of<SkillListCubit>(context);
        listCubit.deleteSkill(skill);
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colors = theme.colorScheme;
    final cubit = BlocProvider.of<SkillCubit>(context);
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            cubit.removeExp();
          },
          child: Icon(
            Icons.remove,
            color: colors.onSurface,
          ),
        ),
        const SizedBox(width: 16).r,
        GestureDetector(
          onTap: () {
            cubit.addExp();
          },
          child: Icon(
            Icons.add,
            color: colors.onSurface,
          ),
        ),
        const SizedBox(width: 16).r,
        GestureDetector(
          onTap: () {
            _menu(context);
          },
          child: Icon(
            Icons.menu,
            color: colors.onSurface,
          ),
        ),
      ],
    );
  }
}
