//
//  JXFontMacros.h
//  组件化工程
//
//  Created by 王加祥 on 2019/3/8.
//  Copyright © 2019 JX.Wang. All rights reserved.
//  文件字体大小

#ifndef JXFontMacros_h
#define JXFontMacros_h

/**
 字体大小
 
 @param x 字体大小
 @return 返回字体
 */
#define JX_Font_Size(x)             [UIFont systemFontOfSize:x]


/**
 返回粗体

 @param x 字体大小
 @return 粗体
 */
#define JX_Font_Bold(x)             [UIFont boldSystemFontOfSize:x]


/**
 字体大小

 @param name 字体名称
 @param x 字体大小
 @return 返回字体
 */
#define JX_Font_SizeName(name,x)    [UIFont fontWithName:name size:x]


/**
 获取所有字体

 @return 所以字体
 */
#define JX_Font_Family              [UIFont familyNames]

#define JX_Font_Size_32         JX_Font_Size(32)
#define JX_Font_Size_30         JX_Font_Size(30)
#define JX_Font_Size_28         JX_Font_Size(28)
#define JX_Font_Size_26         JX_Font_Size(26)
#define JX_Font_Size_24         JX_Font_Size(24)
#define JX_Font_Size_22         JX_Font_Size(22)
#define JX_Font_Size_20         JX_Font_Size(20)
#define JX_Font_Size_18         JX_Font_Size(18)
#define JX_Font_Size_16         JX_Font_Size(16)
#define JX_Font_Size_14         JX_Font_Size(14)
#define JX_Font_Size_12         JX_Font_Size(12)
#define JX_Font_Size_10         JX_Font_Size(10)



#endif /* JXFontMacros_h */
