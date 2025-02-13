part of 'dependency.dart';

class _DependencyRepository {
  late final SkillRepository skill;

  _DependencyRepository({required this.skill});

  static Future<_DependencyRepository> _init(
    _DependencyDataSource dataSource,
  ) async {
    return _DependencyRepository(
      skill: DbSkillRepository(
        database: dataSource.skillTrackDatabase,
      ),
    );
  }
}
