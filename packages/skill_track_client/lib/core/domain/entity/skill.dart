class Skill {
  final int id;
  final String name;
  final double exp;
  final double expPerLevel;

  int get level => (exp / expPerLevel).floor();

  const Skill({
    required this.id,
    required this.name,
    required this.exp,
    required this.expPerLevel,
  });
}
