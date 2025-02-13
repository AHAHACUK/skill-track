import 'package:skill_track_db/src/view_models/skill_exp_history_entry_model.dart';
import 'package:skill_track_db/src/models/skill_exp_model.dart';
import 'package:skill_track_db/src/models/skill_model.dart';
import 'package:skill_track_db/src/view_models/skill_summary_model.dart';
import 'package:sqflite/sqflite.dart';

class SkillGroup {
  final Future<Database> Function() _databaseDelegate;

  const SkillGroup({
    required Future<Database> Function() databaseDelegate,
  }) : _databaseDelegate = databaseDelegate;

  Future<void> createSkill(SkillModel skillModel) async {
    final database = await _databaseDelegate();
     await database.insert(SkillModel.table, skillModel.toMap());
  }

  Future<void> createSkillExp(SkillExpModel skillExpModel) async {
    final database = await _databaseDelegate();
    await database.insert(SkillExpModel.table, skillExpModel.toMap());
  }

  Future<void> updateSkill(SkillModel skillModel) async {
    final database = await _databaseDelegate();
    await database.update(
      SkillModel.table,
      skillModel.toMap(),
      where: '${SkillModel.columnId} = ?',
      whereArgs: [skillModel.id!],
    );
  }

  Future<void> deleteSkill(int id) async {
    final database = await _databaseDelegate();
    await database.delete(
      SkillModel.table,
      where: '${SkillModel.columnId} = ?',
      whereArgs: [id],
    );
    await database.delete(
      SkillExpModel.table,
      where: '${SkillExpModel.columnSkillId} = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteSkillExp(int id) async {
    final database = await _databaseDelegate();
    await database.delete(
      SkillExpModel.table,
      where: '${SkillExpModel.columnId} = ?',
      whereArgs: [id],
    );
  }

  Future<List<SkillExpHistoryEntryModel>> getExpHistory() async {
    final database = await _databaseDelegate();
    final rows = await database.rawQuery(
      'SELECT'
      ' ${SkillExpModel.table}.${SkillExpModel.columnId} as ${SkillExpHistoryEntryModel.columnId},'
      ' ${SkillModel.table}.${SkillModel.columnName} as ${SkillExpHistoryEntryModel.columnName},'
      ' ${SkillExpModel.table}.${SkillExpModel.columnDateTime} as ${SkillExpHistoryEntryModel.columnDateTime},'
      ' ${SkillExpModel.table}.${SkillExpModel.columnAmount} as ${SkillExpHistoryEntryModel.columnAmount},'
      ' FROM ${SkillExpModel.table}'
      ' LEFT JOIN ${SkillModel.table}'
      ' ON ${SkillModel.table}.${SkillModel.columnId} = ${SkillExpModel.table}.${SkillExpModel.columnSkillId}',
    );
    return rows.map((e) => SkillExpHistoryEntryModel.fromMap(e)).toList();
  }

  Future<List<SkillSummaryModel>> getSkillsSummary({String? query}) async {
    final database = await _databaseDelegate();
    final rows = await database.rawQuery(
      'SELECT'
      ' ${SkillModel.table}.${SkillModel.columnId} as ${SkillSummaryModel.columnId},'
      ' ${SkillModel.table}.${SkillModel.columnName} as ${SkillSummaryModel.columnName},'
      ' ${SkillModel.table}.${SkillModel.columnExpPerLevel} as ${SkillSummaryModel.columnExpPerLevel},'
      ' SUM(${SkillExpModel.columnAmount}) as ${SkillSummaryModel.columnExpSum},'
      ' MAX(${SkillExpModel.columnDateTime}) as ${SkillSummaryModel.columnLastUpdate}'
      ' FROM ${SkillModel.table}'
      ' ${query != null ? 'WHERE ${SkillModel.columnName} LIKE "%?%"' : ''} '
      ' LEFT JOIN ${SkillExpModel.table}'
      ' ON ${SkillModel.table}.${SkillModel.columnId} = ${SkillExpModel.table}.${SkillExpModel.columnSkillId}'
      ' GROUP BY ${SkillModel.columnId}',
      [if (query != null) query],
    );
    return rows.map((e) => SkillSummaryModel.fromMap(e)).toList();
  }
}
