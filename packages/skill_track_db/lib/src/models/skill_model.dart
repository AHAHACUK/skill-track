class SkillModel {
  static const table = "skill";
  static const columnId = "id";
  static const columnName = "name";
  static const columnExpPerLevel = "expPerLevel";

  final int? id;
  final String name;
  final double expPerLevel;

  const SkillModel({
    this.id,
    required this.name,
    required this.expPerLevel,
  });

  Map<String, Object?> toMap() {
    return <String, Object?>{
      columnId: id,
      columnName: name,
      columnExpPerLevel: expPerLevel,
    };
  }

  SkillModel.fromMap(Map<String, Object?> map)
      : id = map[columnId] as int,
        name = map[columnName] as String,
        expPerLevel = map[columnExpPerLevel] as double;
}
