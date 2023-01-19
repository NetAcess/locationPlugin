import 'package:flutter_test/flutter_test.dart';
import 'package:my_loc/my_loc.dart';
import 'package:my_loc/my_loc_platform_interface.dart';
import 'package:my_loc/my_loc_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMyLocPlatform
    with MockPlatformInterfaceMixin
    implements MyLocPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MyLocPlatform initialPlatform = MyLocPlatform.instance;

  test('$MethodChannelMyLoc is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMyLoc>());
  });

  test('getPlatformVersion', () async {
    MyLoc myLocPlugin = MyLoc();
    MockMyLocPlatform fakePlatform = MockMyLocPlatform();
    MyLocPlatform.instance = fakePlatform;

    expect(await myLocPlugin.getPlatformVersion(), '42');
  });
}
