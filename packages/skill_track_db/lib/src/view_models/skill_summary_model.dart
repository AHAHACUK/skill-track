class SkillSummaryModel {
  static const columnId = "id";
  static const columnName = "name";
  static const columnExpPerLevel = "expPerLevel";
  static const columnExpSum = "expSum";
  static const columnLastUpdate = "lastUpdate";

  final int skillId;
  final String name;
  final double expPerLevel;
  final double expSum;
  final DateTime lastUpdateDateTime;

  const SkillSummaryModel({
    required this.skillId,
    required this.name,
    required this.expSum,
    required this.expPerLevel,
    required this.lastUpdateDateTime,
  });

  SkillSummaryModel.fromMap(Map<String, Object?> map)
      : skillId = map[columnId] as int,
        name = map[columnName] as String,
        lastUpdateDateTime =
            DateTime.fromMillisecondsSinceEpoch(map[columnLastUpdate] as int),
        expSum = map[columnExpSum] as double,
        expPerLevel = map[columnExpPerLevel] as double;
}
