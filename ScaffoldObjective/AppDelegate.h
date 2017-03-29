//
//  AppDelegate.h
//  ScaffoldObjective
//
//  Created by Stephen Johnson on 3/29/17.
//  Copyright © 2017 Stephen Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

