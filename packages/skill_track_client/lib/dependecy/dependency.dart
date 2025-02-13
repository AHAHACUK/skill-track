import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' as path;
import 'package:skill_track_client/core/data/repository/db_skill_repository.dart';
import 'package:skill_track_client/core/domain/interactor/skill_interactor.dart';
import 'package:skill_track_client/core/domain/repository/skill_repository.dart';
import 'package:skill_track_client/features/home_page/presentation/state/skill_cubit.dart';
import 'package:skill_track_db/skill_track_db.dart';
import 'package:sqflite/sqflite.dart';

part 'dependency_data_source.dart';
part 'dependency_repository.dart';
part 'dependency_interactor.dart';
part 'dependency_bloc.dart';

abstract class Dependency {
  static bool _initialized = false;
  static late final DependencyBloc bloc;

  static Future<void> init() async {
    assert(_initialized == false);
    _initialized = true;
    final dataSource = await _DependencyDataSource.init();
    final repository = await _DependencyRepository.init(dataSource);
    final interactor = await _DependencyInteractor.init(repository);
    bloc = await DependencyBloc.init(interactor);
  }
}
