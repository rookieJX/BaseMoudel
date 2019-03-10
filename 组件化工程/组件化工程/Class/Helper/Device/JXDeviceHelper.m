//
//  JXDeviceHelper.m
//  组件化工程
//
//  Created by 王加祥 on 2019/3/8.
//  Copyright © 2019 JX.Wang. All rights reserved.
//

#import "JXDeviceHelper.h"
#import "JXMacrosHeader.h"
#import "JXNullMacros.h"
#import "JXSystemMacros.h"
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <UserNotifications/UserNotifications.h>
@import CoreTelephony;
#import <CoreLocation/CoreLocation.h>
#import <AddressBook/AddressBook.h>
#import <Contacts/Contacts.h>
#import <EventKit/EventKit.h>


@interface JXDeviceHelper ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

/**
 跳转到相册
 */
@property (nonatomic, strong) UIImagePickerController *imagePickerController;

@end

@implementation JXDeviceHelper
singleton_implementation(JXDeviceHelper);

/**
 获取当前控制器
 
 @return 当前控制器
 */
- (UIViewController *)JX_Device_CurrentController {
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

/**
 是否支持拍照功能
 
 @return 拍照功能
 */
- (BOOL)JX_Device_CameraAvailable {
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}


/**
 是否支持相册功能

 @return 相册功能
 */
- (BOOL)JX_Device_PhotoListAvailable {
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary];
}


/**
 是否支持保存至相册功能

 @return 保存功能
 */
- (BOOL)JX_Device_PhotoSaveAvailable {
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
}

/**
 打电话
 
 @param phoneNumber 电话号码
 */
- (void)JX_Device_Call_PhoneNumber:(NSString *)phoneNumber {
    if (JX_Null_String(phoneNumber)) return;
    NSString *num = [[NSString alloc] initWithFormat:@"telprompt://%@",phoneNumber];
    NSURL *url = [NSURL URLWithString:num];
    if (![[UIApplication sharedApplication] canOpenURL:url]) return;
    if (JX_System_Version >= 10.0) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
    } else  {
        [[UIApplication sharedApplication] openURL:url];
    }
    
    
}


/**
 进入设置界面
 */
- (void)JX_Device_Open_Setting {
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if( ![[UIApplication sharedApplication] canOpenURL:url] ) return;
    if (JX_System_Version >= 10.0) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL  success) {}];
    } else {
        [[UIApplication sharedApplication] openURL:url];
    }
    
}

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
- (UIAlertController *)JX_Device_AlertController_Title:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle cancelTitle:(NSString *)cancelTitle cancelHandler:(void (^)(UIAlertAction *))handlerCancel sureTitle:(NSString *)sureTitle sureHandler:(void (^)(UIAlertAction *))handlerSure{
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    if (handlerCancel) {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:handlerCancel];
        [controller addAction:cancelAction];
    }
    if (handlerSure) {
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:sureTitle style:UIAlertActionStyleDefault handler:handlerSure];
        [controller addAction:sureAction];
    }
    return controller;
}

#pragma mark - 判断权限，但是不会弹出是否允许弹出权限

/**
 判断当前是有语音权限,但是不会弹出是否允许弹出权限
 （需要在info中配置）Privacy - Microphone Usage Description 允许**访问您的语音，来用于**功能？
 
 @return YES:有权限，NO:没权限
 */
- (BOOL)JX_Device_Permission_AudioAuth {
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    if (authStatus == AVAuthorizationStatusDenied || authStatus == AVAuthorizationStatusRestricted) {
        return NO;
    }
    return YES;
}


/**
 判断相机权限开关,但是不会弹出是否允许弹出权限
 (需要在info中配置)Privacy - Camera Usage Description 允许**访问您的相机,来用于**功能
 
 @return YES:有权限，NO:没权限
 */
- (BOOL)JX_Device_Permission_CameraAuth {
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusDenied || authStatus == AVAuthorizationStatusRestricted) {
        return NO;
    }
    return YES;
}

