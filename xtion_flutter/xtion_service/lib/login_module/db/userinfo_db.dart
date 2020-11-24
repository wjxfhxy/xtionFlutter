
import 'package:sqflite/sqflite.dart';

class UserInfoDB {

  static Database _db = null;

  void _openDB() async {

    if(_db == null)
      _db = await openDatabase('UserInfo.db');
  }
}