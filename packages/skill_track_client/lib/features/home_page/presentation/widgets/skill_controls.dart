import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_track_client/features/home_page/presentation/state/skill/skill_cubit.dart';
import 'package:skill_track_client/toolkit/utils/context_util.dart';
import 'package:skill_track_client/toolkit/utils/screen_util.dart';

class SkillControls extends StatelessWidget {
  const SkillControls({super.key});

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
      ],
    );
  }
}
