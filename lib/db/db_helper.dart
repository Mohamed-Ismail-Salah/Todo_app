import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '/models/task.dart';

class DbHelper{
   static Database? db;
   static const  int version =5;
   static const  String tapleName ="task";

   static Future<void>initDb() async{
    if(db!=null)
    {
      debugPrint('not null db');
    return;
    }
      try{
        String _path = await getDatabasesPath() + 'task.db';
        debugPrint('in database path');
        db = await openDatabase(_path, version: version,
            onCreate: (Database db, int version) async {
              debugPrint('creating a new one');
              return db.execute(
                'CREATE TABLE $tapleName('
                    'id INTEGER PRIMARY KEY AUTOINCREMENT, '
                    'title STRING, note TEXT, date STRING, '
                    'startTime STRING, endTime STRING , repeat STRING, '
                    'color INTEGER, '
                    'isCompleted INTEGER)',
              );
            });
        print('Database Created');



      }catch(e){
        print(e);

      }


  }
  static Future<int> insert(Task? task)
  async {

    print('insert function called');
    return await  db!.insert(tapleName, task!.toJson());

  }


   static Future<int> delete(Task task )
   async {

     return await db!.delete("task" ,where:'id = ?',whereArgs: [task.id]);

   }

   static Future<int> update(int id,int val )
   async {
     return await db!.rawUpdate(
         '''
    UPDATE $tapleName
    SET isCompleted = ?
    WHERE id = ?
   ''',[val,id]

     );

   }

   static Future<List<Map<String, dynamic>>> query( )
   async {

     return await db!.query(tapleName);

   }
   static Future<int> deleteAll() async {
     print('delete All function called');
     return await db!.delete(tapleName);
   }

}