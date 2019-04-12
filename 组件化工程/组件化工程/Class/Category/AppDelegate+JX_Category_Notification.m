//
//  AppDelegate+JX_Category_Notification.m
//  组件化工程
//
//  Created by 赵才风 on 2019/3/10.
//  Copyright © 2019 JX.Wang. All rights reserved.
//

#import "AppDelegate+JX_Category_Notification.h"
#import "JXDeviceMacros.h"
#import "JXMacrosHeader.h"
@implementation AppDelegate (JX_Category_Notification)

#pragma mark - 远程推送

/**
 远程推送注册
 */
- (void)JX_Category_Notification_Regist_Rmote {
    [JX_Device JX_Device_Permission_Check_NotificationAuth:^(BOOL permission) {}];
    [UNUserNotificationCenter   currentNotificationCenter].delegate = self;
    // 注册获得device Token
    [[UIApplication sharedApplication] registerForRemoteNotifications];
}


// 获得Device Token
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSLog(@"%@", [NSString stringWithFormat:@"Device Token: %@", deviceToken]);
}
// 获得Device Token失败
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}

// iOS 10收到通知
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler{
    // 可以更改远程推送内容
    NSDictionary * userInfo = notification.request.content.userInfo;
    UNNotificationRequest *request = notification.request; // 收到推送的请求
    UNNotificationContent *content = request.content; // 收到推送的消息内容
    NSNumber *badge = content.badge;  // 推送消息的角标
    NSString *body = content.body;    // 推送消息体
    UNNotificationSound *sound = content.sound;  // 推送消息的声音
    NSString *subtitle = content.subtitle;  // 推送消息的副标题
    NSString *title = content.title;  // 推送消息的标题
    
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        NSLog(@"iOS10 前台收到远程通知");
        
    }
    else {
        // 判断为本地通知
        NSLog(@"iOS10 前台收到本地通知:{\\\\nbody:%@，\\\\ntitle:%@,\\\\nsubtitle:%@,\\\\nbadge：%@，\\\\nsound：%@，\\\\nuserInfo：%@\\\\n}",body,title,subtitle,badge,sound,userInfo);
    }
    completionHandler(UNNotificationPresentationOptionBadge|UNNotificationPresentationOptionSound|UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以设置
}

// 通知的点击事件
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler{
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    UNNotificationRequest *request = response.notification.request; // 收到推送的请求
    UNNotificationContent *content = request.content; // 收到推送的消息内容
    NSNumber *badge = content.badge;  // 推送消息的角标
    NSString *body = content.body;    // 推送消息体
    UNNotificationSound *sound = content.sound;  // 推送消息的声音
    NSString *subtitle = content.subtitle;  // 推送消息的副标题
    NSString *title = content.title;  // 推送消息的标题
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        NSLog(@"iOS10 收到远程通知");
        
    } else {
        // 判断为本地通知
        NSLog(@"iOS10 收到本地通知:{\\\\nbody:%@，\\\\ntitle:%@,\\\\nsubtitle:%@,\\\\nbadge：%@，\\\\nsound：%@，\\\\nuserInfo：%@\\\\n}",body,title,subtitle,badge,sound,userInfo);
    }
    
    // Warning: UNUserNotificationCenter delegate received call to -userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler: but the completion handler was never called.
    completionHandler();  // 系统要求执行这个方法
    
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    NSLog(@"iOS7及以上系统，收到通知");
    completionHandler(UIBackgroundFetchResultNewData);
}

#pragma mark - 本地推送

/**
 本地推送
 */
- (void)JX_Category_Notification_Regist_Local {

    [JX_Device JX_Device_Permission_Check_NotificationAuth:^(BOOL permission) {
        if (permission) {
            [UNUserNotificationCenter   currentNotificationCenter].delegate = self;
            [JX_Device JX_Device_Permission_Check_NotificationAuth:^(BOOL permission) {
                
                if (JX_System_Version >= 10.0) {
                    
                    // 1、创建通知内容，注：这里得用可变类型的UNMutableNotificationContent，否则内容的属性是只读的
                    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
                    // 标题
                    content.title = @"**";
                    // 次标题
                    content.subtitle = @"****";
                    // 内容
                    content.body = @"*****";
                    
                    // app显示通知数量的角标
                    content.badge = @(11);
                    
                    // 通知的提示声音，这里用的默认的声音
                    content.sound = [UNNotificationSound defaultSound];
                    
                    NSString *path = [[NSBundle mainBundle] pathForResource:@"local" ofType:@"jpg"];
                    UNNotificationAttachment *attachment = [UNNotificationAttachment attachmentWithIdentifier:@"imageIndetifier" URL:[NSURL fileURLWithPath:path] options:nil error:nil];
                    
                    // 附件 可以是音频、图片、视频 这里是一张图片
                    content.attachments = @[attachment];
                    
                    // 标识符
                    content.categoryIdentifier = @"categoryIndentifier";
                    
                    // 2、创建通知触发
                    /* 触发器分三种：
                     UNTimeIntervalNotificationTrigger : 在一定时间后触发，如果设置重复的话，timeInterval不能小于60
                     UNCalendarNotificationTrigger : 在某天某时触发，可重复
                     UNLocationNotificationTrigger : 进入或离开某个地理区域时触发
                     */
                    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5 repeats:NO];
                    
                    // 3、创建通知请求
                    UNNotificationRequest *notificationRequest = [UNNotificationRequest requestWithIdentifier:@"KFGroupNotification" content:content trigger:trigger];
                    
                    // 4、将请求加入通知中心
                    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:notificationRequest withCompletionHandler:^(NSError * _Nullable error) {
                        if (error == nil) {
                            NSLog(@"已成功加推送%@",notificationRequest.identifier);
                        }
                    }];
                } else if (JX_System_Version >= 8.0) {
                    UILocalNotification *notification = [[UILocalNotification alloc] init];
                    // 设置触发通知的时间
                    NSDate *fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
                    notification.fireDate = fireDate;
                    // 时区
                    notification.timeZone = [NSTimeZone defaultTimeZone];
                    // 通知重复提示的单位，可以是天、周、月
                    notification.repeatInterval = NSCalendarUnitDay;
                    
                    // 通知内容
                    notification.alertBody =  @"****";
                    notification.applicationIconBadgeNumber = 21;
                    // 通知被触发时播放的声音
                    notification.soundName = UILocalNotificationDefaultSoundName;
                    // 通知参数
                    NSDictionary *userDict = [NSDictionary dictionaryWithObject:@"*****" forKey:@"key"];
                    notification.userInfo = userDict;
                    
                    // 执行通知注册
                    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
                }
            }];

        }
    }];
}


@end
