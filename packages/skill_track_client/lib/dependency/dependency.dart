import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' as path;
import 'package:skill_track_client/core/data/repository/db_skill_repository.dart';
import 'package:skill_track_client/core/domain/interactor/skill_interactor.dart';
import 'package:skill_track_client/core/domain/repository/skill_repository.dart';
import 'package:skill_track_client/features/home_page/presentation/state/skill/skill_cubit.dart';
import 'package:skill_track_client/features/home_page/presentation/state/skill_create/skill_create_cubit.dart';
import 'package:skill_track_client/features/home_page/presentation/state/skill_list/skill_list_cubit.dart';
import 'package:skill_track_db/skill_track_db.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

part 'dependency_data_source.dart';
part 'dependency_repository.dart';
part 'dependency_interactor.dart';
part 'dependency_bloc.dart';

bool _initialized = false;
late final DependencyBloc blocFactories;

Future<void> initDependency() async {
  assert(_initialized == false);
  _initialized = true;
  final dataSource = await _DependencyDataSource._init();
  final repository = await _DependencyRepository._init(dataSource);
  final interactor = await _DependencyInteractor._init(repository);
  blocFactories = await DependencyBloc._init(interactor);
}
