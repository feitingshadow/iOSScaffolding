//
//  SCAFStackingView.m
//  ScaffoldObjective
//
//  Created by Stephen Johnson on 3/28/17.
//  Copyright © 2017 Stephen Johnson. All rights reserved.
//
// TODO: Add ordering to views

#import "SCAFStackingView.h"

@implementation SCAFStackingView

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self) {
        
    }
    return self;
}

- (void) awakeFromNib {
    [super awakeFromNib];
    
}

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
    
    //Add Align, left/right/ctr
    for (UIView * subV in self.subviews) {
    
        if(self.isHorizontal) {
            subV.frame = CGRectMake(lastX + subV.leftMargin, lastY + subV.topMargin, subV.frame.size.width, subV.frame.size.height);
            lastX = subV.right + subV.rightMargin;
        }
        else {
            subV.frame = CGRectMake(lastX + subV.leftMargin, lastY + subV.topMargin, subV.frame.size.width, subV.frame.size.height);
            lastY = subV.bottom + subV.bottomMargin;
        }
    }
}

@end
