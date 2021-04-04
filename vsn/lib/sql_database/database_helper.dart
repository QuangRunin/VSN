import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vsn/model/m_themes.dart';

class DataBaseHelper {
  static Database _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'vsn.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db .execute('CREATE  TABLE   theme (id INTEGER PRIMARY KEY,themeFontSize TEXT, appBarColor TEXT,appBarTextColor TEXT,titleColor TEXT,textColor TEXT,extraColor TEXT,scaffoldColor TEXT,iconTabColor TEXT,dividerColor TEXT,indexTheme INTEGER)');
  }

  Future<MThemes> addTheme(MThemes theme) async {
    var dbClient = await db;
    theme.id = await dbClient.insert('theme', theme.toMap());
    return theme;
  }
  Future<MThemes> getTheme() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query('theme', columns: ['id','themeFontSize', 'appBarColor','appBarTextColor','titleColor','textColor','extraColor','scaffoldColor','iconTabColor','dividerColor','indexTheme']);
    MThemes theme;
    if (maps.length > 0) {
      theme = MThemes.fromMap(maps[0]);
    }
    return theme;
  }
  Future<int> removeTheme() async {
    var dbClient = await db;
    return await dbClient.delete('theme');
  }
  Future<int> updateThemes(MThemes themes) async {
    var dbClient = await db;
    return await dbClient.update(
      'theme',
      themes.toMap(),
      where: 'id = 1',
    );
  }
  // Future<Car> addCar(Car car) async {
  //   var dbClient = await db;
  //   car.id = await dbClient.insert('car', car.toMap());
  //   return car;
  // }
  // Future<Car> addCarFavoriteByRecommend(Car car) async {
  //   var dbClient = await db;
  //   await dbClient.delete('carFavorite');
  //   car.id = await dbClient.insert('carFavorite', car.toMap());
  //   return car;
  // }
  // Future<Car> addCarToType(Car car,type) async {
  //   var dbClient = await db;
  //   switch(type){
  //     case 0:
  //       var prId = await dbClient.query('carPresent', columns: ['id', 'car_index','maker_id','name','makerName'],where: 'id = ${car.id}');
  //       if(prId.length < 1) {
  //         car.id = await dbClient.insert('carPresent', car.toMap());
  //       }
  //       break;
  //     case 1:
  //       var oldId = await dbClient.query('carOld', columns: ['id', 'car_index','maker_id','name','makerName'],where: 'id = ${car.id}');
  //       if(oldId.length < 1) {
  //         car.id = await dbClient.insert('carOld', car.toMap());
  //       }
  //       break;
  //     case 2:
  //       var frId = await dbClient.query('carFavorite', columns: ['id', 'car_index','maker_id','name','makerName'],where: 'id = ${car.id}');
  //       if(frId.length < 1) {
  //         car.id = await dbClient.insert('carFavorite', car.toMap());
  //       }
  //       break;
  //     case 3 :
  //       var frId = await dbClient.query('carSearch', columns: ['id', 'car_index','maker_id','name','makerName'],where: 'id = ${car.id}');
  //       if(frId.length < 1) {
  //         car.id = await dbClient.insert('carSearch', car.toMap());
  //       }
  //       break;
  //   }
  //   return car;
  // }
  // Future<List<Car>> getCarsbyType(type) async {
  //   var dbClient = await db;
  //   List<Map> maps = await dbClient.query(type == 0 ?'carPresent': type == 1 ? 'carOld' : type == 2 ? 'carFavorite' : 'carSearch', columns: ['id', 'car_index','maker_id','name','makerName']);
  //   List<Car> cars = [];
  //   if (maps.length > 0) {
  //     for (int i = 0; i < maps.length; i++) {
  //       cars.add(Car.fromMap(maps[i]));
  //     }
  //   }
  //   return cars;
  // }
  // Future<List<Car>> getCars(int makerId) async {
  //   var dbClient = await db;
  //   List<Map> maps = await dbClient.query('car', columns: ['id', 'car_index','maker_id','name','makerName'],where: 'maker_id = $makerId');
  //   List<Car> cars = [];
  //   if (maps.length > 0) {
  //     for (int i = 0; i < maps.length; i++) {
  //       cars.add(Car.fromMap(maps[i]));
  //     }
  //   }
  //   return cars;
  // }
  // Future<List<Car>> getAllCar() async {
  //   var dbClient = await db;
  //   List<Map> maps = await dbClient.query('car', columns: ['id', 'car_index','maker_id','name','makerName']);
  //   List<Car> cars = [];
  //   if (maps.length > 0) {
  //     for (int i = 0; i < maps.length; i++) {
  //       cars.add(Car.fromMap(maps[i]));
  //     }
  //   }
  //   return cars;
  // }
  // Future<List<Car>> getMaker() async {
  //   var dbClient = await db;
  //   List<Map> maps = await dbClient.query('maker', columns: ['id','name']);
  //   List<Car> maker = [];
  //   if (maps.length > 0) {
  //     for (int i = 0; i < maps.length; i++) {
  //       maker.add(Car.fromMap(maps[i]));
  //     }
  //   }
  //   return maker;
  // }
  // Future<int> deleteCarSearch(int id) async {
  //   var dbClient = await db;
  //   return await dbClient.delete(
  //     'carSearch',
  //     where: 'id = ?',
  //     whereArgs: [id],
  //   );
  // }
  // Future<int> delete(int id) async {
  //   var dbClient = await db;
  //   return await dbClient.delete(
  //     'car',
  //     where: 'id = ?',
  //     whereArgs: [id],
  //   );
  // }
  // Future<int> deleteCarByType(int id,type) async {
  //   var dbClient = await db;
  //   return await dbClient.delete(
  //     type == 0 ?'carPresent': type == 1 ? 'carOld' : 'carFavorite',
  //     where: 'id = ?',
  //     whereArgs: [id],
  //   );
  // }
  // Future<int> deleteAllMaker() async {
  //   var dbClient = await db;
  //   return await dbClient.delete('maker');
  // }
  // Future<int> deleteAllCar() async {
  //   var dbClient = await db;
  //   return await dbClient.delete('car');
  // }
  // Future<int> deleteAllCarRecommend() async {
  //   var dbClient = await db;
  //   return await dbClient.delete('carFavorite');
  // }
  // Future<int> deleteAllCarFavorite() async {
  //   var dbClient = await db;
  //   return await dbClient.delete('carFavorite');
  // }
  // Future<int> update(Car car) async {
  //   var dbClient = await db;
  //   return await dbClient.update(
  //     'car',
  //     car.toMap(),
  //     where: 'id = ?',
  //     whereArgs: [car.id],
  //   );
  // }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
