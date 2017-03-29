//
//  SCAFImageCache.h
//  ScaffoldObjective
//
//  Created by Stephen Johnson on 3/16/17.
//  Copyright © 2017 Stephen Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SCAFImageCache : NSObject

+ (SCAFImageCache*) sharedInstance;

- (UIImage*) getImageWithName:(NSString*)imageName;
- (void) getDownloadedImageWithPath:(NSString*)path completion:( void (^)(UIImage*) )completion;

- (void) clearCache;

@end
