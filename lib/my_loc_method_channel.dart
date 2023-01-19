import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'my_loc_platform_interface.dart';

/// An implementation of [MyLocPlatform] that uses method channels.
class MethodChannelMyLoc extends MyLocPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('my_loc');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
