import 'package:device_information/device_information.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DeviceInfoUtil {

  static Future<String> getDeviceIMEI() {
      return DeviceInformation.deviceIMEINumber;
  }

  static Future<String> getDeviceModel() {
    return DeviceInformation.deviceModel;
  }

  static Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version + ";" + packageInfo.buildNumber;
  }
}