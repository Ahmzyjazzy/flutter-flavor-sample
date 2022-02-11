import 'package:device_info_plus/device_info_plus.dart';

enum BuildMode { debug, profile, release }

class DeviceUtils {
  static BuildMode currentBuildMode() {
    if (const bool.fromEnvironment('dart.vm.product')) {
      return BuildMode.release;
    }
    var result = BuildMode.profile;

    //Little trick, since assert only runs on debug mode
    assert(() {
      result = BuildMode.debug;
      return true;
    }());
    return result;
  }

  static Future<AndroidDeviceInfo> androidDeviceInfo() async {
    DeviceInfoPlugin plugin = DeviceInfoPlugin();
    return plugin.androidInfo;
  }

  static Future<IosDeviceInfo> iosDeviceInfo() async {
    DeviceInfoPlugin plugin = DeviceInfoPlugin();
    return plugin.iosInfo;
  }
}
