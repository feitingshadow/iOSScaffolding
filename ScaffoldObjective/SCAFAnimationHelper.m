//
//  SCAFAnimationHelper.m
//  ScaffoldObjective
//
//  Created by Stephen Johnson on 3/28/17.
//  Copyright © 2017 Stephen Johnson. All rights reserved.
//

#import "SCAFAnimationHelper.h"

@implementation SCAFAnimationHelper

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (void) MoveView:(UIView*)v leftBy:(CGFloat)xPixels inTime:(CGFloat)s;
{
    [UIView animateWithDuration:s delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        v.frame = CGRectMake(v.frame.origin.x - xPixels, v.frame.origin.y, v.frame.size.width, v.frame.size.height);
    } completion:^(BOOL finished) {
    }];
}

+ (void) MoveView:(UIView*)v leftTo:(CGFloat)xPixels inTime:(CGFloat)s;
{
    [UIView animateWithDuration:s delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        v.frame = CGRectMake(xPixels, v.frame.origin.y, v.frame.size.width, v.frame.size.height);
    } completion:^(BOOL finished) {
    }];
}

@end
