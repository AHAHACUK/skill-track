final class SkillCreateState {
  final String name;
  final double? expPerLevel;

  bool get canSave =>
      name.isNotEmpty && expPerLevel != null && expPerLevel! > 0;

  const SkillCreateState({
    required this.name,
    required this.expPerLevel,
  });

  SkillCreateState copyWith({
    String? name,
    double? expPerLevel,
  }) {
    return SkillCreateState(
      name: name ?? this.name,
      expPerLevel: expPerLevel ?? this.expPerLevel,
    );
  }
}