/**
 判断相册权限开关,但是不会弹出是否允许弹出权限
 (需要在info中配置)Privacy - Photo Library Additions Usage Description 允许**访问您的相册,来用于**功能
 
 @return YES:有权限，NO:没权限
 */
- (BOOL)JX_Device_Permission_PhotoLibraryAuth {
    
    if (JX_System_Version >= 8.0) {
        PHAuthorizationStatus authStatus = [PHPhotoLibrary authorizationStatus];
        if(authStatus == PHAuthorizationStatusDenied || authStatus == PHAuthorizationStatusRestricted) {
            return NO;
        }
    } else if (JX_System_Version >= 6.0 && JX_System_Version < 8.0) {
        ALAuthorizationStatus authStatus = [ALAssetsLibrary authorizationStatus];
        if(authStatus == ALAuthorizationStatusDenied || authStatus == ALAuthorizationStatusRestricted) {
            return NO;
        }
    }
    return YES;
}
/**
 推送权限开关
 
 @return YES:有权限，NO:没权限
 */
- (BOOL)JX_Device_Permission_NotificationAuth {
    if (JX_System_Version >= 8.0f) {
        UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
        if (UIUserNotificationTypeNone == setting.types) {
            return NO;
        }
        
    } else {
        UIRemoteNotificationType type = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
        if(UIRemoteNotificationTypeNone == type){
            return NO;
        }
    }
    return YES;
}

/**
 连网权限开关
 
 @return YES:有权限，NO:没权限
 */
- (BOOL)JX_Device_Permission_NetWorkAuth {
    CTCellularData *cellularData = [[CTCellularData alloc]init];
    CTCellularDataRestrictedState state = cellularData.restrictedState;
    if (state == kCTCellularDataRestricted) {
        return NO;
    }
    return YES;
}

/**
 定位权限开关
 (需要在info中配置)Privacy - Location When In Use Usage Description 允许**在应用使用期间访问您的位置,来用于**功能
 (需要在info中配置)Privacy - Location Always and When In Use Usage Description 允许**访问您的位置,来用于**功能
 
 @return YES:有权限，NO:没权限
 */
- (BOOL)JX_Device_Permission_LocationAuth {
    BOOL isLocation = [CLLocationManager locationServicesEnabled];
    if (!isLocation) {
        CLAuthorizationStatus CLstatus = [CLLocationManager authorizationStatus];
        if (CLstatus == kCLAuthorizationStatusDenied || CLstatus == kCLAuthorizationStatusDenied) {
            return NO;
        }
    }
    return YES;
}

/**
 通讯录权限开关
 (需要在info中配置)Privacy - Contacts Usage Description 允许**访问您的通讯录,来用于**功能
 
 @return YES:有权限，NO:没权限
 */
- (BOOL)JX_Device_Permission_AddressBookAuth {
    if (JX_System_Version >= 9.0) {
        CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
        if (status == CNAuthorizationStatusDenied || status == CNAuthorizationStatusRestricted) {
            return NO;
        }
    } else {
        ABAuthorizationStatus ABstatus = ABAddressBookGetAuthorizationStatus();
        if (ABstatus == kABAuthorizationStatusDenied || ABstatus == kABAuthorizationStatusRestricted) {
            return NO;
        }
    }
    return YES;
}

/**
 日历权限开关
 (需要在info中配置)Privacy - Calendars Usage Description 允许**访问您的日历,来用于**功能
 
 @return YES:有权限，NO:没权限
 */
- (BOOL)JX_Device_Permission_CalendarAuth {
    EKAuthorizationStatus EKstatus = [EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent];
    if (EKstatus == EKAuthorizationStatusDenied || EKstatus == EKAuthorizationStatusRestricted) {
        return NO;
    }
    return YES;
}
/**
 备忘录权限开关
 (需要在info中配置)Privacy - Reminders Usage Description 允许**访问您的备忘录,来用于**功能
 
 @return YES:有权限，NO:没权限
 */
