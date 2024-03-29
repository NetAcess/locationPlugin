import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'my_loc_method_channel.dart';

abstract class MyLocPlatform extends PlatformInterface {
  /// Constructs a MyLocPlatform.
  MyLocPlatform() : super(token: _token);

  static final Object _token = Object();

  static MyLocPlatform _instance = MethodChannelMyLoc();

  /// The default instance of [MyLocPlatform] to use.
  ///
  /// Defaults to [MethodChannelMyLoc].
  static MyLocPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MyLocPlatform] when
  /// they register themselves.
  static set instance(MyLocPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getCurrentLocation() {
    throw UnimplementedError('getCurrentLocation() has not been implemented.');
  }

  Future<String?> getAndroidVersion() {
    throw UnimplementedError('getAndroidVersion() has not been implemented.');
  }

  Future<String?> getAppVersion() {
    throw UnimplementedError('getAppVersion() has not been implemented.');
  }

  Future<String?> getArchitecture() {
    throw UnimplementedError('getArchitecture() has not been implemented.');
  }
}
