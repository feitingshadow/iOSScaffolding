//
//  SCAFStoredData.h
//  ScaffoldObjective
//
//  Created by Stephen Johnson on 3/16/17.
//  Copyright © 2017 Stephen Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCAFStoredData : NSObject

+ (SCAFStoredData*) sharedInstance;

- (BOOL) storeValue:(id)obj withKey:(NSString*)k; //Test for duplicates?
- (BOOL) storeValue:(id)obj withKey:(NSString*)k overrideIfExisting:(BOOL)overrides;
- (id) getValueWithKey:(NSString*)k defaultingTo:(id)defaultVal;
- (id) getValueWithKey:(NSString*)k;

@end
