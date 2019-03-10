//
//  JXNullHelper.m
//  组件化工程
//
//  Created by 王加祥 on 2019/3/8.
//  Copyright © 2019 JX.Wang. All rights reserved.
//

#import "JXNullHelper.h"

@implementation JXNullHelper

/**
 判断对象为空对象
 
 @param object 输入对象
 @return 对象是否为空
 */
+(BOOL)JX_Helper_Is_Empty_Id:(id)object
{
    if(object == nil)
    {
        return YES;
    }
    else if([object isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

/**
 判断字典对象是否为字典或者是否为空
 
 @param judgeDictionary 被判断的输入的dic
 @return YES,不是字典类型或者为空字典,NO，是字典类型，不为空
 */
+(BOOL)JX_Helper_Is_Empty_Dictionary:(NSDictionary *)judgeDictionary
{
    if (![judgeDictionary isKindOfClass:[NSDictionary class]]) {
        return YES;
    }
    if (judgeDictionary.count <= 0) {
        return YES;
    }else{
        return NO;
    }
}


/**
 判断数组是否为空
 
 @param judgeArray 被判断的输入
 @return YES:不是数组活为空，NO:不为空
 */
+(BOOL)JX_Helper_Is_Empty_Array:(NSArray *)judgeArray {
    if (![judgeArray isKindOfClass:[NSArray class]]) {
        return YES;
    }
    if (judgeArray.count <= 0) {
        return YES;
    }else{
        return NO;
    }
}
/**
 判断字符串为空字符串或者是否为字符串类型
 
 @param judgeString 判断的字符串
 @return YES：为空字符串或者类型不为字符串，NO：是字符串类型并不为空
 */
+(BOOL)JX_Helper_Is_Empty_String:(NSString *)judgeString
{
    if (![judgeString isKindOfClass:[NSString class]]) {
        return YES;
    }
    if (judgeString == nil || judgeString == NULL) {
        return YES;
    }
    if ([judgeString isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[judgeString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    if ([judgeString isEqualToString:@"null"]) {
        return YES;
    }
    if ([judgeString isEqualToString:@"(null)"]) {
        return YES;
    }
    if ([judgeString isEqualToString:@"<null>"]) {
        return YES;
    }
    return NO;
}


/**
 判断字符串是不是手机号码
 
 @param judgeString 判断的字符串
 @return YES：是手机号码，NO：不是手机号码
 */
+ (BOOL)JX_Helper_Is_PhoneNumber:(NSString *)judgeString
{
    
    // 只判断1开头，11位数字
    NSString *phoneRegex = @"1[0-9]{10}";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:judgeString];
    
}

/**
 判断字符串是不是纯数字
 
 @param judgeString 判断的字符串
 @return YES：是数字，NO：不是数字
 */
+ (BOOL)JX_Helper_Is_Number:(NSString *)judgeString
{
    NSString * regex        = @"(/^[0-9]*$/)";
    
    NSPredicate * pred      = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    BOOL isMatch            = [pred evaluateWithObject:judgeString];
    
    if (isMatch) {
        
        return YES;
        
    }else{
        
        return NO;
        
    }
    
}



/**
 限时输入长度
 
 @param textField 限制输入控件
 @param length 限制输入长度
 @return 限制结果
 */
+ (BOOL)JX_Helper_LimitTextField:(UITextField *)textField length:(NSInteger)length
{
    NSString * toBeString = textField.text;
    
    NSString * lang       = [[[UIApplication sharedApplication] textInputMode] primaryLanguage];
    if ([lang isEqualToString:@"zh-Hans"]) { // 如果输入的是简体中文
        UITextRange * selectRange = [textField markedTextRange];
        // 获取高亮部分
        UITextPosition * position = [textField positionFromPosition:selectRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            if (toBeString.length < length) {
                return YES;
            } else  {
                textField.text = [toBeString substringToIndex:length];
                return YES;
            }
        } else {
            return YES;
        }
    } else { // 中文输入法以外的直接对其进行统计限制即可，不考虑其他情况
        if (toBeString.length < length) {
            return YES;
        } else {
            textField.text = [toBeString substringToIndex:length];
            return YES;
        }
    }
}
@end
