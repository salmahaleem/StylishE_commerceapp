import 'package:shared_preferences/shared_preferences.dart';

class StylishSharedPreferences {
  static late SharedPreferences sharedPreferences;

  static Future<void>init()async{
      sharedPreferences = await SharedPreferences.getInstance();
  }
 //theme
  static Future<void>setTheme(int theme)async{
    await sharedPreferences.setInt('theme', theme);
  }

  static int? getTheme(){
    return sharedPreferences.getInt('theme');
  }

  //language
  static Future<void>setLanguage(String language)async{
    await sharedPreferences.setString('language', language);
  }

  static String? getLanguage(){
    return sharedPreferences.getString('language');
  }

  static Future<void>setToken(String token)async{
    await sharedPreferences.setString('auth_token', token);

  }

  static  String? getToken(){
    return sharedPreferences.getString('auth_token');
  }

  static Future<void>deleteToken()async{
   await sharedPreferences.remove('auth_token');
  }

  static Future<void> setId(int id)async{
    await sharedPreferences.setInt('id', id);
  }

  static int? getId(){
    return sharedPreferences.getInt('id');
  }

}