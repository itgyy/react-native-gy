#import <React/RCTBridgeModule.h>


@interface RCT_EXTERN_MODULE(GYPhotoBowser, NSObject)


RCT_EXTERN_METHOD(show:(NSSArray *)aData index:(NSInteger)aIndex)


+ (BOOL)requiresMainQueueSetup
{
  return YES;
}

@end
