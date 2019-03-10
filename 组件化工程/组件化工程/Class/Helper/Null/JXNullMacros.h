//
//  JXNullMacros.h
//  组件化工程
//
//  Created by 王加祥 on 2019/3/8.
//  Copyright © 2019 JX.Wang. All rights reserved.
//  判空类

#ifndef JXNullMacros_h
#define JXNullMacros_h

#import "JXNullHelper.h"


/**
 判断对象是否为空

 @param x 对象
 @return YES:为空，NO:不为空
 */
#define JX_Null_Id(x) [JXNullHelper JX_Helper_Is_Empty_Id:x]


/**
 判断是否为空字符串
 
 @param x 字符串
 @return YES:为空，NO:不为空
 */
#define JX_Null_String(x) [JXNullHelper JX_Helper_Is_Empty_String:x]

/**
 判断是否为空字典
 
 @param x 字典
 @return YES:为空，NO:不为空
 */
#define JX_Null_Dictionary(x) [JXNullHelper JX_Helper_Is_Empty_Dictionary:x]

/**
 判断是否为空数组
 
 @param x 数组
 @return YES:为空，NO:不为空
 */
#define JX_Null_Array(x) [JXNullHelper JX_Helper_Is_Empty_Array:x]

/**
 判断是否为手机号
 
 @param x 手机号
 @return YES:手机号，NO:不是合法的手机号
 */
#define JX_Null_PhoneNumber(x) [JXNullHelper JX_Helper_Is_PhoneNumber:x]

/**
 判断是否为数字
 
 @param x 数字
 @return YES:为空，NO:不为空
 */
#define JX_Null_Number(x) [JXNullHelper JX_Helper_Is_Number:x]


/**
 限制输入

 @param textField 输入框
 @param x 限制长度
 @return YES:输入完成，NO:正在输入
 */
#define JX_Null_LimitTextField(textField,x) [JXNullHelper JX_Helper_LimitTextField:textField length:x]

#endif /* JXNullMacros_h */
