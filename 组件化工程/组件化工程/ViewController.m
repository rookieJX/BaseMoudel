//
//  ViewController.m
//  组件化工程
//
//  Created by 王加祥 on 2019/3/8.
//  Copyright © 2019 JX.Wang. All rights reserved.
//

#import "ViewController.h"
#import "JXFontMacros.h"
#import "JXLayoutMacros.h"
#import "JXNullHelper.h"
#import "JXMacrosHeader.h"
#import "JXDeviceHelper.h"
#import "JXHelperHeader.h"

#import <Photos/Photos.h>

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationBarDelegate>
@property (nonatomic,strong) UIImagePickerController *imagePickerController;
@property (nonatomic,strong) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor   = JX_Color_Rand;
    
    [JX_Device JX_Device_Permission_Check_AudioAuth:^(BOOL permission) {
        NSLog(@"弹出麦克风权限权限：%d",permission);
        if (!permission) {
            JX_Device_Macros_Open_Setting;
        }
    }];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor  = JX_Color_Rand;
    [button setTitle:@"相机" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(actionForChoosePhotoFromAlbum) forControlEvents:UIControlEventTouchUpInside];
    button.frame    = CGRectMake(0, 0, JX_Layout_Screen_Width, JX_Layout_Navigation_Height);
    [self.view addSubview:button];
    
    self.imageView = [[UIImageView alloc] init];
    self.imageView.frame    = CGRectMake(30, JX_Layout_Navigation_Height, JX_Layout_Screen_Width-60, 200);
    [self.view addSubview:self.imageView];
    
}

#pragma mark - 相机
- (void)actionForChoosePhotoFromAlbum {
//    if (JX_Device_Permission_Macros_PhotoLibraryAuth) {
//        [JX_Device JX_Device_Permission_Check_PhotoLibraryAuth:^(BOOL permission) {
//            if (permission) {
//                self.imagePickerController.sourceType   = UIImagePickerControllerSourceTypePhotoLibrary;
//                [self presentViewController:self.imagePickerController animated:YES completion:nil];
//            }
//        }];
//    }
    
    if (JX_Device_Permission_Macros_CameraAuth) {
        [JX_Device JX_Device_Permission_Check_CameraAuth:^(BOOL permission) {
            if (permission) {
                self.imagePickerController.sourceType   = UIImagePickerControllerSourceTypeCamera;
                [self presentViewController:self.imagePickerController animated:YES completion:nil];
            } else {
                NSLog(@"被拒绝");
            }
        }];
        

    }
}


#pragma mark - UIImagePickerControllerDelegate,UINavigationBarDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    NSLog(@"选中结果");
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    self.imageView.image    = image;
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
