//
//  JXColorMacros.h
//  组件化工程
//
//  Created by 王加祥 on 2019/3/8.
//  Copyright © 2019 JX.Wang. All rights reserved.
//  颜色类

#ifndef JXColorMacros_h
#define JXColorMacros_h

/** 随机色 */
#define JX_Color_Rand [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
/**
 根据颜色RGB设置颜色,alpha
 
 @param R 红色色值
 @param G 绿色色值
 @param B 蓝色色值
 @param AL alpha通道值
 @return 返回UIColor
 */
#define JX_Color_RGBA(R,G,B,AL)       [UIColor colorWithRed:(R)/255.0f green:(G)/255.0f blue:(B)/255.0f alpha:(AL)]

/**
 根据颜色RGB设置颜色,alpha默认是1.0f
 
 @param R 红色色值
 @param G 绿色色值
 @param B 蓝色色值
 @return 返回UIColor
 */
#define JX_Color_RGB(R,G,B)          JX_Color_RGBA(R,G,B,1.0)

/**
 根据十六进制色值设置颜色
 
 @param hex 十六进制色值
 @param a alpha通道值
 @return 返回UIColor
 */
#define JX_Color_HEXA(hex,a)    ([UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:a])

/**
 根据十六进制色值设置颜色，alpha默认是1.0f
 
 @param hex 十六进制色值
 @return 返回UIColor
 */
#define JX_Color_HEX(hex)             JX_Color_HEXA(hex,1.0f)

#endif /* JXColorMacros_h */
