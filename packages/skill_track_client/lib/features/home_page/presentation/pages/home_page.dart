import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_track_client/core/domain/entity/skill.dart';
import 'package:skill_track_client/dependency/dependency.dart';
import 'package:skill_track_client/features/home_page/presentation/dialogs/skill_create_dialog.dart';
import 'package:skill_track_client/features/home_page/presentation/state/skill_list/skill_list_cubit.dart';
import 'package:skill_track_client/features/home_page/presentation/state/skill_list/skill_list_state.dart';
import 'package:skill_track_client/features/home_page/presentation/widgets/action_button.dart';
import 'package:skill_track_client/features/home_page/presentation/widgets/skill_card.dart';
import 'package:skill_track_client/toolkit/transform/bloc_listenable_transformer.dart';
import 'package:skill_track_client/toolkit/transform/value_listenable_map.dart';
import 'package:skill_track_client/toolkit/utils/context_util.dart';
import 'package:skill_track_client/toolkit/utils/screen_util.dart';
import 'package:skill_track_client/core/presentation/widgets/loading_veil_wrapper.dart';
import 'package:skill_track_client/toolkit/utils/text_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final SkillListCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = blocFactories.skillList.generate();
    cubit.update();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  void _createSkill(BuildContext context) async {
    final skill = await showDialog<Skill>(
      context: context,
      builder: (_) => const SkillCreateDialog(),
    );
    if (context.mounted && skill != null) {
      cubit.createSkill(skill);
    }
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.locale;
    return Scaffold(
      body: LoadingVeilWrapper(
        delay: const Duration(milliseconds: 100),
        controller:
            cubit.toValueListenable().map((e) => e is! DataSkillListState),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16).r,
              child: Column(
                children: [
                  Row(
                    children: [
                      ActionButton(
                        text: locale.createSkill.capitalized,
                        onTap: () => _createSkill(context),
                      ),
                    ],
                  ),
                  Expanded(
                    child: BlocBuilder(
                      bloc: cubit,
                      buildWhen: (_, state) => state is DataSkillListState,
                      builder: (_, state) {
                        final skills = state is DataSkillListState
                            ? state.skills
                            : const [];
                        return ListView.separated(
                          padding: const EdgeInsets.symmetric(vertical: 8).r,
                          itemBuilder: (_, index) {
                            final skill = skills[index];
                            return SkillCard(skill: skill);
                          },
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 4).r,
                          itemCount: skills.length,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
