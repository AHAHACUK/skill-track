part of 'dependency.dart';

class DependencyBloc {
  final BlocFactory<SkillListCubit> skillList;
  final BlocFactory<SkillCreateCubit> skillCreate;
  final BlocFactory<SkillCubit> skill;

  DependencyBloc({
    required this.skillList,
    required this.skillCreate,
    required this.skill,
  });

  static Future<DependencyBloc> _init(_DependencyInteractor interactor) async {
    return DependencyBloc(
      skillList: BlocFactory(
        () => SkillListCubit(
          skillInteractor: interactor.skill,
        ),
      ),
      skillCreate: BlocFactory(() => SkillCreateCubit()),
      skill: BlocFactory(
        () => SkillCubit(
          skillInteractor: interactor.skill,
        ),
      ),
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
