//
//  UIView+JX_Category_View.m
//  组件化工程
//
//  Created by 王加祥 on 2019/3/18.
//  Copyright © 2019 JX.Wang. All rights reserved.
//

#import "UIView+JX_Category_View.h"

@implementation UIView (JX_Category_View)


#pragma mark - Getter

/**
 x位置
 */
- (CGFloat)JX_Category_View_Origin_X {
    return self.frame.origin.x;
}

/**
 y位置
 */
- (CGFloat)JX_Category_View_Origin_Y {
    return self.frame.origin.y;
}

/**
 x center位置
 */
- (CGFloat)JX_Category_View_Mid_X {
    return self.center.x;
}

/**
 y center位置
 */
- (CGFloat)JX_Category_View_Mid_Y {
    return self.center.y;
}

/**
 x 最右位置
 */
- (CGFloat)JX_Category_View_Max_X {
    return self.frame.origin.x+self.frame.size.width;
}

/**
 y 最下位置
 */
- (CGFloat)JX_Category_View_Max_Y {
    return self.frame.origin.y+self.frame.size.height;
}


/**
 高度
 */
- (CGFloat)JX_Category_View_Height {
    return self.frame.size.height;
}

/**
 宽度
 */
- (CGFloat)JX_Category_View_Width {
    return self.frame.size.width;
}


/**
 尺寸
 */
- (CGSize)JX_Category_View_Size {
    return self.frame.size;
}




#pragma mark - Setter
- (void)setJX_Category_View_Origin_X:(CGFloat)JX_Category_View_Origin_X {
    CGRect frame = self.frame;
    frame.origin.x = JX_Category_View_Origin_X;
    self.frame = frame;
}

- (void)setJX_Category_View_Origin_Y:(CGFloat)JX_Category_View_Origin_Y {
    CGRect frame = self.frame;
    frame.origin.y = JX_Category_View_Origin_Y;
    self.frame = frame;
}

- (void)setJX_Category_View_Mid_X:(CGFloat)JX_Category_View_Mid_X {
    self.center = CGPointMake(JX_Category_View_Mid_X, self.center.y);
}

- (void)setJX_Category_View_Mid_Y:(CGFloat)JX_Category_View_Mid_Y {
    self.center = CGPointMake(self.center.x, JX_Category_View_Mid_Y);
}

- (void)setJX_Category_View_Max_X:(CGFloat)JX_Category_View_Max_X {
    CGRect frame = self.frame;
    frame.origin.x = JX_Category_View_Max_X - self.frame.size.width;
    self.frame = frame;
}

- (void)setJX_Category_View_Max_Y:(CGFloat)JX_Category_View_Max_Y {
    CGRect frame = self.frame;
    frame.origin.y = JX_Category_View_Max_Y - self.frame.size.height;
    self.frame = frame;
}

- (void)setJX_Category_View_Height:(CGFloat)JX_Category_View_Height {
    CGRect frame = self.frame;
    frame.size.height = JX_Category_View_Height;
    self.frame = frame;
}

- (void)setJX_Category_View_Width:(CGFloat)JX_Category_View_Width {
    CGRect frame = self.frame;
    frame.size.width = JX_Category_View_Width;
    self.frame = frame;
}

- (void)setJX_Category_View_Size:(CGSize)JX_Category_View_Size {
    CGRect frame = self.frame;
    frame.size = JX_Category_View_Size;
    self.frame = frame;
}


@end
