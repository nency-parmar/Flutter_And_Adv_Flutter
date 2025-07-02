import 'package:advance_flutter_lab/lab3/database_crud/electronics_model.dart';
import 'package:advance_flutter_lab/utils/import_export.dart';

class ElectronicController{

  ElectronicsModelDatabase _modelDatabase = ElectronicsModelDatabase();

  Future<List<Map<String , dynamic>>> selectAllElectronics() async{
    Database db = await _modelDatabase.initDatabase();
    return db.query("ELECTRONICS");
  }

  Future<void> addElec(Map<String, dynamic> map) async {
    Database db = await _modelDatabase.initDatabase();
    await db.insert("ELECTRONICS", map);
  }

  Future<void> deleteElec(int id) async {
    Database db = await _modelDatabase.initDatabase();
    await db.delete("ELECTRONICS", where: "electronic_id = ?", whereArgs: [id]);
  }

  Future<void> editElec(Map<String, dynamic> map) async {
    Database db = await _modelDatabase.initDatabase();
    await db.update("ELECTRONICS", map, where: "electronic_id = ?", whereArgs: [map['electronic_id']]);
  }
}