//
//  RCTScrollView+MJRefresh.m
//  react-native-gy
//
//  Created by 龙贵林 on 2024/9/9.
//

#import <MJRefresh/MJRefresh.h>
#import <React/RCTLog.h>
#import "RCTScrollView+MJRefresh.h"


@implementation RCTScrollView (MJRefresh)


#pragma mark - 自定义样式属性
static const char GYMJScrollViewEnableRefreshKey = '\0';
- (BOOL)enableGYRefresh {
    return [(NSNumber *)objc_getAssociatedObject(self, &GYMJScrollViewEnableRefreshKey)boolValue];
}

- (void)setEnableGYRefresh:(BOOL)enableGYRefresh {
    objc_setAssociatedObject(self, &GYMJScrollViewEnableRefreshKey,
                             @(enableGYRefresh), OBJC_ASSOCIATION_RETAIN);

    [self initHeader];
}

static const char GYMJScrollViewRefreshingKey = '\0';
- (BOOL)refreshing {
    return [(NSNumber *)objc_getAssociatedObject(self, &GYMJScrollViewRefreshingKey)boolValue];
}

- (void)setRefreshing:(BOOL)refreshing {
    if (self.refreshing == refreshing) {
        return;
    }

    objc_setAssociatedObject(self, &GYMJScrollViewRefreshingKey,
                             @(refreshing), OBJC_ASSOCIATION_RETAIN);
    [self initHeader];
}

static const char GYMJScrollOnRefreshKey = '\0';
- (void)setOnGYRefresh:(RCTBubblingEventBlock)onGYRefresh {
    objc_setAssociatedObject(self, &GYMJScrollOnRefreshKey, onGYRefresh, OBJC_ASSOCIATION_RETAIN);
}

- (RCTBubblingEventBlock)onGYRefresh {
    return objc_getAssociatedObject(self, &GYMJScrollOnRefreshKey);
}

/**
   获取ScrollView
 */
- (UIScrollView *)getScrollView {
    UIScrollView *scrollView = [self valueForKeyPath:@"_scrollView"];

    if (scrollView) {
        return scrollView;
    } else {
        RCTLogError(@"%@", [NSString stringWithFormat:@"ohh, shit! can't get ScrollView"]);
        return nil;
    }
}

#pragma mark - 设置自定义样式方法
- (void)initHeader {
    UIScrollView *scrollView = [self getScrollView];

    if (!self.enableGYRefresh) {
        return;
    }

    if (!scrollView.mj_header) {
        scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshAction)];
    }

    if (self.refreshing) {
        [scrollView.mj_header beginRefreshing];
    } else {
        [scrollView.mj_header endRefreshing];
    }
}

- (void)refreshAction {
    if(self.onGYRefresh){
        self.onGYRefresh(@{});
    }
}

@end
