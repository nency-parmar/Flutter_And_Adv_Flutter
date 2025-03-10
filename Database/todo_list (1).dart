import 'package:flutter/material.dart';
import 'package:temp_project/lab_15/database.dart';
// import 'package:flutter_intials/lab_15/database.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  MyDatabase database = MyDatabase();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // selectAll();
  }

  Future<void> selectAll() async {
    // await databse.insertState();
    await database.selectAllState();
    List<Map<String , dynamic>> list = await database.selectAllState();
    print(list);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: FutureBuilder(
          future: database.selectAllState(),
          builder: (context , snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
            }else if (snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.length,
                  itemBuilder: (context , index){
                  return Card(
                    elevation: 5,
                    color: Colors.purple,
                    child: ListTile(
                      title: Text(snapshot.data![index]["work_name"] , style: TextStyle(color: Colors.white),),
                      leading: Text(snapshot.data![index]["work_id"].toString() , style: TextStyle(fontSize: 20 , color: Colors.white),),
                      trailing: Wrap(
                        children: [
                          IconButton(onPressed: (){
                            showDialog(context: context, builder: (context){
                              TextEditingController list = TextEditingController(text: snapshot.data![index]["work_name"]);
                              return AlertDialog(
                                title: Text('Edit'),
                                content: TextField(
                                  controller: list,
                                ),
                                actions: [
                                  ElevatedButton(onPressed: () async {
                                    await database.editWork({'work_id' : snapshot.data![index]["work_id"] , 'Work_name ' : list.text });
                                    Navigator.of(context).pop();
                                  }, child: Text('Edit'))
                                ],
                              );
                            }).then(
                                    (value){
                                  setState(() {

                                  });
                                }
                            );
                            }, icon: Icon(Icons.edit , color: Colors.white,)
                          ),
                          IconButton(onPressed: (){
                            showDialog(context: context, builder: (context){
                              return AlertDialog(
                                title: Text("Are you sure you want to delete?"),
                                actions: [
                                  TextButton(onPressed: (){
                                      database.deleteWork(snapshot.data![index]["work_id"]);
                                      setState(() {

                                      });
                                      Navigator.of(context).pop();
                                    }, child: Text('Yes')
                                  ),
                                  TextButton(onPressed: (){
                                    Navigator.of(context).pop();
                                  }, child: Text('No')
                                  )
                                ],
                              );
                            });

                            setState(() {

                            });
                          }, icon: Icon(Icons.delete , color: Colors.white,)),
                        ],
                      ),
                    ),
                  );
              });
            }
            else{
              return Center(child: Text('Error'));
            }
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
        showDialog(context: context, builder: (context){
          TextEditingController list = TextEditingController();
          return AlertDialog(
            title: Text('Add'),
            content: TextField(
              controller: list,
            ),
            actions: [
              ElevatedButton(onPressed: () async {
                await database.insertState({"work_name": list.text});
                Navigator.of(context).pop();
              }, child: Text('Add'))
            ],
          );
        }).then(
            (value){
              setState(() {

              });
            }
        );
      }, child: Icon(Icons.add),),
    );
  }
}



import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  static Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'my_database.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
        );
      },
    );
  }

  static Future<int> insertUser(String name, int age) async {
    final db = await database;
    return await db.insert('users', {'name': name, 'age': age});
  }

  static Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await database;
    return await db.query('users');
  }
}
