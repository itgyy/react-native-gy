
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>


@interface RCT_EXTERN_MODULE(GYFile, NSObject)

RCT_EXTERN_METHOD(openSystemFileManager)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end
