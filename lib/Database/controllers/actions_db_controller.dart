

import 'package:badgetplanner/models/models/actions.dart';

import '../db_operations.dart';
import '../db_provider.dart';

class ActionDbController extends DbOperations<ActionClass>{

  ActionDbController(){
    database = DBProvider().database;
  }

  @override
  Future<int> create(ActionClass data) async{
    return await database.insert(ActionClass.TABLE_NAME, data.toMap());
  }

  @override
  Future<bool> delete(int id) async{
    int countOfDeletedRows = await database.delete(ActionClass.TABLE_NAME, where: 'id = ?', whereArgs: [id]);
    return countOfDeletedRows != 0;
  }

  @override
  Future<List<ActionClass>> read() async{
    var rowsMaps = await database.query(ActionClass.TABLE_NAME);
    return rowsMaps.map((rowMap) => ActionClass.fromMap(rowMap)).toList();
  }

  @override
  Future<ActionClass?> show(int id) async{
    var data = await database.query(ActionClass.TABLE_NAME, where: 'id = ?', whereArgs: [id]);
    return data.isNotEmpty ? data.map((rowMap) => ActionClass.fromMap(rowMap)).first : null;
  }

  @override
  Future<bool> update(ActionClass data) async{
    int countOfUpdatedRows = await database.update(ActionClass.TABLE_NAME, data.toMap(), where: 'id = ?', whereArgs: [data.id]);
    return countOfUpdatedRows != 0;
  }

  Future<void> deleteAllRows() async{
    await database.delete(ActionClass.TABLE_NAME);
  }

}