- (BOOL)JX_Device_Permission_ReminderAuth {
    EKAuthorizationStatus EKstatus = [EKEventStore authorizationStatusForEntityType:EKEntityTypeReminder];
    if (EKstatus == EKAuthorizationStatusDenied || EKstatus == EKAuthorizationStatusRestricted)
    {
        return NO;
    }
    return YES;
}



#pragma mark - 判断权限，弹出是否允许弹出权限

/**
 判断当前是有语音权限,会弹出是否允许弹出权限
 （需要在info中配置）Privacy - Microphone Usage Description 允许**访问您的语音，来用于**功能？
 */
- (void)JX_Device_Permission_Check_AudioAuth:(CheckPermissionAudioAuth)permission {
    AVAudioSession *session = [AVAudioSession sharedInstance];
    if ([session respondsToSelector:@selector(requestRecordPermission:)]){
        [session performSelector:@selector(requestRecordPermission:) withObject:^(BOOL granted) {
            permission(granted);
        }];
    }

}
/**
 判断相机权限开关,但是会弹出是否允许弹出权限
 (需要在info中配置)Privacy - Camera Usage Description 允许**访问您的相机,来用于**功能
 */
- (void)JX_Device_Permission_Check_CameraAuth:(CheckPermissionCameraAuth)permission {
    BOOL auth = [self JX_Device_CameraAvailable];
    if (!auth) permission(NO);
    NSString *mediaType = AVMediaTypeVideo;//读取媒体类型
    [AVCaptureDevice requestAccessForMediaType:mediaType completionHandler:^(BOOL granted) {
        dispatch_async(dispatch_get_main_queue(),^{
            permission(granted);
            if (granted) {
                
            } else {
                
            }
        });
    }];
}
/**
 判断相册权限开关,但是会弹出是否允许弹出权限
 (需要在info中配置)Privacy - Photo Library Additions Usage Description 允许**访问您的相册,来用于**功能
 */
- (void)JX_Device_Permission_Check_PhotoLibraryAuth:(CheckPermissionPhotoLibraryAuth)permission {
    
    BOOL auth = [self JX_Device_PhotoListAvailable];
    if (!auth) permission(NO);
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) { //弹出访问权限提示框
        if (status == PHAuthorizationStatusAuthorized) {
            dispatch_async(dispatch_get_main_queue(),^{
                permission(YES);
            });
        } else {
            dispatch_async(dispatch_get_main_queue(),^{
                permission(NO);
            });
            
        }
    }];
}
/**
 定位权限开关
 (需要在info中配置)Privacy - Location When In Use Usage Description 允许**在应用使用期间访问您的位置,来用于**功能
 (需要在info中配置)Privacy - Location Always and When In Use Usage Description 允许**访问您的位置,来用于**功能
 */
- (void)JX_Device_Permission_Check_LocationAuth:(CheckPermissionLocationAuth)permission {
    BOOL auth = NO;
    if ([CLLocationManager locationServicesEnabled] && ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorized)) {
        auth = YES;
    }else if ([CLLocationManager authorizationStatus] ==kCLAuthorizationStatusDenied) {
        auth = NO;
    }
    permission(auth);
}
/**
 通讯录权限开关
 (需要在info中配置)Privacy - Contacts Usage Description 允许**访问您的通讯录,来用于**功能
 */
- (void)JX_Device_Permission_Check_AddressBookAuth:(CheckPermissionAddressBookAuth)permission {}
/**
 日历权限开关
 (需要在info中配置)Privacy - Calendars Usage Description 允许**访问您的日历,来用于**功能
 */
- (void)JX_Device_Permission_Check_CalendarAuth:(CheckPermissionCalendarAuth)permission {}
/**
 备忘录权限开关
 (需要在info中配置)Privacy - Reminders Usage Description 允许**访问您的备忘录,来用于**功能
 */
- (void)JX_Device_Permission_Check_ReminderAuth:(CheckPermissionReminderAuth)permission {}

@end
