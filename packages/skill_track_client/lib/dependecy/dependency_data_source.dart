part of 'dependency.dart';

class _DependencyDataSource {
  final SkillTrackDatabase skillTrackDatabase;

  _DependencyDataSource({required this.skillTrackDatabase});

  static Future<_DependencyDataSource> init() async {
    final databasePath = await getDatabasesPath();
    return _DependencyDataSource(
      skillTrackDatabase: SkillTrackDatabase(
        path: path.join(databasePath, 'skillTrack.db'),
      ),
    );
  }
}
