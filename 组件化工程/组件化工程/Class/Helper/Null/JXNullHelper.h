//
//  JXNullHelper.h
//  组件化工程
//
//  Created by 王加祥 on 2019/3/8.
//  Copyright © 2019 JX.Wang. All rights reserved.
//  判断空类文件

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JXNullHelper : NSObject

/**
 判断对象为空对象
 
 @param object 输入对象
 @return 对象是否为空
 */
+(BOOL)JX_Helper_Is_Empty_Id:(id)object;

/**
 判断字典对象是否为字典或者是否为空
 
 @param judgeDictionary 被判断的输入的dic
 @return YES,不是字典类型或者为空字典,NO，是字典类型，不为空
 */
+(BOOL)JX_Helper_Is_Empty_Dictionary:(NSDictionary *)judgeDictionary;


/**
 判断数组是否为空

 @param judgeArray 被判断的输入
 @return YES:不是数组活为空，NO:不为空
 */
+(BOOL)JX_Helper_Is_Empty_Array:(NSArray *)judgeArray;

/**
 判断字符串为空字符串或者是否为字符串类型
 
 @param judgeString 判断的字符串
 @return YES：为空字符串或者类型不为字符串，NO：是字符串类型并不为空
 */
+(BOOL)JX_Helper_Is_Empty_String:(NSString *)judgeString;


/**
 判断字符串是不是手机号码
 
 @param judgeString 判断的字符串
 @return YES：是手机号码，NO：不是手机号码
 */
+ (BOOL)JX_Helper_Is_PhoneNumber:(NSString *)judgeString;

/**
 判断字符串是不是纯数字
 
 @param judgeString 判断的字符串
 @return YES：是数字，NO：不是数字
 */
+ (BOOL)JX_Helper_Is_Number:(NSString *)judgeString;

/**
 限时输入长度
 
 @param textField 限制输入控件
 @param length 限制输入长度
 @return 限制结果
 */
+ (BOOL)JX_Helper_LimitTextField:(UITextField *)textField length:(NSInteger)length;

@end


