class Skill {
  final int? id;
  final String name;
  final double exp;
  final double expPerLevel;
  final DateTime? lastUpdate;

  int get level => (exp / expPerLevel).floor();

  const Skill({
    required this.id,
    required this.name,
    required this.exp,
    required this.expPerLevel,
    required this.lastUpdate,
  });

  Skill copyWith({int? id}) {
    return Skill(
      id: id ?? this.id,
      name: name,
      exp: exp,
      expPerLevel: expPerLevel,
      lastUpdate: lastUpdate,
    );
  }
}
