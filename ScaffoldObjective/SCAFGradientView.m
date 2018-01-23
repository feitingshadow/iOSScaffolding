//
//  SCAFGradientView.m
//  ScaffoldObjective
//
//  Created by Stephen Johnson on 3/28/17.
//  Copyright © 2017 Stephen Johnson. All rights reserved.
//

#import "SCAFGradientView.h"
#import <CoreGraphics/CoreGraphics.h>
@implementation SCAFGradientView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    if(self.fromColor != nil) {
        if(self.toColor == nil) {
          self.toColor = self.backgroundColor;
        }
    }
    if (self.toColor != nil) {
        if(self.fromColor == nil) {
            self.fromColor = self.backgroundColor;
        }

    }
    
    if(self.fromColor != nil && self.toColor != nil) {
        CGContextRef contextRef = UIGraphicsGetCurrentContext();
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        
        CGFloat pointLocations[2] = {0.0f, 1.0f};
        
        CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)@[(id)self.fromColor.CGColor, (id)self.toColor.CGColor], pointLocations);
        
        CGPoint startPt = CGPointMake(0,0);
        CGPoint endPt = self.isHorizontal ? CGPointMake(self.bounds.size.width,0) : CGPointMake(0, self.bounds.size.height);
        
        CGContextDrawLinearGradient(contextRef, gradient, startPt, endPt, kCGGradientDrawsBeforeStartLocation);
        
        CFRelease(gradient);
        CFRelease(colorSpace);
    }
}


@end
