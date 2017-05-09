//
//  SCAFStoredData.m
//  ScaffoldObjective
//
//  Created by Stephen Johnson on 3/16/17.
//  Copyright © 2017 Stephen Johnson. All rights reserved.
//

#import "SCAFStoredData.h"

static NSString * const kStoredDataFilename = @"SCAFAppdata.plist";

@interface SCAFStoredData () {
    
}

@property (nonatomic, copy) NSURL * docsDirURL;
@property (nonatomic, copy) NSString * fullPathString;
@property (nonatomic, retain) NSMutableDictionary * dataStoreDict;

@end


@implementation SCAFStoredData

+ (SCAFStoredData*) sharedInstance {
    static SCAFStoredData * _sharedInstance = nil;
    if(_sharedInstance == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _sharedInstance = [[self alloc] init];
            [_sharedInstance setupSelf];
        });
    }
    return _sharedInstance;
}


- (BOOL) setupSelf { //Test this with custom objects and in general. If custom NSCoding obj fails, use NSData.
    
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSLocalDomainMask, NO);
    self.docsDirURL = (NSURL*)[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask][0];
    self.fullPathString = [self.docsDirURL.path stringByAppendingPathComponent:kStoredDataFilename];
    
    if([[NSFileManager defaultManager] fileExistsAtPath:self.fullPathString]) {
        self.dataStoreDict = [NSKeyedUnarchiver unarchiveObjectWithFile:self.fullPathString];

    } else {
        self.dataStoreDict = [[NSMutableDictionary alloc] init];
        [self save];
    }
    
    return (self.dataStoreDict != nil);
}

- (BOOL) save { //returns false if it fails.
    return [NSKeyedArchiver archiveRootObject:self.dataStoreDict toFile:self.fullPathString];
}

- (BOOL) storeValue:(id)obj withKey:(NSString*)k; //Test for duplicates?
{
    return [self storeValue:obj withKey:k overrideIfExisting:YES];
}

- (BOOL) storeValue:(id)obj withKey:(NSString*)k overrideIfExisting:(BOOL)overrides;
{
    if(!overrides && [self getValueWithKey:k]) {
        return NO;
    }
    
    self.dataStoreDict[k] = obj;
    return [self save];
}

- (id) getValueWithKey:(NSString*)k defaultingTo:(id)defaultVal;
{
    id val = self.dataStoreDict[k];
    if(val == nil) {
        val = defaultVal;
    }
    return val;
}

- (id) getValueWithKey:(NSString*)k;
{
    return [self getValueWithKey:k defaultingTo:nil];
}

@end









