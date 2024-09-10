//
//  RCTScrollViewManager+MJRefresh.m
//  react-native-gy
//
//  Created by 龙贵林 on 2024/9/9.
//

#import "RCTScrollViewManager+MJRefresh.h"

@implementation RCTScrollViewManager (MJRefresh)

RCT_EXPORT_VIEW_PROPERTY(enableGYRefresh, BOOL)
RCT_EXPORT_VIEW_PROPERTY(refreshing, BOOL)
RCT_EXPORT_VIEW_PROPERTY(onGYRefresh, RCTBubblingEventBlock)



@end
