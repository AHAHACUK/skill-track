part of 'dependency.dart';

class DependencyBloc {
  late final _BlocFactory<SkillCubit> skill;

  DependencyBloc({required this.skill});

  static Future<DependencyBloc> init(_DependencyInteractor interactor) async {
    return DependencyBloc(
      skill: _BlocFactory(() => SkillCubit()),
    );
  }
}

class _BlocFactory<T extends BlocBase> {
  final T Function() _generateDelegate;

  _BlocFactory(
    T Function() generateDelegate,
  ) : _generateDelegate = generateDelegate;

  T generate() => _generateDelegate.call();
}
