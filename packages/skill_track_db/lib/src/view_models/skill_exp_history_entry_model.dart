class SkillExpHistoryEntryModel {
  static const columnId = 'id';
  static const columnName = 'name';
  static const columnDateTime = 'dateTime';
  static const columnAmount = 'amount';
  final int skillExpId;
  final DateTime dateTime;
  final String skillName;
  final double amount;

  const SkillExpHistoryEntryModel({
    required this.skillExpId,
    required this.dateTime,
    required this.skillName,
    required this.amount,
  });

  SkillExpHistoryEntryModel.fromMap(Map<String, Object?> map)
      : skillExpId = map[columnId] as int,
        skillName = map[columnName] as String,
        dateTime =
            DateTime.fromMillisecondsSinceEpoch(map[columnDateTime] as int),
        amount = map[columnAmount] as double;
}
