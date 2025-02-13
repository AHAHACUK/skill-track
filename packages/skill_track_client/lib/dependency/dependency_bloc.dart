part of 'dependency.dart';

class DependencyBloc {
  late final BlocFactory<SkillListCubit> skillList;

  DependencyBloc({required this.skillList});

  static Future<DependencyBloc> _init(_DependencyInteractor interactor) async {
    return DependencyBloc(
      skillList: BlocFactory(() => SkillListCubit()),
    );
  }
}

class BlocFactory<T extends BlocBase> {
  final T Function() _generateDelegate;

  BlocFactory(
    T Function() generateDelegate,
  ) : _generateDelegate = generateDelegate;

  T generate() => _generateDelegate.call();
}
