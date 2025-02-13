import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_track_client/router/router.dart';

class SkillCreateDialog extends StatefulWidget {
  const SkillCreateDialog({super.key});

  @override
  State<SkillCreateDialog> createState() => _SkillCreateDialogState();
}

class _SkillCreateDialogState extends State<SkillCreateDialog> {
  final nameController = TextEditingController();
  final expPerLevelController = TextEditingController();

  void _confirm() {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: nameController,
          ),
          TextField(
            controller: expPerLevelController,
          ),
        ],
      ),
    );
  }
}
