
import 'plugin_att_platform_interface.dart';

class PluginAtt {
  Future<String?> getPlatformVersion() {
    return PluginAttPlatform.instance.getPlatformVersion();
  }
}
