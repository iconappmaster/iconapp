import 'package:flutter_google_ad_manager/flutter_google_ad_manager.dart';

const testDevice = "5EED6E4AD8D45F7FDCED06D0BDAF7C3D";

class MyTestDevices extends TestDevices {
  static MyTestDevices _instance;

  factory MyTestDevices() {
    if (_instance == null) _instance = new MyTestDevices._internal();
    return _instance;
  }

  MyTestDevices._internal();

  @override
  List<String> get values => List()..add(testDevice);
}
