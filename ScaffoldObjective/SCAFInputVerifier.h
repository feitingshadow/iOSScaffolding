//
//  SCAFInputVerifier.h
//  ScaffoldObjective
//
//  Created by Stephen Johnson on 3/28/17.
//  Copyright © 2017 Stephen Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>
//Possible to convert helpers that don't need static state to C/C++ file.

@interface SCAFInputVerifier : NSObject

+ (BOOL) getIsEmailValid:(NSString*)email;

@end
