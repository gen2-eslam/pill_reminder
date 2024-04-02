//CacheHelper That's Connect and Talk to local database.
import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  //Here The Initialize of cache .
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

// this fun to put data in local data base using key
  static Future<dynamic> put({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else {
      return await sharedPreferences.setInt(key, value);
    }
  }

// // this fun to get data already saved in local data base
//   static dynamic get({
//     required String key,
//   }) async {
//     return await SharedPreferences.getInstance();
//   }
 

  static String? getDataString({
    required String key,
  }) {
    return sharedPreferences.getString(key);
  }

  static int? getInt({
    required String key,
  }) {
    return sharedPreferences.getInt(key);
  }

  static bool? getDataBool({
    required String key,
  }) {
    return sharedPreferences.getBool(key);
  }

// remove data using specific key
  static Future<bool> removeData({required String key}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    return await sharedPreferences.remove(key);
  }

//clear all data in the local data base
  static Future<bool> clearData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    return await sharedPreferences.clear();
  }
}
