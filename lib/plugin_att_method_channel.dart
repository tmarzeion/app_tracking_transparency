import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'plugin_att_platform_interface.dart';

/// An implementation of [PluginAttPlatform] that uses method channels.
class MethodChannelPluginAtt extends PluginAttPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('plugin_att');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
