class SkillExpModel {
  static const table = "skillExp";
  static const columnId = "id";
  static const columnSkillId = "skillId";
  static const columnDateTime = "dateTime";
  static const columnAmount = "amount";

  final int? id;
  final int skillId;
  final DateTime dateTime;
  final double amount;

  const SkillExpModel({
    required this.id,
    required this.skillId,
    required this.dateTime,
    required this.amount,
  });

  Map<String, Object?> toMap() {
    return <String, Object?>{
      columnId: id,
      columnSkillId: skillId,
      columnDateTime: dateTime.millisecondsSinceEpoch,
      columnAmount: amount,
    };
  }

  SkillExpModel.fromMap(Map<String, Object?> map)
      : id = map[columnId] as int,
        skillId = map[columnSkillId] as int,
        dateTime =
            DateTime.fromMillisecondsSinceEpoch(map[columnDateTime] as int),
        amount = map[columnAmount] as double;
}
