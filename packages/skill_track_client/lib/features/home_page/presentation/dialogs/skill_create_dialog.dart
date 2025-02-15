import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_track_client/core/domain/entity/skill.dart';
import 'package:skill_track_client/dependency/dependency.dart';
import 'package:skill_track_client/features/home_page/presentation/state/skill_create/skill_create_cubit.dart';
import 'package:skill_track_client/features/home_page/presentation/state/skill_create/skill_create_effect.dart';
import 'package:skill_track_client/features/home_page/presentation/state/skill_create/skill_create_state.dart';
import 'package:skill_track_client/features/home_page/presentation/widgets/action_button.dart';
import 'package:skill_track_client/toolkit/utils/context_util.dart';
import 'package:skill_track_client/toolkit/utils/screen_util.dart';
import 'package:skill_track_client/toolkit/utils/text_util.dart';

class SkillCreateDialog extends StatefulWidget {
  const SkillCreateDialog({super.key});

  @override
  State<SkillCreateDialog> createState() => _SkillCreateDialogState();
}

class _SkillCreateDialogState extends State<SkillCreateDialog> {
  final cubit = blocFactories.skillCreate.generate();
  final nameController = TextEditingController();
  final expPerLevelController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = cubit.state.name;
    expPerLevelController.text =
        cubit.state.expPerLevel?.toStringAsFixed(0) ?? '';
  }

  void _onSave() {
    cubit.finish();
  }

  void _onCancel() {
    context.pop();
  }

  void _onFinish(Skill skill) {
    context.pop(skill);
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.locale;
    final theme = context.theme;
    final styles = theme.textTheme;
    final colors = theme.colorScheme;
    return BlocPresentationListener<SkillCreateCubit, SkillCreateEffect>(
      bloc: cubit,
      listener: (_, effect) => switch (effect) {
        FinishSkillCreateEffect e => _onFinish(e.skill),
      },
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: BlocBuilder<SkillCreateCubit, SkillCreateState>(
          bloc: cubit,
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(32).r,
                  decoration: BoxDecoration(
                    color: colors.surface,
                    borderRadius: const BorderRadius.all(Radius.circular(16)).r,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        locale.createSkill.capitalized,
                        textAlign: TextAlign.center,
                        style: styles.headlineSmall,
                      ),
                      const SizedBox(height: 16).r,
                      Text(
                        locale.skillName.capitalized,
                        textAlign: TextAlign.start,
                        style: styles.labelMedium,
                      ),
                      TextField(
                        controller: nameController,
                        onChanged: cubit.changeName,
                      ),
                      const SizedBox(height: 8).r,
                      Text(
                        locale.skillExpPerLevel.capitalized,
                        textAlign: TextAlign.start,
                        style: styles.labelMedium,
                      ),
                      TextField(
                        controller: expPerLevelController,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'[0-9.]'),
                          ),
                        ],
                        keyboardType: const TextInputType.numberWithOptions(
                          signed: false,
                          decimal: true,
                        ),
                        onChanged: (text) =>
                            cubit.changeExpPerLevel(double.tryParse(text)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8).r,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ActionButton(
                      text: locale.create.capitalized,
                      style: styles.bodyLarge,
                      isActive: state.canSave,
                      onTap: _onSave,
                    ),
                    const SizedBox(width: 8).r,
                    ActionButton(
                      text: locale.cancel.capitalized,
                      style: styles.bodyLarge,
                      onTap: _onCancel,
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
