abstract class DbTable {
  late String tableName;

  DbTable.fromMap(Map<String, dynamic> rowMap);

  DbTable();

  Map<String, dynamic> toMap();
}
