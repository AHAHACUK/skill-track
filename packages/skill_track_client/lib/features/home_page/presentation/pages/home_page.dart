import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_track_client/core/domain/entity/skill.dart';
import 'package:skill_track_client/dependency/dependency.dart';
import 'package:skill_track_client/features/home_page/presentation/dialogs/skill_create_dialog.dart';
import 'package:skill_track_client/features/home_page/presentation/state/skill_list/skill_list_cubit.dart';
import 'package:skill_track_client/features/home_page/presentation/state/skill_list/skill_list_state.dart';
import 'package:skill_track_client/features/home_page/presentation/widgets/action_button.dart';
import 'package:skill_track_client/features/home_page/presentation/widgets/skill_card.dart';
import 'package:skill_track_client/utils/screen_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final SkillListCubit skillCubit;

  @override
  void initState() {
    super.initState();
    skillCubit = blocFactories.skillList.generate();
  }

  @override
  void dispose() {
    skillCubit.close();
    super.dispose();
  }

  void _createSkill(BuildContext context) async {
    final skill = await showDialog<Skill>(
      context: context,
      builder: (_) => const SkillCreateDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              ActionButton(
                text: "ADD",
                onTap: () => _createSkill(context),
              ),
            ],
          ),
          Expanded(
            child: BlocBuilder(
              bloc: skillCubit,
              builder: (_, state) {
                if (state is! DataSkillListState) {
                  return const SizedBox.shrink();
                }
                return ListView.separated(
                  itemBuilder: (_, index) {
                    final skill = state.skills[index];
                    return SkillCard(skill: skill);
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 4).r,
                  itemCount: state.skills.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
