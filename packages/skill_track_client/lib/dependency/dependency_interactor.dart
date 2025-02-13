part of 'dependency.dart';

class _DependencyInteractor {
  late final SkillInteractor skill;

  _DependencyInteractor({required this.skill});

  static Future<_DependencyInteractor> _init(
    _DependencyRepository repository,
  ) async {
    return _DependencyInteractor(
      skill: SkillInteractor(
        repository: repository.skill,
      ),
    );
  }
}
