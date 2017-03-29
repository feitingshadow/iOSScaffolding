//
//  SCAFInputVerifier.m
//  ScaffoldObjective
//
//  Created by Stephen Johnson on 3/28/17.
//  Copyright © 2017 Stephen Johnson. All rights reserved.
//

#import "SCAFInputVerifier.h"

@implementation SCAFInputVerifier

+ (BOOL) getIsEmailValid:(NSString*)email;
{
    if(email != nil) {
        
        NSArray * splitByAtArray = [email componentsSeparatedByString:@"@"];
        if(splitByAtArray.count == 2) {
            NSString * afterAtString = (NSString*)splitByAtArray[1];
            NSArray * splitByDotsArray = [afterAtString componentsSeparatedByString:@"."];
            if(splitByDotsArray.count >= 2) {
                return YES;
            }
        }
    }
    return NO;
}

@end
