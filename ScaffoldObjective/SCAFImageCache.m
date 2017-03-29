//
//  SCAFImageCache.m
//  ScaffoldObjective
//
//  Created by Stephen Johnson on 3/16/17.
//  Copyright © 2017 Stephen Johnson. All rights reserved.
//

#import "SCAFImageCache.h"

@interface SCAFImageCache ()
@property (nonatomic, retain) NSMutableDictionary * cache;
@end

@implementation SCAFImageCache

+ (SCAFImageCache*) sharedInstance;
{
    static SCAFImageCache * _sharedInstance = nil;
    if(_sharedInstance == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _sharedInstance = [[self alloc] init];
            [_sharedInstance internalSetup];
        });
    }
    return _sharedInstance;
}

- (void) internalSetup {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(memoryWarning:) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
}

- (void) memoryWarning:(NSNotification*)notification; {
    [self clearCache];
}

- (UIImage*) getImageWithName:(NSString*)imageName {
    UIImage * image = self.cache[imageName];
    if (image == nil) {
        image = [UIImage imageWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageName ofType:nil]]];
    }
    return image;
}

- (void) getDownloadedImageWithPath:(NSString*)path completion:( void (^)(UIImage*) )completion;
{
    if(self.cache[path] != nil)
    {
        completion((UIImage*)self.cache[path]);
    }
    else
    {
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
        dispatch_async(queue, ^{
            NSData * tempData = [NSData dataWithContentsOfURL:[NSURL URLWithString:path]];
            dispatch_async(dispatch_get_main_queue(), ^{
                UIImage * image = [UIImage imageWithData:tempData];
                if(image)
                {
                    self.cache[path] = image;
                }
                completion(image);
            });
        });
    }
}

- (void) clearCache;
{
    [self.cache removeAllObjects];
}


- (oneway void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
