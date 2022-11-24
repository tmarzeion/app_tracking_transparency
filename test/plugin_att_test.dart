import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_att/plugin_att.dart';
import 'package:plugin_att/plugin_att_platform_interface.dart';
import 'package:plugin_att/plugin_att_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPluginAttPlatform
    with MockPlatformInterfaceMixin
    implements PluginAttPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PluginAttPlatform initialPlatform = PluginAttPlatform.instance;

  test('$MethodChannelPluginAtt is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPluginAtt>());
  });

  test('getPlatformVersion', () async {
    PluginAtt pluginAttPlugin = PluginAtt();
    MockPluginAttPlatform fakePlatform = MockPluginAttPlatform();
    PluginAttPlatform.instance = fakePlatform;

    expect(await pluginAttPlugin.getPlatformVersion(), '42');
  });
}
