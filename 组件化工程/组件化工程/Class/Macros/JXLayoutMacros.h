//
//  JXLayoutMacros.h
//  组件化工程
//
//  Created by 王加祥 on 2019/3/8.
//  Copyright © 2019 JX.Wang. All rights reserved.
//

#ifndef JXLayoutMacros_h
#define JXLayoutMacros_h


/**
 界面尺寸

 @return 界面尺寸
 */
#define JX_Layout_Screen_Size [[UIScreen mainScreen] bounds].size

/**
 判断是否是iPhone设备
 */
#define JX_Layout_IS_IPHONE ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)

/**
 是否是X的设备（指的是屏幕尺寸）
 */
#define JX_Layout_IS_IPHONEX         (JX_Layout_IS_IPHONE && JX_Layout_Screen_Size.height >= 812.0)


/**
 是否是4,4s的设备（指的是屏幕尺寸）
 */
#define JX_Layout_IS_IPHONE4 (JX_Layout_IS_IPHONE && JX_Layout_Screen_Size.height == 480.0 &&  JX_Layout_Screen_Size.width == 320.0)

/**
 是否是5,5s,5c,SE的设备（指的是屏幕尺寸）
 */
#define JX_Layout_IS_IPHONE5 (JX_Layout_IS_IPHONE && JX_Layout_Screen_Size.height == 568.0 &&  JX_Layout_Screen_Size.width == 320.0)

/**
 是否是6,6s,7,8的设备（指的是屏幕尺寸）
 */
#define JX_Layout_IS_IPHONE6 (JX_Layout_IS_IPHONE && JX_Layout_Screen_Size.height == 667.0 &&  JX_Layout_Screen_Size.width == 375.0)

/**
 是否是6+,6s+,7+,8+的设备（指的是屏幕尺寸）
 */
#define JX_Layout_IS_IPHONE6P (JX_Layout_IS_IPHONE && JX_Layout_Screen_Size.height == 736.0 &&  JX_Layout_Screen_Size.width == 414.0)

/**
 是否是X,Xs的设备（指的是屏幕尺寸）
 */
#define JX_Layout_IS_IPHONEXs (JX_Layout_IS_IPHONE && JX_Layout_Screen_Size.height == 812.0 &&  JX_Layout_Screen_Size.width == 375.0)

/**
 是否是XsMax,Xr的设备（指的是屏幕尺寸）
 */
#define JX_Layout_IS_IPHONEXM (JX_Layout_IS_IPHONE && JX_Layout_Screen_Size.height == 896.0 &&  JX_Layout_Screen_Size.width == 414.0)


/**
 底部TarBar高度
 */
#define JX_Layout_Tabbar_Height                (JX_Layout_IS_IPHONEX ? 83.0 : 49.0)
/**
 状态栏高度
 */
#define JX_Layout_Navigation_Statusbar_Height   (JX_Layout_IS_IPHONEX ? 44.0 : 20.0)

/**
 导航栏高度
 */
#define JX_Layout_Navigation_Height             (JX_Layout_IS_IPHONEX ? 88.0 : 64.0)

/**
 屏幕的宽度
 
 @return 屏宽
 */
#define JX_Layout_Screen_Width JX_Layout_Screen_Size.width

/**
 屏幕的高度
 
 @return 屏高
 */
#define JX_Layout_Screen_Height JX_Layout_Screen_Size.height

#endif /* JXLayoutMacros_h */
