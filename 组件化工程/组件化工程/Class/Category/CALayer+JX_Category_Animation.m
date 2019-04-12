//
//  CALayer+JX_Category_Animation.m
//  组件化工程
//
//  Created by 王加祥 on 2019/3/18.
//  Copyright © 2019 JX.Wang. All rights reserved.
//

#import "CALayer+JX_Category_Animation.h"

@implementation CALayer (JX_Category_Animation)


/*
 *  摇动
 */
-(void)shake{
    
    CAKeyframeAnimation *kfa = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    
    CGFloat s = 16;
    
    kfa.values = @[@(-s),@(0),@(s),@(0),@(-s),@(0),@(s),@(0)];
    
    //时长
    kfa.duration = .1f;
    
    //重复
    kfa.repeatCount =2;
    
    //移除
    kfa.removedOnCompletion = YES;
    
    [self addAnimation:kfa forKey:@"shake"];
}

@end
