#import "PalestineFirstRunPlugin.h"
#if __has_include(<palestine_first_run/palestine_first_run-Swift.h>)
#import <palestine_first_run/palestine_first_run-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "palestine_first_run-Swift.h"
#endif

@implementation PalestineFirstRunPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPalestineFirstRunPlugin registerWithRegistrar:registrar];
}
@end
