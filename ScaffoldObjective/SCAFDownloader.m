//
//  SCAFDownloader.m
//  ScaffoldObjective
//
//  Created by Stephen Johnson on 3/16/17.
//  Copyright © 2017 Stephen Johnson. All rights reserved.
//

#import "SCAFDownloader.h"
#import "SCAFStoredData.h"

@implementation SCAFDownloader


- (void) login; {
    
    NSURLSession * session = [NSURLSession sharedSession];
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc] init];
    [request setURL: [NSURL URLWithString:@"https://www.google.com"]];
    [request setHTTPMethod:@"GET"];
    [request setHTTPBody:nil];
    [request setHTTPShouldHandleCookies:NO];
    
    
    NSURLSessionTask * task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if([data bytes] != nil) {
            NSLog(@"%s \n%@", (char*)[data bytes], response);
            [[SCAFStoredData sharedInstance] storeValue:@"tokenVal" withKey:@"RSA"];
        }
    }];
    [task resume];
    
}
@end
