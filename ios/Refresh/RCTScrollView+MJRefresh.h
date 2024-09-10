//
//  RCTScrollView+MJRefresh.h
//  react-native-gy
//
//  Created by 古耀耀 on 2024/9/9.
//

#import <React/RCTScrollView.h>
NS_ASSUME_NONNULL_BEGIN

@interface RCTScrollView (MJRefresh)

// 下拉刷新
@property (nonatomic, assign) BOOL enableGYRefresh;
@property (nonatomic, assign) BOOL refreshing;
@property (nonatomic, copy) RCTBubblingEventBlock onGYRefresh;


@end

NS_ASSUME_NONNULL_END
