//
//  UIView+SCAFAssociatedValues.h
//  ScaffoldObjective
//
//  Created by Stephen Johnson on 3/28/17.
//  Copyright © 2017 Stephen Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (SCAFAssociatedValues)

+ (id) getAssociatedValueFromKey:(NSString*)key;
+ (void) setAssociatedValue:(id)val withKey:(NSString*)key;

+ (NSNumber*) getAssociatedNSNumberFromKey:(NSString*)key;
+ (void) setAssociatedNSNumber:(NSNumber*)val withKey:(NSString*)key;

+ (CGFloat) getAssociatedFloatFromKey:(NSString*)key;
+ (void) setAssociatedFloat:(CGFloat)val withKey:(NSString*)key;

@end
