//
//  AppDelegate.m
//  BlogApp
//
//  Created by Mac on 21/11/2016.
//  Copyright (c) 2016 Young Decade. All rights reserved.
//

#import "AppDelegate.h"
#import "Start_VC.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "CategoriesViewController.h"
#import <OneSignal/OneSignal.h>

@interface AppDelegate ()

@property (nonatomic, retain) UINavigationController *navigationController;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    [FBSDKLoginButton class];
    [self registerForNotifications];
    userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:@"pref_crpped_img"];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // [self create_notification];
    
    //    if ([[pref valueForKey:@"pref_fb_check"]isEqualToString:@"sushil"])
    //    {
    //        CategoriesViewController*  myView =[[CategoriesViewController alloc]initWithNibName:@"CategoriesViewController" bundle:nil];
    //
    //
    //        nc=[[UINavigationController alloc]initWithRootViewController:myView];
    //    }
    //    else
    //    {
    Start_VC *myView = [[Start_VC alloc] initWithNibName:@"Start_VC" bundle:nil];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:myView];
    // }
    self.window.rootViewController = self.navigationController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    // Replace '11111111-2222-3333-4444-0123456789ab' with your OneSignal App ID.
    [OneSignal initWithLaunchOptions:launchOptions
                               appId:@"94ef1444-e2f8-4fc0-a505-3501a076d201"
            handleNotificationAction:nil
                            settings:@{kOSSettingsKeyAutoPrompt: @false}];
    OneSignal.inFocusDisplayType = OSNotificationDisplayTypeNotification;
    
    // Recommend moving the below line to prompt for push after informing the user about
    //   how your app will use them.
    [OneSignal promptForPushNotificationsWithUserResponse:^(BOOL accepted) {
        NSLog(@"User accepted notifications: %d", accepted);
    }];
    
    // Call syncHashedEmail anywhere in your iOS app if you have the user's email.
    // This improves the effectiveness of OneSignal's "best-time" notification scheduling feature.
    // [OneSignal syncHashedEmail:userEmail];
    
    return YES;
}

- (void)registerForNotifications {
    [[UIApplication sharedApplication] registerUserNotificationSettings:  [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound) categories:nil]];
    [[UIApplication sharedApplication] registerForRemoteNotifications];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    userDefaults=[NSUserDefaults standardUserDefaults];
    NSString * token = [NSString stringWithFormat:@"%@", deviceToken];
    //Format token as you need:
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    token = [token stringByReplacingOccurrencesOfString:@">" withString:@""];
    token = [token stringByReplacingOccurrencesOfString:@"<" withString:@""];
//    NSLog(@"%@",token);
    NSString *str_token=[NSString stringWithFormat:@"%@",token];
    [userDefaults setObject:str_token forKey:@"pref_token"];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"Error registering notification: %@",error);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber: 0];
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    NSLog(@"Remote notification received, user info: %@",userInfo);
    //
    //    NSArray *ARR_USER_INFO=[[NSArray alloc]init];
    //
    //    ARR_USER_INFO=[userInfo objectForKey:@"aps"];
    //    NSLog(@"msg---%@",[ARR_USER_INFO valueForKey:@"msg"]);
    //
    //    STR_MSG=[NSString stringWithFormat:@"%@",[ARR_USER_INFO valueForKey:@"msg"]];
    //
    //    PREF=[NSUserDefaults standardUserDefaults];
    if (application.applicationState == UIApplicationStateActive) {
        NSString *cancelTitle = @"Close";
        NSString *message = [[userInfo valueForKey:@"aps"] valueForKey:@"alert"];
        UIAlertView *logoutalert = [[UIAlertView alloc] initWithTitle:@"Notification!"
                                                                message:message
                                                               delegate:nil
                                                      cancelButtonTitle:cancelTitle
                                                      otherButtonTitles:nil, nil];
        [logoutalert show];
    }
    else if(application.applicationState == UIApplicationStateBackground) {
        NSString *cancelTitle = @"Close";
        NSString *message = [[userInfo valueForKey:@"aps"] valueForKey:@"alert"];
        UIAlertView *  logoutalert = [[UIAlertView alloc] initWithTitle:@"Notification!"
                                                                message:message
                                                               delegate:nil
                                                      cancelButtonTitle:cancelTitle
                                                      otherButtonTitles:nil, nil];
        [logoutalert show];
    }
    else if(application.applicationState == UIApplicationStateInactive) {
        NSString *cancelTitle = @"Close";
        NSString *message = [[userInfo valueForKey:@"aps"] valueForKey:@"alert"];
        UIAlertView * logoutalert = [[UIAlertView alloc] initWithTitle:@"Notification!"
                                                               message:message
                                                              delegate:nil
                                                     cancelButtonTitle:cancelTitle
                                                     otherButtonTitles:nil, nil];
        [logoutalert show];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // [FBSDKAccessToken setCurrentAccessToken:nil];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    application.applicationIconBadgeNumber = 0;
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber: 0];
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    //application.applicationIconBadgeNumber = 0;
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber: 0];
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}
//- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
//{
//    [[UIApplication sharedApplication] setApplicationIconBadgeNumber: 0];
//    [[UIApplication sharedApplication] cancelAllLocalNotifications];
//
////    NSString *message = [[userInfo valueForKey:@"aps"] valueForKey:@"alert"];
////    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notification received!" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
////    [alert show];
//
//}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    application.applicationIconBadgeNumber = 0;
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber: 0];
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    [FBSDKAppEvents activateApp];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber: 0];
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    [userDefaults removeObjectForKey:@"pref_facebook"];
    BOOL handled = [[FBSDKApplicationDelegate sharedInstance] application:application
                                                                  openURL:url
                                                        sourceApplication:sourceApplication
                                                               annotation:annotation
                    ];
    // Add any custom logic here.
    return handled;
}

- (void)backToHome {
    [FBSDKAccessToken setCurrentAccessToken:nil];
    //[FBSDKAccessToken currentAccessToken]=nil;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
