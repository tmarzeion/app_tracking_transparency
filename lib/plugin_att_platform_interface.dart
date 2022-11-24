import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'plugin_att_method_channel.dart';

abstract class PluginAttPlatform extends PlatformInterface {
  /// Constructs a PluginAttPlatform.
  PluginAttPlatform() : super(token: _token);

  static final Object _token = Object();

  static PluginAttPlatform _instance = MethodChannelPluginAtt();

  /// The default instance of [PluginAttPlatform] to use.
  ///
  /// Defaults to [MethodChannelPluginAtt].
  static PluginAttPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PluginAttPlatform] when
  /// they register themselves.
  static set instance(PluginAttPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
