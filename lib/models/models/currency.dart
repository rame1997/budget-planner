
import 'db_table.dart';

class Currency extends DbTable {
  late int id;
  late String nameEn;
  late String nameAr;
  bool checked = false;

  Currency.fromMap(Map<String, dynamic> rowMap) : super.fromMap(rowMap) {
    id = rowMap['id'];
    nameEn = rowMap['name_en'];
    nameAr = rowMap['name_ar'];
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['name_en'] = nameEn;
    map['name_ar'] = nameAr;
    return map;
  }
  static const TABLE_NAME = 'currencies';

  @override
  set tableName(String _tableName) {
    // TODO: implement tableName
    super.tableName = 'currencies';
  }
}
