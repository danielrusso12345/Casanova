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
@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize nc,window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    pref=[NSUserDefaults standardUserDefaults];
    [pref removeObjectForKey:@"pref_crpped_img"];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    if([[UIApplication sharedApplication] respondsToSelector:@selector(isRegisteredForRemoteNotifications)])
    {
        [[UIApplication sharedApplication] registerUserNotificationSettings:  [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound) categories:nil]];
        
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
    else
    {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_8_0
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIUserNotificationTypeAlert | UIUserNotificationTypeBadge |    UIUserNotificationTypeSound)];
#endif
    }
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
   Start_VC*  myView =[[Start_VC alloc]initWithNibName:@"Start_VC" bundle:nil];
        
        
    nc=[[UINavigationController alloc]initWithRootViewController:myView];
   // }
    self.window.rootViewController =nc;
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    return YES;

}
-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    pref=[NSUserDefaults standardUserDefaults];
    NSString * token = [NSString stringWithFormat:@"%@", deviceToken];
    //Format token as you need:
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    token = [token stringByReplacingOccurrencesOfString:@">" withString:@""];
    token = [token stringByReplacingOccurrencesOfString:@"<" withString:@""];
    NSLog(@"%@",token);
    
    NSString *str_token=[NSString stringWithFormat:@"%@",token];
    [pref setObject:str_token forKey:@"pref_token"];
}
-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"Error:%@",error);
}
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber: 0];
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    NSLog(@"user dict jai----%@",userInfo);
//    
//    NSArray *ARR_USER_INFO=[[NSArray alloc]init];
//    
//    ARR_USER_INFO=[userInfo objectForKey:@"aps"];
//    NSLog(@"msg---%@",[ARR_USER_INFO valueForKey:@"msg"]);
//    
//    STR_MSG=[NSString stringWithFormat:@"%@",[ARR_USER_INFO valueForKey:@"msg"]];
//    
//    PREF=[NSUserDefaults standardUserDefaults];
    
    
    
    
    
    if(application.applicationState == UIApplicationStateActive)
    {
        
        
        
        NSString *cancelTitle = @"Close";
        NSString *message = [[userInfo valueForKey:@"aps"] valueForKey:@"alert"];
      UIAlertView *  logoutalert = [[UIAlertView alloc] initWithTitle:@"Notification!"
                                                 message:message
                                                delegate:nil
                                       cancelButtonTitle:cancelTitle
                                       otherButtonTitles:nil, nil];
      //  logoutalert.tag=1;
        [logoutalert show];
        
        
        
        
    }else if(application.applicationState == UIApplicationStateBackground)
    {
        NSString *cancelTitle = @"Close";
        NSString *message = [[userInfo valueForKey:@"aps"] valueForKey:@"alert"];
       UIAlertView *  logoutalert = [[UIAlertView alloc] initWithTitle:@"Notification!"
                                                 message:message
                                                delegate:nil
                                       cancelButtonTitle:cancelTitle
                                       otherButtonTitles:nil, nil];
      //  logoutalert.tag=1;
        [logoutalert show];
        
        
    }
    else if(application.applicationState == UIApplicationStateInactive)
    {
        
        NSString *cancelTitle = @"Close";
        NSString *message = [[userInfo valueForKey:@"aps"] valueForKey:@"alert"];
        UIAlertView * logoutalert = [[UIAlertView alloc] initWithTitle:@"Notification!"
                                                 message:message
                                                delegate:nil
                                       cancelButtonTitle:cancelTitle
                                       otherButtonTitles:nil, nil];
      //  logoutalert.tag=2;
        [logoutalert show];
        
        
    }
    
    
    
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    
     // [FBSDKAccessToken setCurrentAccessToken:nil];
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    application.applicationIconBadgeNumber = 0;
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber: 0];
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
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
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    application.applicationIconBadgeNumber = 0;
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber: 0];
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    [FBSDKAppEvents activateApp];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber: 0];
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    
}


- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    
    NSLog(@"sourceApplication=====%@",sourceApplication);

        [pref removeObjectForKey:@"pref_facebook"];
        return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                              openURL:url
                                                    sourceApplication:sourceApplication
                                                           annotation:annotation];
   
}



-(void)backtohome
{
    [FBSDKAccessToken setCurrentAccessToken:nil];
    //[FBSDKAccessToken currentAccessToken]=nil;
    [nc popToRootViewControllerAnimated:YES];
}
@end
