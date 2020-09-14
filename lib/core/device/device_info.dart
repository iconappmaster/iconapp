import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/foundation.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';

class DeviceInfo {
  DeviceInfoRepository repo;

  DeviceInfo() {
    repo = sl<DeviceInfoRepository>();
  }

  sendInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isIOS) {
      final ios = await deviceInfo.iosInfo;
      repo.sendIOSInfo(ios);
    } else {
      final android = await deviceInfo.androidInfo;
      repo.sendAndroidInfo(android);
    }
  }
}

abstract class DeviceInfoRepository {
  Future sendIOSInfo(IosDeviceInfo ios);
  Future sendAndroidInfo(AndroidDeviceInfo android);
}

class DeviceInfoRepositoryImpl implements DeviceInfoRepository {
  final RestClient restClient;

  DeviceInfoRepositoryImpl({
    @required this.restClient,
  });

  @override
  Future sendAndroidInfo(AndroidDeviceInfo android) {
    android.androidId;
    android.model;
    android.brand;
    android.manufacturer;

    return Future.value();
  }

  @override
  Future sendIOSInfo(IosDeviceInfo ios) {
    ios.identifierForVendor;
    ios.model;
    ios.name;
    ios.systemName;
    ios.systemVersion;
    
    return Future.value();
  }
}
