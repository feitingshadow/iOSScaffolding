//
//  SCAFNotificationsManager.m
//  ScaffoldObjective
//
//  Created by Stephen Johnson on 3/16/17.
//  Copyright © 2017 Stephen Johnson. All rights reserved.
//

#import "SCAFNotificationsManager.h"
#import <UserNotifications/UserNotifications.h>
#import <UserNotificationsUI/UserNotificationsUI.h>

@interface SCAFNotificationsManager ()

@property (nonatomic, retain) UNUserNotificationCenter * defaultCenter;

@end
@implementation SCAFNotificationsManager

+ (SCAFNotificationsManager*) sharedInstance {
    static SCAFNotificationsManager * _sharedInstance = nil;
    if(_sharedInstance == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _sharedInstance = [[SCAFNotificationsManager alloc] init];
            [_sharedInstance internalSetup];
        });
    }
    return _sharedInstance;
}

- (instancetype) init {
    self = [super init];
    if (self)
    {
        
    }
    return self;
}
 //getNotificationSettingsWithCompletionHandler: (create function to call this every run to see changes.
- (void) internalSetup {
    self.defaultCenter = [UNUserNotificationCenter currentNotificationCenter];
}

//edit privacy in PLIST to allow request access in iOS 10+
- (void) requestPermissionsForSound:(BOOL) soundPermission badge:(BOOL)badgePermission andAlert:(BOOL)alertPermission;
{
    int permissions = soundPermission ?                UNAuthorizationOptionSound  : 0;
        permissions = badgePermission ? (permissions | UNAuthorizationOptionBadge) : permissions;
        permissions = alertPermission ? (permissions | UNAuthorizationOptionAlert) : permissions;
    
    [self.defaultCenter requestAuthorizationWithOptions:permissions completionHandler:^(BOOL granted, NSError * _Nullable error) {
        
    }];

    //Categories have custom actions and config ability. Not required. Custom Dismiss = dismiss with handler.
    UNNotificationCategory * cat = [UNNotificationCategory categoryWithIdentifier:@"BasicNotification" actions:@[UNNotificationDismissActionIdentifier] intentIdentifiers:@[] options:UNNotificationCategoryOptionNone];
    //Categories can have 4 actions. They are just up to 4 buttons on the notification, titles/callbacks.
    //Text input is possible as an action, too.
    //4 Display but less if banner
    
    [self.defaultCenter setNotificationCategories:[NSSet setWithObject:cat]];
    
    
}

- (void) clearAllPendingNotifications; {
        [self.defaultCenter removeAllPendingNotificationRequests];
}

- (void) createNotificationWithTitle:(NSString*) t message:(NSString*)msg fireDate:(NSDate*)fireDate;
{
    
}

- (void) clearAllDisplayingNOtifications;
{
    __weak SCAFNotificationsManager * weakSelf = self;
    [self handleCurrentlyDisplayingNotificationsWithHandler:^(NSArray<UNNotification *> * _Nonnull notifications) {
        [weakSelf.defaultCenter removeAllDeliveredNotifications];
    }];
}

- (void) handleCurrentlyDisplayingNotificationsWithHandler:( void (^)(NSArray<UNNotification *> * _Nonnull notifications))handler; //Displayed and stale by now
{
    
    [self.defaultCenter getDeliveredNotificationsWithCompletionHandler:handler];
//    [self.defaultCenter getDeliveredNotificationsWithCompletionHandler:^(NSArray<UNNotification *> * _Nonnull notifications) {
//    }];
}

- (void) testNotification; // notifications even.
{
    UNMutableNotificationContent* content = [[UNMutableNotificationContent alloc] init];
    content.title = [NSString localizedUserNotificationStringForKey:@"Wake up!" arguments:nil];
    content.body = [NSString localizedUserNotificationStringForKey:@"Rise and shine! It's morning time!"
                                                         arguments:nil];
//    content.sound = [UNNotificationSound defaultSound]; //[soundNamed:];///
    
//    content.categoryIdentifier = @"CustomCategoryIdentifier";
    // add categories if custom actions, no need for simple tests

    //Triggers can have location/geofence, calendar, and time interval
    
    // Configure the trigger for a 7am wakeup.
    NSDateComponents* date = [[NSDateComponents alloc] init];
    date.hour = 7;
    date.minute = 0;
    UNCalendarNotificationTrigger* trigger = [UNCalendarNotificationTrigger
                                              triggerWithDateMatchingComponents:date repeats:NO];
    
    // Create the request object.
    UNNotificationRequest* request = [UNNotificationRequest
                                      requestWithIdentifier:@"MorningAlarm" content:content trigger:trigger];
    
    UNUserNotificationCenter* center = [UNUserNotificationCenter currentNotificationCenter];
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
    
}
@end
