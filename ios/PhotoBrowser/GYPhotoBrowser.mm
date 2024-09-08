#import <React/RCTBridgeModule.h>


@interface RCT_EXTERN_MODULE(GYPhotoBrowser, NSObject)


RCT_EXTERN_METHOD(show:(NSArray *)aData index:(NSInteger)aIndex options:(NSDictionary*)aOptions)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end
