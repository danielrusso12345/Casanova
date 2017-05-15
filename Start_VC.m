//
//  SplashVC.m
//  redrooster
//
//  Created by mac on 6/3/16.
//  Copyright (c) 2016 YoungDecade. All rights reserved.
//

#import "Start_VC.h"
#import "LoginViewController.h"
#import "CategoriesViewController.h"
//#import "DEMOMenuViewController.h"
//#import "DEMONavigationController.h"
//#import "AppDelegate.h"
//#import "Reachability.h"
//#import "MBProgressHUD.h"

@interface Start_VC () {
    NSUserDefaults *userDefaults;
    //ostedViewController *frostedViewController ;
}
@end

@implementation Start_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    userDefaults = [NSUserDefaults standardUserDefaults];
    self.navigationController.navigationBarHidden = true;
}

- (void)viewWillAppear:(BOOL)animated {
    [self performSelector:@selector(startApp) withObject:self afterDelay:1.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)startApp {
    //    if ([pref valueForKey:@"pref_User_Id"])
    //    {
    //        [pref setObject:@"yes" forKey:@"pref_log_yes"];
    //
    //    }
    //    else
    //    {
    //        [pref setObject:@"no" forKey:@"pref_log_yes"];
    
    //    }
    if ([[userDefaults valueForKey:@"pref_fb_check"] isEqualToString:@"sushil"]) {
        CategoriesViewController *categoriesVC = [[CategoriesViewController alloc] initWithNibName:@"CategoriesViewController" bundle:nil];
        [self.navigationController pushViewController:categoriesVC animated:NO];
    }
    else {
        LoginViewController *loginVC = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
        [self.navigationController pushViewController:loginVC animated:NO];
    }
}

//- (BOOL)CheckNetwork {
//    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.google.com"];
//    NetworkStatus NetworkStatus = [reachability currentReachabilityStatus];
//    return NetworkStatus;
//}
//
//- (void)loginfun {
//    if ([self CheckNetwork] == NotReachable) {
//        NSLog(@"Not Reachable");
//        UIAlertView *  alert=[[UIAlertView alloc]initWithTitle:@"info" message:@"NO Internet Connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//        [alert show];
//        [MBProgressHUD hideHUDForView:self.view animated:NO];
//    }
//    else {
//        [MBProgressHUD showHUDAddedTo:self.view animated:NO];
//
//        //http://youngdecadeprojects.biz/infokotaku/webservice/background_image.php
//        NSString *str = [NSString stringWithFormat:@"background_image.php"];
//
//        jsr =[[JSONRequestHelper alloc]init];
//        jsr.delegate = self;
//        [jsr RecieveRequestWithURL:str];
//    }
//}
//-(void)DidRecieveRequest:(NSDictionary *)Dictionary
//{
//    NSLog(@"Dictionary --- %@",Dictionary);
//
//
//    NSString *str_success =[NSString stringWithFormat:@"%@",[Dictionary valueForKey:@"success"]];
//        if ([str_success isEqualToString:@"true"])
//        {
//
//            NSString *STR_ABOUT=[Dictionary valueForKey:@"about_content"];
//            [pref setObject:STR_ABOUT forKey:@"pref_About_us"];
//
//
//            NSString *str_image=[Dictionary valueForKey:@"background_content"];
//            [pref setObject:str_image forKey:@"pref_image_bg"];
//
////            NSURL *myurl1 = [NSURL URLWithString:];
////
////            NSLog(@"url---%@",myurl1);
////
////            [image_bg setImageWithURL:myurl1 placeholderImage:[UIImage imageNamed:@"category_img.png"] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
////            image_bg.contentMode = UIViewContentModeScaleToFill;
//            [MBProgressHUD hideHUDForView:self.view animated:NO];
//            Home_ViewController *hom=[[Home_ViewController alloc]initWithNibName:@"Home_ViewController" bundle:nil];
//            [self.navigationController pushViewController:hom animated:YES];
//
//
//            DEMOMenuViewController * dvc =[[DEMOMenuViewController alloc]init];
//
//            [dvc sushil];
//
//
//
//        }
//        else
//        {
//            UIAlertView *  alert=[[UIAlertView alloc]initWithTitle:@"info" message:[Dictionary valueForKey:@"msg"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//            [alert show];
//            [MBProgressHUD hideHUDForView:self.view animated:NO];
//
//        }
//}


@end
