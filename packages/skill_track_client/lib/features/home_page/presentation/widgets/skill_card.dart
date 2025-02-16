import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_track_client/core/domain/entity/skill.dart';
import 'package:skill_track_client/core/presentation/widgets/loading_veil_wrapper.dart';
import 'package:skill_track_client/dependency/dependency.dart';
import 'package:skill_track_client/features/home_page/presentation/state/skill/skill_cubit.dart';
import 'package:skill_track_client/features/home_page/presentation/widgets/skill_controls.dart';
import 'package:skill_track_client/features/home_page/presentation/widgets/skill_progress_bar.dart';
import 'package:skill_track_client/toolkit/transform/bloc_listenable_transformer.dart';
import 'package:skill_track_client/toolkit/transform/value_listenable_map.dart';
import 'package:skill_track_client/toolkit/utils/color_util.dart';
import 'package:skill_track_client/toolkit/utils/context_util.dart';
import 'package:skill_track_client/toolkit/utils/screen_util.dart';

class SkillCard extends StatefulWidget {
  final Skill skill;

  const SkillCard({
    required this.skill,
    super.key,
  });

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  final cubit = blocFactories.skill.generate();

  @override
  void initState() {
    super.initState();
    cubit.set(widget.skill);
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant SkillCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.skill != widget.skill) {
      cubit.set(widget.skill);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final styles = theme.textTheme;
    final colors = theme.colorScheme;
    final color = colorFromSeed(widget.skill.name.hashCode);
    return LoadingVeilWrapper(
      delay: const Duration(milliseconds: 100),
      controller: cubit.toValueListenable().map((e) => e is! DataSkillState),
      child: BlocProvider.value(
        value: cubit,
        child: BlocBuilder<SkillCubit, SkillState>(
          buildWhen: (_, state) => state is DataSkillState,
          builder: (context, state) {
            final actualSkill =
                state is DataSkillState ? state.skill : widget.skill;
            final expOnLevel = actualSkill.expOnLevel;
            final level = actualSkill.level;

            return Container(
              height: 64.r,
              padding: const EdgeInsets.all(8).r,
              decoration: BoxDecoration(
                color: colors.surfaceContainer,
                borderRadius: const BorderRadius.all(Radius.circular(8)).r,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      actualSkill.name,
                      style: styles.bodyLarge?.r,
                    ),
                  ),
                  const SizedBox(width: 16).r,
                  Center(
                    child: Text(
                      level.toStringAsFixed(0),
                      style: styles.bodyLarge?.r,
                    ),
                  ),
                  const SizedBox(width: 16).r,
                  Expanded(
                    child: SkillProgressBar(
                      progress: expOnLevel,
                      maxProgress: actualSkill.expPerLevel,
                      sections: actualSkill.expPerLevel,
                      sectionsSpace: 2.r,
                      color: color,
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          color.withBrightness(0.75),
                          color.withBrightness(1.33)
                        ],
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(32)).r,
                    ),
                  ),
                  const SizedBox(width: 16).r,
                  const SkillControls(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
