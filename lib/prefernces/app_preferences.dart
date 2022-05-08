import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  // AppPreferences is very useful for login screen >> it means once we've login into the app we don't have to login again so the login information will be saved until another time we'll open the app.
  static final AppPreferences _instance = AppPreferences._internal();
  late SharedPreferences _sharedPreferences;


  AppPreferences._internal(); // _ means that this Named Constructor (his name is internal) is private

  factory AppPreferences() {
    // this factory constructor is a special case of constructors
    return _instance; // factory just returns static instance or another instances from its subclasses.
  }

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
  Future<void> saveCounter({required int counter}) async{
      await _sharedPreferences.setInt("counter",counter);
  }

  int get counter => _sharedPreferences.getInt("counter") ?? 0;

  // Future<void> removeValueFor({required String key}) async{
  //   await _sharedPreferences.remove(key);
  // }
  // or :
  Future<bool> removeCounterValue() async{
    return await _sharedPreferences.remove("counter");
  }

  Future<bool> clear() async{ // clear all the keys
    return await _sharedPreferences.clear();
  }
}