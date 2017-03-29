//
//  SCAFWrappingView.m
//  ScaffoldObjective
//
//  Created by Stephen Johnson on 3/28/17.
//  Copyright © 2017 Stephen Johnson. All rights reserved.
//

#import "SCAFWrappingView.h"

@implementation SCAFWrappingView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void) layoutSubviews {
    [super layoutSubviews];
    
    CGFloat lastX = 0;
    CGFloat lastY = 0;
    CGFloat lastMaxBottom = 0;
//    CGFloat lastMaxRight = 0;
    
    UIView * subV = nil;
    
    for (uint i = 0; i < self.subviews.count; i++) {
        BOOL hasNextSubView = i < self.subviews.count - 1;
        
        subV = self.subviews[i];
        if(self.isHorizontal) {
            subV.frame = CGRectMake(lastX + subV.leftMargin, lastY + subV.topMargin, subV.frame.size.width, subV.frame.size.height);
            lastX = subV.right + subV.rightMargin;
            lastMaxBottom = MAX(lastMaxBottom, subV.bottom + subV.bottomMargin);
            if(hasNextSubView) {
                UIView * next = self.subviews[i+1];
                if (self.bounds.size.width < lastX + next.frame.size.width + next.leftMargin + next.rightMargin) {
                    lastX = 0;
                    lastY = lastMaxBottom;
                }
            }
        }
        else {
            //todo (after testing horizontal view)
            subV.frame = CGRectMake(lastX + subV.leftMargin, lastY + subV.topMargin, subV.frame.size.width, subV.frame.size.height);
            lastY = subV.bottom + subV.bottomMargin;
        }
    }
}

@end
