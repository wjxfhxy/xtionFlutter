#import "XtionUtilsPlugin.h"
#if __has_include(<xtion_utils/xtion_utils-Swift.h>)
#import <xtion_utils/xtion_utils-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "xtion_utils-Swift.h"
#endif

@implementation XtionUtilsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftXtionUtilsPlugin registerWithRegistrar:registrar];
}
@end
