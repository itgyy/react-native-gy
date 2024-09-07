
#import <React/RCTBridgeModule.h>


@interface RCT_EXTERN_MODULE(GYHud, NSObject)

RCT_EXTERN_METHOD(show)
RCT_EXTERN_METHOD(showStatus:(NSString *)status)
RCT_EXTERN_METHOD(dismiss)


+ (BOOL)requiresMainQueueSetup
{
  return YES;
}

@end
