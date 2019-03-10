//
//  JXSystemMacros.h
//  组件化工程
//
//  Created by 王加祥 on 2019/3/8.
//  Copyright © 2019 JX.Wang. All rights reserved.
//  判断系统

#ifndef JXSystemMacros_h
#define JXSystemMacros_h

#import <AdSupport/AdSupport.h>

/**
 判断当前系统

 @return 当前系统
 */
#define JX_System_Version ([[UIDevice currentDevice].systemVersion floatValue])


/**
 获取当前UUID

 @return 当前UUD
 */
#define JX_System_UUID [[NSString alloc] initWithString:[[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString]]


/**
 获取当前Build版本号

 @return Build版本号
 */
#define JX_System_Build_Version [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]


/**
 获取当前版本号

 @return 当前版本号
 */
#define JX_System_App_Version [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#endif /* JXSystemMacros_h */
