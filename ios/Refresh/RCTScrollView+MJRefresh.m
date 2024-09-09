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
- (BOOL)enableMJRefresh {
    return [(NSNumber *)objc_getAssociatedObject(self, &GYMJScrollViewEnableRefreshKey)boolValue];
}

- (void)setEnableMJRefresh:(BOOL)enableMJRefresh {
    objc_setAssociatedObject(self, &GYMJScrollViewEnableRefreshKey,
                             @(enableMJRefresh), OBJC_ASSOCIATION_RETAIN);

    [self initHeader];
}

static const char GYMJScrollViewRefreshingKey = '\0';
- (BOOL)mjRefreshing {
    return [(NSNumber *)objc_getAssociatedObject(self, &GYMJScrollViewRefreshingKey)boolValue];
}

- (void)setMjRefreshing:(BOOL)mjRefreshing {
    if (self.mjRefreshing == mjRefreshing) {
        return;
    }

    objc_setAssociatedObject(self, &GYMJScrollViewRefreshingKey,
                             @(mjRefreshing), OBJC_ASSOCIATION_RETAIN);
    [self initHeader];
}

static const char GYMJScrollonRefreshKey = '\0';
- (void)setOnMJRefresh:(RCTBubblingEventBlock)onMJRefresh {
    objc_setAssociatedObject(self, &GYMJScrollonRefreshKey, onMJRefresh, OBJC_ASSOCIATION_RETAIN);
}

- (RCTBubblingEventBlock)onMJRefresh {
    return objc_getAssociatedObject(self, &GYMJScrollonRefreshKey);
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

    if (!self.enableMJRefresh) {
        return;
    }

    if (!scrollView.mj_header) {
        scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshAction)];
    }

    if (self.mjRefreshing) {
        [scrollView.mj_header beginRefreshing];
    } else {
        [scrollView.mj_header endRefreshing];
    }
}

- (void)refreshAction {
    if(self.onMJRefresh){
        self.onMJRefresh(@{});
    }
}

@end
