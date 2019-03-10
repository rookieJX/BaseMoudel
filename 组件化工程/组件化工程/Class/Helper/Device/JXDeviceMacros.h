//
//  JXDeviceMacros.h
//  组件化工程
//
//  Created by 王加祥 on 2019/3/8.
//  Copyright © 2019 JX.Wang. All rights reserved.
//

#ifndef JXDeviceMacros_h
#define JXDeviceMacros_h

#import "JXDeviceHelper.h"


/**
 单粒类

 @return 单粒类
 */
#define JX_Device [JXDeviceHelper sharedJXDeviceHelper]

/**
 获取当前控制器
 
 @return 当前控制器
 */
#define JX_Device_Macros_CurrentController [JX_Device JX_Device_CurrentController]


/**
 是否支持拍照

 @return YES:支持，NO:不支持
 */
#define JX_Device_Macros_CameraAvailable [JX_Device JX_Device_CameraAvailable]

/**
 是否支持相册功能
 
 @return 相册功能
 */
#define JX_Device_Macros_PhotoListAvailable [JX_Device JX_Device_PhotoListAvailable]

/**
 是否支持保存至相册功能
 
 @return 保存功能
 */
#define JX_Device_Macros_PhotoSaveAvailable [JX_Device JX_Device_PhotoSaveAvailable]


/**
 打电话
 
 @param x 电话号码
 */
#define JX_Device_Macros_Call_PhoneNumber(x) [JX_Device JX_Device_Call_PhoneNumber:x]


/**
 进入设置界面
 */
#define JX_Device_Macros_Open_Setting [JX_Device JX_Device_Open_Setting]

#pragma mark - 判断权限，但是不会弹出是否允许弹出权限
/**
 判断当前是有麦克风权限,但是不会弹出是否允许弹出权限
 （需要在info中配置）Privacy - Microphone Usage Description 允许**访问您的语音，来用于**功能？
 
 @return YES:有权限，NO:没权限
 */
#define JX_Device_Permission_Macros_AudioAuth [JX_Device JX_Device_Permission_AudioAuth]

/**
 判断相机权限开关,但是不会弹出是否允许弹出权限
 (需要在info中配置)Privacy - Camera Usage Description 允许**访问您的相机,来用于**功能
 
 @return YES:有权限，NO:没权限
 */
#define JX_Device_Permission_Macros_CameraAuth [JX_Device JX_Device_Permission_CameraAuth]

/**
 判断相册权限开关,但是不会弹出是否允许弹出权限
 (需要在info中配置)Privacy - Photo Library Additions Usage Description 允许**访问您的相册,来用于**功能
 
 @return YES:有权限，NO:没权限
 */
#define JX_Device_Permission_Macros_PhotoLibraryAuth [JX_Device JX_Device_Permission_PhotoLibraryAuth]

/**
 推送权限开关
 
 @return YES:有权限，NO:没权限
 */
#define JX_Device_Permission_Macros_NotificationAuth [JX_Device JX_Device_Permission_NotificationAuth]

/**
 连网权限开关
 
 @return YES:有权限，NO:没权限
 */
#define JX_Device_Permission_Macros_NetWorkAuth [JX_Device JX_Device_Permission_NetWorkAuth]

/**
 定位权限开关
 (需要在info中配置)Privacy - Location When In Use Usage Description 允许**在应用使用期间访问您的位置,来用于**功能
 (需要在info中配置)Privacy - Location Always and When In Use Usage Description 允许**访问您的位置,来用于**功能
 
 @return YES:有权限，NO:没权限
 */
#define JX_Device_Permission_Macros_LocationAuth [JX_Device JX_Device_Permission_LocationAuth]

/**
 通讯录权限开关
 (需要在info中配置)Privacy - Contacts Usage Description 允许**访问您的通讯录,来用于**功能
 
 @return YES:有权限，NO:没权限
 */
#define JX_Device_Permission_Macros_AddressBookAuth [JX_Device JX_Device_Permission_AddressBookAuth]

/**
 日历权限开关
 (需要在info中配置)Privacy - Calendars Usage Description 允许**访问您的日历,来用于**功能
 
 @return YES:有权限，NO:没权限
 */
#define JX_Device_Permission_Macros_CalendarAuth [JX_Device JX_Device_Permission_CalendarAuth]

/**
 备忘录权限开关
 (需要在info中配置)Privacy - Reminders Usage Description 允许**访问您的备忘录,来用于**功能
 
 @return YES:有权限，NO:没权限
 */
#define JX_Device_Permission_Macros_ReminderAuth [JX_Device JX_Device_Permission_ReminderAuth]


#endif /* JXDeviceMacros_h */
