#import <React/RCTBridgeModule.h>


@interface RCT_EXTERN_MODULE(GYToast, NSObject)

RCT_EXTERN_METHOD(show:(NSString*)msg)

+ (BOOL)requiresMainQueueSetup
{
  return YES;
}

@end
