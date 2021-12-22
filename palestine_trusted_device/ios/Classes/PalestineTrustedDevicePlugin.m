#import "PalestineTrustedDevicePlugin.h"
#if __has_include(<palestine_trusted_device/palestine_trusted_device-Swift.h>)
#import <palestine_trusted_device/palestine_trusted_device-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "palestine_trusted_device-Swift.h"
#endif

@implementation PalestineTrustedDevicePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPalestineTrustedDevicePlugin registerWithRegistrar:registrar];
}
@end
