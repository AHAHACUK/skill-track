import 'package:skill_track_db/src/models/skill_exp_model.dart';
import 'package:skill_track_db/src/models/skill_model.dart';
import 'package:sqflite/sqflite.dart';

class SkillTrackDatabase {
  final String path;

  const SkillTrackDatabase({required this.path});

  Future<Database> _open() async {
    return openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE ${SkillModel.table} ('
          ' ${SkillModel.columnId} INTEGER PRIMARY KEY,'
          ' ${SkillModel.columnName} TEXT,'
          ' ${SkillModel.columnExpPerLevel} REAL)',
        );
        await db.execute(
          'CREATE TABLE ${SkillExpModel.table} ('
          ' ${SkillExpModel.columnId} INTEGER PRIMARY KEY,'
          ' ${SkillExpModel.columnSkillId} INTEGER,'
          ' ${SkillExpModel.columnDateTime} INTEGER,'
          ' ${SkillExpModel.columnAmount} REAL)',
        );
      },
    );
  }
}
