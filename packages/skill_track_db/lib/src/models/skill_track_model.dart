class SkillTrackModel {
  static const table = "skillTrack";
  static const columnId = "id";
  static const columnSkillId = "skillId";

  final int id;
  final int skillId;

  const SkillTrackModel({
    required this.id,
    required this.skillId,
  });

  Map<String, Object?> toMap() {
    return <String, Object?>{
      columnId: id,
      columnSkillId: skillId,
    };
  }

  SkillTrackModel.fromMap(Map<String, Object?> map)
      : id = map[columnId] as int,
        skillId = map[columnSkillId] as int;
}
