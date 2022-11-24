#import "PluginAttPlugin.h"
#if __has_include(<app_tracking_transparency/plugin_att-Swift.h>)
#import <app_tracking_transparency/plugin_att-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "plugin_att-Swift.h"
#endif

@implementation PluginAttPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPluginAttPlugin registerWithRegistrar:registrar];
}
@end
