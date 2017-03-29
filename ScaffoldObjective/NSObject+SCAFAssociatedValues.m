//
//  UIView+SCAFAssociatedValues.m
//  ScaffoldObjective
//
//  Created by Stephen Johnson on 3/28/17.
//  Copyright © 2017 Stephen Johnson. All rights reserved.
//

#import "NSObject+SCAFAssociatedValues.h"
#import <objc/runtime.h>

@implementation NSObject (SCAFAssociatedValues)

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (void) setAssociatedValue:(id)val withKey:(NSString*)key;
{
    objc_setAssociatedObject(self, key.UTF8String, val, OBJC_ASSOCIATION_RETAIN);
}

+ (id) getAssociatedValueFromKey:(NSString*)key;
{
    return objc_getAssociatedObject(self, key.UTF8String);
}

+ (NSNumber*) getAssociatedNSNumberFromKey:(NSString*)key;
{
    return (NSNumber*)[self getAssociatedValueFromKey:key];
}

+ (void) setAssociatedNSNumber:(NSNumber*)val withKey:(NSString*)key;
{
    [self setAssociatedValue:val withKey:key];
}

+ (CGFloat) getAssociatedFloatFromKey:(NSString*)key;
{
    return [[self getAssociatedNSNumberFromKey:key] floatValue];
}

+ (void) setAssociatedFloat:(CGFloat)val withKey:(NSString*)key;
{
    [self setAssociatedNSNumber:@(val) withKey:key];
}

@end
