//
//  UIView+SCAFView.m
//  ScaffoldObjective
//
//  Created by Stephen Johnson on 3/28/17.
//  Copyright © 2017 Stephen Johnson. All rights reserved.
//

#import "UIView+SCAFView.h"
#import "NSObject+SCAFAssociatedValues.h"

static NSString * const key_LeftMargin = @"leftMargin";
static NSString * const key_RightMargin = @"rightMargin";
static NSString * const key_BottomMargin = @"bottomMargin";
static NSString * const key_TopMargin = @"topMargin";

@implementation UIView (SCAFView)

@dynamic leftMargin;
@dynamic rightMargin;
@dynamic bottomMargin;
@dynamic topMargin;

@dynamic x, y, height, width, bottom, right;


- (void) setLeftMargin:(CGFloat)m {
    [NSObject setAssociatedFloat:m withKey:key_LeftMargin];
}

- (CGFloat) leftMargin {
    return [NSObject getAssociatedFloatFromKey:key_LeftMargin];
}

- (void) setRightMargin:(CGFloat)m {
    [NSObject setAssociatedFloat:m withKey:key_RightMargin];
}

- (CGFloat) rightMargin {
    return [NSObject getAssociatedFloatFromKey:key_RightMargin];
}

- (void) setBottomMargin:(CGFloat)m {
    [NSObject setAssociatedFloat:m withKey:key_BottomMargin];
}

- (CGFloat) bottomMargin {
    return [NSObject getAssociatedFloatFromKey:key_BottomMargin];
}

- (void) setTopMargin:(CGFloat)m {
    [NSObject setAssociatedFloat:m withKey:key_TopMargin];
}

- (CGFloat) topMargin {
    return [NSObject getAssociatedFloatFromKey:key_TopMargin];
}

- (void) setX:(CGFloat)x {
    self.frame = CGRectMake(x, self.frame.origin.y, self.bounds.size.width, self.bounds.size.height);
}

- (CGFloat) x {
    return self.frame.origin.x;
}

- (void) setY:(CGFloat)y {
    self.frame = CGRectMake(self.frame.origin.x, y, self.bounds.size.width, self.bounds.size.height);
}

- (CGFloat) y {
    return self.frame.origin.y;
}

- (void) setWidth:(CGFloat)w {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, w, self.bounds.size.height);
}

- (CGFloat) width {
    return self.bounds.size.width;
}

- (void) setHeight:(CGFloat)h {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.bounds.size.width, h);
}

- (CGFloat) height {
    return self.bounds.size.height;
}

- (void) setBottom:(CGFloat)b {
    self.frame = CGRectMake(self.frame.origin.x, b - self.bounds.size.height, self.bounds.size.width, self.bounds.size.height);
}

- (CGFloat) bottom {
    return self.frame.origin.y + self.bounds.size.height;
}

- (void) setRight:(CGFloat)r {
    self.frame = CGRectMake( r - self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.bounds.size.height);
}

- (CGFloat) right {
    return self.frame.origin.x + self.bounds.size.width;
}

@end
