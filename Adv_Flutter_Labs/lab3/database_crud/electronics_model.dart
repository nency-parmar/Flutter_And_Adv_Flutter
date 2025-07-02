import '../../utils/import_export.dart';

class ElectronicsModelDatabase{
  static Database? _database;

  Future<Database> initDatabase() async{

    if(_database != null){
      return _database!;
    }

    Directory directory = await getApplicationCacheDirectory();
    String path = join(directory.path, 'Electronics.db');

     _database = await openDatabase(path ,
         version: 1,
       onCreate: (db, version)async {

      await db.execute('''
          create table ELECTRONICS(
           electronic_id INTEGER PRIMARY KEY AUTOINCREMENT,
           electronic_name TEXT NOT NULL,
           electronic_price TEXT NOT NULL,
           electronic_url TEXT NOT NULL
          )''');
      },);

    return _database!;
  }
}