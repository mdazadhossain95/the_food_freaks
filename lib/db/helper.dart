// import 'package:sqflite/sqflite.dart';
//
// class Helper{
//   late Database _database;
//
//   Future<Database> get database async{
//     if(_database == null){
//       _database = await initializeDatabase();
//       return _database;
//     }
//   }
//
//   Future<Database> initializeDatabase() async {
//     var dir = await getDatabasesPath();
//     var path = dir + 'total.db'
//
//   }
//
// }