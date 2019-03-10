//
//  JXDeviceHelper.h
//  组件化工程
//
//  Created by 王加祥 on 2019/3/8.
//  Copyright © 2019 JX.Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JXSingletonHelper.h"
#import <UIKit/UIKit.h>


/**
 判断当前是有语音权限,会弹出是否允许弹出权限
 （需要在info中配置）Privacy - Microphone Usage Description 允许**访问您的语音，来用于**功能？
 */
typedef void(^CheckPermissionAudioAuth)         (BOOL permission);
/**
 判断相机权限开关,会弹出是否允许弹出权限
 (需要在info中配置)Privacy - Camera Usage Description 允许**访问您的相机,来用于**功能
 */
typedef void(^CheckPermissionCameraAuth)        (BOOL permission);
/**
 判断相册权限开关,会弹出是否允许弹出权限
 (需要在info中配置)Privacy - Photo Library Additions Usage Description 允许**访问您的相册,来用于**功能
 */
typedef void(^CheckPermissionPhotoLibraryAuth)  (BOOL permission);
/**
 判断通知权限开关,会弹出是否允许弹出权限
 */
typedef void(^CheckPermissionNotificationAuth)  (BOOL permission);
/**
 定位权限开关,会弹出是否允许弹出权限
 (需要在info中配置)Privacy - Location When In Use Usage Description 允许**在应用使用期间访问您的位置,来用于**功能
 (需要在info中配置)Privacy - Location Always and When In Use Usage Description 允许**访问您的位置,来用于**功能
 */
typedef void(^CheckPermissionLocationAuth)      (BOOL permission);
/**
 通讯录权限开关,会弹出是否允许弹出权限
 (需要在info中配置)Privacy - Contacts Usage Description 允许**访问您的通讯录,来用于**功能
 */
typedef void(^CheckPermissionAddressBookAuth)   (BOOL permission);
/**
 日历权限开关,会弹出是否允许弹出权限
 (需要在info中配置)Privacy - Calendars Usage Description 允许**访问您的日历,来用于**功能
 */
typedef void(^CheckPermissionCalendarAuth)      (BOOL permission);
/**
 备忘录权限开关,会弹出是否允许弹出权限
 (需要在info中配置)Privacy - Reminders Usage Description 允许**访问您的备忘录,来用于**功能
 */
typedef void(^CheckPermissionReminderAuth)      (BOOL permission);

@interface JXDeviceHelper : NSObject
singleton_interface(JXDeviceHelper);

/**
 获取当前控制器

 @return 当前控制器
 */
- (UIViewController *)JX_Device_CurrentController;


/**
 是否支持拍照功能

 @return 拍照功能
 */
- (BOOL)JX_Device_CameraAvailable;

/**
 是否支持相册功能
 
 @return 相册功能
 */
- (BOOL)JX_Device_PhotoListAvailable;

/**
 是否支持保存至相册功能
 
 @return 保存功能
 */
- (BOOL)JX_Device_PhotoSaveAvailable;
/**
 打电话

 @param phoneNumber 电话号码
 */
- (void)JX_Device_Call_PhoneNumber:(NSString *)phoneNumber;

/**
 进入设置界面
 */
- (void)JX_Device_Open_Setting;

/**
 弹出框
 
 @param title 标题
 @param message 描述
 @param preferredStyle 类型
 @param cancelTitle 取消
 @param handlerCancel 取消时间
 @param sureTitle 确定
 @param handlerSure 确定时间
 @return 弹出框
 */
- (UIAlertController *)JX_Device_AlertController_Title:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle cancelTitle:(NSString *)cancelTitle cancelHandler:(void(^)(UIAlertAction *cancleAction))handlerCancel sureTitle:(NSString *)sureTitle sureHandler:(void(^)(UIAlertAction *sureAction))handlerSure;

#pragma mark - 判断权限，但是不会弹出是否允许弹出权限

/**
 判断当前是有麦克风权限,但是不会弹出是否允许弹出权限
 (需要在info中配置) Privacy - Microphone Usage Description 允许**访问您的麦克风,来用于**功能
 
 @return YES:有权限，NO:没权限
 */
- (BOOL)JX_Device_Permission_AudioAuth;

/**
 判断相机权限开关,但是不会弹出是否允许弹出权限
 (需要在info中配置)Privacy - Camera Usage Description 允许**访问您的相机,来用于**功能
 
 @return YES:有权限，NO:没权限
 */
