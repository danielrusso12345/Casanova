//
//  AppDelegate.h
//  BlogApp
//
//  Created by Mac on 21/11/2016.
//  Copyright (c) 2016 Young Decade. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
        NSUserDefaults *pref;
}

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, retain) UINavigationController *nc;

-(void)backtohome;


@end

