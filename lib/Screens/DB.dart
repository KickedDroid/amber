import 'dart:io';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:scoped_model/scoped_model.dart';

// File path to a file in the same directory than the current script
String dbPath = join(dirname(Platform.script.toFilePath()), "sample.db");
DatabaseFactory dbFactory = databaseFactoryIo;

// We use the database factory to open the database


Future dataBase() async {
  Database db = await dbFactory.openDatabase(dbPath);
}

class DbModel extends Model {
  String _title = '';

  String get title => _title;
  String _user = 'n';

  String get user => _user;
  
  Future putMethod(String value, String key) async {
    Database db = await dbFactory.openDatabase(dbPath);
    await db.put('$value', '$key');
    String title = await db.get('title') as String;
    _title = title;

    notifyListeners();
  } 

  Future setMethod(String value) async {
    

    _user = value;

    notifyListeners();
  }


}
