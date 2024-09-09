//
//  RCTScrollViewManager+MJRefresh.m
//  react-native-gy
//
//  Created by 龙贵林 on 2024/9/9.
//

#import "RCTScrollViewManager+MJRefresh.h"

@implementation RCTScrollViewManager (MJRefresh)

RCT_EXPORT_VIEW_PROPERTY(enableMJRefresh, BOOL)
RCT_EXPORT_VIEW_PROPERTY(mjRefreshing, BOOL)
RCT_EXPORT_VIEW_PROPERTY(onMJRefresh, RCTBubblingEventBlock)



@end
