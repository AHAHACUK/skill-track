class Skill {
  final int? id;
  final String name;
  final double expSum;
  final double expPerLevel;
  final DateTime? lastUpdate;

  int get level => (expSum / expPerLevel).floor();
  double get expOnLevel => expSum % expPerLevel;

  const Skill({
    required this.id,
    required this.name,
    required this.expSum,
    required this.expPerLevel,
    required this.lastUpdate,
  });

  Skill copyWith({
    int? id,
    double? exp,
  }) {
    return Skill(
      id: id ?? this.id,
      name: name,
      expSum: exp ?? this.expSum,
      expPerLevel: expPerLevel,
      lastUpdate: lastUpdate,
    );
  }
}
