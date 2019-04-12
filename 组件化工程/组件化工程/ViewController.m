//
//  ViewController.m
//  组件化工程
//
//  Created by 王加祥 on 2019/3/8.
//  Copyright © 2019 JX.Wang. All rights reserved.
//

#import "ViewController.h"

#import "JXNullHelper.h"
#import "JXMacrosHeader.h"
#import "JXDeviceHelper.h"
#import "JXHelperHeader.h"
#import "AppDelegate.h"
#import "AppDelegate+JX_Category_Notification.h"
#import "CALayer+JX_Category_Animation.h"

#import <Photos/Photos.h>

#define KbuttonHeight 50

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationBarDelegate>
@property (nonatomic,strong) UIImagePickerController *imagePickerController;
@property (nonatomic,strong) UIImageView *imageView;
/** 摇动 */
@property (nonatomic,strong) UIButton * shackButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor   = JX_Color_RGB(255, 255, 255);
    
    [self createButtonTitle:@"请求麦克风权限" action:@selector(actionForAudioAuth) originY:KbuttonHeight];
    [self createButtonTitle:@"请求相机权限" action:@selector(actionForCameraAuth) originY:KbuttonHeight*2];
    [self createButtonTitle:@"请求相册权限" action:@selector(actionForPhotoAlbumAuth) originY:KbuttonHeight*3];
    [self createButtonTitle:@"请求远程通知权限" action:@selector(actionForRmoteNotificationAuth) originY:KbuttonHeight*4];
    [self createButtonTitle:@"请求本地通知权限" action:@selector(actionForLocationNotificationAuth) originY:KbuttonHeight*5];
    NSLog(@"判断推送权限：%d",JX_Device_Permission_Macros_NotificationAuth);
    NSLog(@"判断定位权限：%d",JX_Device_Permission_Macros_LocationAuth);
    [self createButtonTitle:@"请求使用中定位权限" action:@selector(actionForLocationInUseAuth) originY:KbuttonHeight*6];
    [self createButtonTitle:@"请求后台定位权限" action:@selector(actionForLocationAlwaysAuth) originY:KbuttonHeight*7];
    
    self.shackButton = [self createButtonTitle:@"摇动" action:@selector(actionForShack) originY:KbuttonHeight*8];
}

- (UIButton *)createButtonTitle:(NSString *)title action:(SEL)action originY:(CGFloat)originY {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor  = JX_Color_Rand;
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    button.frame    = CGRectMake(0, originY, JX_Layout_Screen_Width, KbuttonHeight);
    [self.view addSubview:button];
    return button;
}
#pragma mark - 麦克风
- (void)actionForAudioAuth {
    [JX_Device JX_Device_Permission_Check_AudioAuth:^(BOOL permission) {
        NSLog(@"弹出麦克风权限权限：%d",permission);
    }];
}
#pragma mark - 相机
- (void)actionForCameraAuth {
    if (JX_Device_Permission_Macros_CameraAuth) {
        [JX_Device JX_Device_Permission_Check_CameraAuth:^(BOOL permission) {
            if (permission) {
                self.imagePickerController.sourceType   = UIImagePickerControllerSourceTypeCamera;
                [self presentViewController:self.imagePickerController animated:YES completion:nil];
            } else {
                NSLog(@"相机权限被拒绝");
            }
        }];
    }
}

#pragma mark - 相册
- (void)actionForPhotoAlbumAuth {
    if (JX_Device_Permission_Macros_PhotoLibraryAuth) {
        [JX_Device JX_Device_Permission_Check_PhotoLibraryAuth:^(BOOL permission) {
            if (permission) {
                self.imagePickerController.sourceType   = UIImagePickerControllerSourceTypePhotoLibrary;
                [self presentViewController:self.imagePickerController animated:YES completion:nil];
            } else {
                NSLog(@"相册权限被拒绝");
            }
        }];
    }
}

#pragma mark - 远程通知
- (void)actionForRmoteNotificationAuth {
    [JX_Device JX_Device_Permission_Check_NotificationAuth:^(BOOL permission) {
        NSLog(@"权限判断提醒：%d",permission);
    }];
}

#pragma mark - 本地通知
- (void)actionForLocationNotificationAuth {
    [JX_System_Delegate JX_Category_Notification_Regist_Local];
}

#pragma mark - 定位中权限
- (void)actionForLocationInUseAuth {
    if (JX_Device_Permission_Macros_LocationAuth) {
        [JX_Device JX_Device_Permission_Check_LocationAuth_InUse:^(BOOL permission) {
            NSLog(@"请求使用中定位权限:%d",permission);
        }];
    }
}

#pragma mark - 后台定位权限
- (void)actionForLocationAlwaysAuth {
    if (JX_Device_Permission_Macros_LocationAuth) {
        [JX_Device JX_Device_Permission_Check_LocationAuth_Always:^(BOOL permission) {
            NSLog(@"请求后台定位权限:%d",permission);
        }];
    }
}

#pragma mark - 摇动
- (void)actionForShack {
    [self.shackButton.layer shake];
}

#pragma mark - UIImagePickerControllerDelegate,UINavigationBarDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    NSLog(@"选中结果");
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    NSLog(@"%@",image);
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIImagePickerController *)imagePickerController {
    if (!_imagePickerController) {
        _imagePickerController  = [[UIImagePickerController alloc] init];
        _imagePickerController.allowsEditing    = NO;
        _imagePickerController.delegate = (id)self;
    }
    return _imagePickerController;
}

@end
