import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  //String
  addStringToSF(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('stringValue', value);
  }
//int
   addIntToSF(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('intValue', value);
  }
//double
   addDoubleToSF(double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('doubleValue', value);
  }
// bool
   addBoolToSF(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('boolValue', value);
  }
  //-------------------------------------------------

    getStringValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = prefs.getString(key)??'';
    return stringValue;
  }
   getBoolValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    bool boolValue = prefs.getBool(key)?? false;
    return boolValue;
  }
   getIntValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return int
    int intValue = prefs.getInt(key)??0;
    return intValue;
  }
   getDoubleValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return double
    double doubleValue = prefs.getDouble(key)??0.0;
    return doubleValue;
  }
}