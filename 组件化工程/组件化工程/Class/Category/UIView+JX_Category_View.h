//
//  UIView+JX_Category_View.h
//  组件化工程
//
//  Created by 王加祥 on 2019/3/18.
//  Copyright © 2019 JX.Wang. All rights reserved.
//  尺寸

#import <UIKit/UIKit.h>

@interface UIView (JX_Category_View)

/**
 x位置
 */
@property (nonatomic, assign) CGFloat JX_Category_View_Origin_X;

/**
 y位置
 */
@property (nonatomic, assign) CGFloat JX_Category_View_Origin_Y;

/**
 x center位置
 */
@property (nonatomic, assign) CGFloat JX_Category_View_Mid_X;

/**
 y center位置
 */
@property (nonatomic, assign) CGFloat JX_Category_View_Mid_Y;

/**
 x 最右位置
 */
@property (nonatomic, assign) CGFloat JX_Category_View_Max_X;

/**
 y 最下位置
 */
@property (nonatomic, assign) CGFloat JX_Category_View_Max_Y;


/**
 高度
 */
@property (nonatomic, assign) CGFloat JX_Category_View_Height;

/**
 宽度
 */
@property (nonatomic, assign) CGFloat JX_Category_View_Width;

/**
 尺寸
 */
@property (nonatomic, assign) CGSize JX_Category_View_Size;



@end


