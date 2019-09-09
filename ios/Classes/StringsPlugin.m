#import "StringsPlugin.h"

@implementation StringsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"plugins.njovy.com/strings"
                                     binaryMessenger:[registrar messenger]];
    StringsPlugin* instance = [[StringsPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"getString" isEqualToString:call.method]) {
        NSString* key = [call.arguments objectForKey:@"key"];
        NSArray* args = [call.arguments objectForKey:@"args"];
        
        if (args != [NSNull null]) {
            NSRange range = NSMakeRange(0, [args count]);
            NSMutableData* data = [NSMutableData dataWithLength: sizeof(id) * [args count]];
            [args getObjects: (__unsafe_unretained id *)data.mutableBytes range:range];
            result([[NSString alloc] initWithFormat:NSLocalizedString(key, nil)  arguments:data.mutableBytes]);
        } else {
            result(NSLocalizedString(key, nil));
        }
        
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end