- (BOOL)JX_Device_Permission_CameraAuth;

/**
 判断相册权限开关,但是不会弹出是否允许弹出权限
 (需要在info中配置)Privacy - Photo Library Additions Usage Description 允许**访问您的相册,来用于**功能
 
 @return YES:有权限，NO:没权限
 */
- (BOOL)JX_Device_Permission_PhotoLibraryAuth;
/**
 推送权限开关
 
 @return YES:有权限，NO:没权限
 */
- (BOOL)JX_Device_Permission_NotificationAuth;

/**
 连网权限开关
 
 @return YES:有权限，NO:没权限
 */
- (BOOL)JX_Device_Permission_NetWorkAuth;

/**
 定位权限开关
 (需要在info中配置)Privacy - Location When In Use Usage Description 允许**在应用使用期间访问您的位置,来用于**功能
 (需要在info中配置)Privacy - Location Always and When In Use Usage Description 允许**访问您的位置,来用于**功能
 
 @return YES:有权限，NO:没权限
 */
- (BOOL)JX_Device_Permission_LocationAuth;

/**
 通讯录权限开关
 (需要在info中配置)Privacy - Contacts Usage Description 允许**访问您的通讯录,来用于**功能
 
 @return YES:有权限，NO:没权限
 */
- (BOOL)JX_Device_Permission_AddressBookAuth;

/**
 日历权限开关
 (需要在info中配置)Privacy - Calendars Usage Description 允许**访问您的日历,来用于**功能
 
 @return YES:有权限，NO:没权限
 */
- (BOOL)JX_Device_Permission_CalendarAuth;
/**
 备忘录权限开关
 (需要在info中配置)Privacy - Reminders Usage Description 允许**访问您的备忘录,来用于**功能
 
 @return YES:有权限，NO:没权限
 */
- (BOOL)JX_Device_Permission_ReminderAuth;

#pragma mark - 判断权限，弹出是否允许弹出权限

/**
 判断当前是有语音权限,会弹出是否允许弹出权限
 （需要在info中配置）Privacy - Microphone Usage Description 允许**访问您的语音，来用于**功能？
 */
- (void)JX_Device_Permission_Check_AudioAuth:(CheckPermissionAudioAuth)permission;
/**
 判断相机权限开关,但是不会弹出是否允许弹出权限
 (需要在info中配置)Privacy - Camera Usage Description 允许**访问您的相机,来用于**功能
 */
- (void)JX_Device_Permission_Check_CameraAuth:(CheckPermissionCameraAuth)permission;
/**
 判断相册权限开关,但是不会弹出是否允许弹出权限
 (需要在info中配置)Privacy - Photo Library Additions Usage Description 允许**访问您的相册,来用于**功能
 */
- (void)JX_Device_Permission_Check_PhotoLibraryAuth:(CheckPermissionPhotoLibraryAuth)permission;

/**
 判断通知权限开关,会弹出是否允许弹出权限(远程)
 */
- (void)JX_Device_Permission_Check_NotificationAuth:(CheckPermissionNotificationAuth)permission;

/**
 定位权限开关
 (需要在info中配置)Privacy - Location When In Use Usage Description 允许**在应用使用期间访问您的位置,来用于**功能
 (需要在info中配置)Privacy - Location Always and When In Use Usage Description 允许**访问您的位置,来用于**功能
 */
- (void)JX_Device_Permission_Check_LocationAuth:(CheckPermissionLocationAuth)permission;
/**
 通讯录权限开关
 (需要在info中配置)Privacy - Contacts Usage Description 允许**访问您的通讯录,来用于**功能
 */
- (void)JX_Device_Permission_Check_AddressBookAuth:(CheckPermissionAddressBookAuth)permission;
/**
 日历权限开关
 (需要在info中配置)Privacy - Calendars Usage Description 允许**访问您的日历,来用于**功能
 */
- (void)JX_Device_Permission_Check_CalendarAuth:(CheckPermissionCalendarAuth)permission;
/**
 备忘录权限开关
 (需要在info中配置)Privacy - Reminders Usage Description 允许**访问您的备忘录,来用于**功能
 */
- (void)JX_Device_Permission_Check_ReminderAuth:(CheckPermissionReminderAuth)permission;

@end

