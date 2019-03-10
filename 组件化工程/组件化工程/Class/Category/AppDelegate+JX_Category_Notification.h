//
//  AppDelegate+JX_Category_Notification.h
//  组件化工程
//
//  Created by 赵才风 on 2019/3/10.
//  Copyright © 2019 JX.Wang. All rights reserved.
//

#import "AppDelegate.h"
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif



@interface AppDelegate (JX_Category_Notification)<UNUserNotificationCenterDelegate>

- (void)JX_Category_Notification_Regist;

// iOS 10收到通知
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler;

// 通知的点击事件
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler;

@end

