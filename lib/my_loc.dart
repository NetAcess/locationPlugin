
import 'my_loc_platform_interface.dart';

class MyLoc {
  Future<String?> getPlatformVersion() {
    return MyLocPlatform.instance.getPlatformVersion();
  }
}
