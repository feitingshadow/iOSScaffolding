//
//  SCAFAnimationHelper.h
//  ScaffoldObjective
//
//  Created by Stephen Johnson on 3/28/17.
//  Copyright © 2017 Stephen Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCAFAnimationHelper : UIView

+ (void) MoveView:(UIView*)v leftBy:(CGFloat)xPixels inTime:(CGFloat)s;
+ (void) MoveView:(UIView*)v leftTo:(CGFloat)xPixels inTime:(CGFloat)s;

@end
