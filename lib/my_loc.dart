
import 'my_loc_platform_interface.dart';

class MyLoc {
  Future<String?> getCurrentLocation() {
    return MyLocPlatform.instance.getCurrentLocation();
  }

  Future<String?> getAndroidVersion() {
    return MyLocPlatform.instance.getAndroidVersion();
  }

  Future<String?> getAppVersion() {
    return MyLocPlatform.instance.getAppVersion();
  }

  Future<String?> getArchitecture() {
    return MyLocPlatform.instance.getArchitecture();
  }
}
