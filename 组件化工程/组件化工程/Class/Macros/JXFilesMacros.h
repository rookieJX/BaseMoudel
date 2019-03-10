//
//  JXFilesMacros.h
//  组件化工程
//
//  Created by 王加祥 on 2019/3/8.
//  Copyright © 2019 JX.Wang. All rights reserved.
//  获取文件路径

#ifndef JXFilesMacros_h
#define JXFilesMacros_h

/**
 获取沙盒 Document路径
 
 @param NSDocumentDirectory NSDocumentDirectory
 @param NSUserDomainMask NSUserDomainMask
 @param YES YES
 @return 沙盒 Document路径
 */
#define JX_File_DocumentPath         [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

/**
 获取Library的目录路径
 
 @param NSLibraryDirectory NSLibraryDirectory description
 @param NSUserDomainMask NSUserDomainMask description
 @param YES YES description
 @return 获取Library的目录路径
 */
#define JX_File_LibaryPath           [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject]

/**
 获取沙盒 Cache 路径
 
 @param NSCachesDirectory NSCachesDirectory description
 @param NSUserDomainMask NSUserDomainMask description
 @param YES YES description
 @return 获取沙盒 Cache 路径
 */
#define JX_File_CachePath            [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

/**
 获取沙盒 temp 路径(注:iPhone 重启会清空)
 
 @param NSCachesDirectory NSCachesDirectory
 @param NSUserDomainMask NSUserDomainMask
 @param YES YES
 @return 获取沙盒 temp 路径
 */
#define JX_File_TempPath             NSTemporaryDirectory()

#endif /* JXFilesMacros_h */
