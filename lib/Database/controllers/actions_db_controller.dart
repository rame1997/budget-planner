

import 'package:badgetplanner/models/models/actions.dart';

import '../db_operations.dart';
import '../db_provider.dart';

class ActionDbController extends DbOperations<Action>{

  ActionDbController(){
    database = DBProvider().database;
  }

  @override
  Future<int> create(Action data) async{
    return await database.insert('action', data.toMap());
  }

  @override
  Future<bool> delete(int id) async{
    int countOfDeletedRows = await database.delete('action', where: 'id = ?', whereArgs: [id]);
    return countOfDeletedRows != 0;
  }

  @override
  Future<List<Action>> read() async{
    var rowsMaps = await database.query('action');
    return rowsMaps.map((rowMap) => Action.fromMap(rowMap)).toList();
  }

  @override
  Future<Action?> show(int id) async{
    var data = await database.query('action', where: 'id = ?', whereArgs: [id]);
    return data.isNotEmpty ? data.map((rowMap) => Action.fromMap(rowMap)).first : null;
  }

  @override
  Future<bool> update(Action data) async{
    int countOfUpdatedRows = await database.update('action', data.toMap(), where: 'id = ?', whereArgs: [data.id]);
    return countOfUpdatedRows != 0;
  }

  Future<void> deleteAllRows() async{
    await database.delete('action');
  }

}