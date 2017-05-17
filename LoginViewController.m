//
//  LoginViewController.m
//  TennisWalesLeaders
//
//  Created by mac on 10/30/15.
//  Copyright (c) 2015 youngdecade. All rights reserved.
//

#import "LoginViewController.h"
#import "Reachability.h"
#import "MBProgressHUD.h"
#import "AppDelegate.h"
#import "LoginViewController2.h"
#import "Customer_SignupVC.h"
#import "CategoriesViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>


@interface LoginViewController  ()

@property (weak, nonatomic) IBOutlet FBSDKLoginButton *fbLoginButton;

@end

@implementation LoginViewController
//static NSString * const kClientId = @"418390474126-h1rkg878ph3pva9fmh8stf04utmo2mf2.apps.googleusercontent.com";

- (void)viewDidLoad {
    [super viewDidLoad];
    pref = [NSUserDefaults standardUserDefaults];
    self.fbLoginButton.readPermissions = @[@"public_profile", @"email"];
    self.fbLoginButton.delegate = self;
    FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
    [loginManager logOut];
    //[FBSDKAccessToken setCurrentAccessToken:nil];
    self.my_view.hidden=NO;
    flag_checkBox = 0;
    flag=0;
    
    // [self getAlltype];
}

- (IBAction)Back_Button:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Login service

-(void)DidRecieveResponse:(NSDictionary *)Dictionary {
    NSLog(@"dict - %@",Dictionary);
    if ([[Dictionary objectForKey:@"success"]isEqualToString:@"true"]) {
        [MBProgressHUD hideHUDForView:self.view animated:NO];
        if (flag ==2) {
            [MBProgressHUD hideHUDForView:self.view animated:NO];
            //            if ([[pref valueForKey:@"pref_login_type1"]isEqualToString:@"facebook"])
            //            {
            NSString *str_email=[Dictionary objectForKey:@"email"];
            [pref setObject:[Dictionary objectForKey:@"email"] forKey:@"pref_User_Email_Id"];
            [pref setObject:[Dictionary objectForKey:@"phone"] forKey:@"pref_User_Phone_No"];
            [pref setObject:@"sushil" forKey:@"pref_fb_check"];
            [pref setObject:str_email forKey:@"pref_facebook_email"];
            NSString *str_user_id_fb=[Dictionary objectForKey:@"user_id"];
            [pref setObject:str_user_id_fb forKey:@"pref_User_Id"];
            NSString *str_user_type=[Dictionary objectForKey:@"user_type"];
            [pref setObject:str_user_type forKey:@"pref_user_type"];
            CategoriesViewController *cate=[[CategoriesViewController alloc]initWithNibName:@"CategoriesViewController" bundle:nil];
            [self.navigationController pushViewController:cate animated:YES];
        }
    }
    else {
        [MBProgressHUD hideHUDForView:self.view animated:NO];
        alert=[[UIAlertView alloc]initWithTitle:@"Information Message" message:[Dictionary objectForKey:@"msg"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    [MBProgressHUD hideHUDForView:self.view animated:NO];
}

#pragma mark - Facebook

- (void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error {
    if (!error) {
        NSLog(@"FB login result: %@", result);
        if (result.isCancelled) {
            NSLog(@"Was cancelled by the user");
        }
        else {
            NSLog(@"FB token: %@", result.token);
        }
    }
    else {
        NSLog(@"FB login error: %@", error);
    }
}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    NSLog(@"FB logout");
}

//- (void)loginButtonClicked {
//    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
//    [pref setObject:@"facebook" forKey:@"pref_facebook"];
//    [login logInWithReadPermissions:@[@"public_profile", @"email", @"user_friends"] handler:^(FBSDKLoginManagerLoginResult *result,NSError *error) {
//        if (error) {
//            NSLog(@"Process error");
//        }
//        else if (result.isCancelled) {
//            NSLog(@"Cancelled");
//        }
//        else {
//            NSLog(@"Logged in");
//            if ([result.grantedPermissions containsObject:@"email"]) {
//                if ([FBSDKAccessToken currentAccessToken]) {
//                    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"first_name, last_name, picture.type(normal), email"}] startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
//                        if (!error) {
//                            NSLog(@"email : %@",[result objectForKey:@"email"]);
//                            NSLog(@"result==== : %@",result);
//                            [pref setObject:[result objectForKey:@"first_name"] forKey:@"pref_Social_name"];
//                            [pref setObject:[[[result objectForKey:@"picture"] objectForKey:@"data"] objectForKey:@"url"] forKey:@"pref_profilepic"];
//                            [pref setObject:[result objectForKey:@"email"] forKey:@"pref_SocialEmail"];//
//                            [pref setObject:@"facebook" forKey:@"pref_lastpage"];
//                            [MBProgressHUD showHUDAddedTo:self.view animated:NO];
//                            [self performSelector:@selector(loginfunction_facebook) withObject:nil afterDelay:1.0];
//                            // [self loginfunction_facebook];
//                        }
//                    }];
//                }
//            }
//        }
//    }];
//}
//
//- (IBAction)FaceBook:(id)sender {
//    [FBSDKAccessToken setCurrentAccessToken:nil];
//    [self loginButtonClicked];
//}

#pragma mark - Web service login

- (void)loginfunction_facebook {
    flag = 2;
    pref = [NSUserDefaults standardUserDefaults];
    if ([[pref valueForKey:@"pref_token"]length]==0) {
        str_StripeToken=@"";
    }
    else {
        str_StripeToken=[pref valueForKey:@"pref_token"];
    }
    NSLog(@"facebook_login==%@",[pref valueForKey:@"pref_Social_id"]);
    NSLog(@"facebook_login==%@",[pref valueForKey:@"pref_SocialEmail"]);
    Ary_Parameter =[[NSMutableArray alloc]initWithObjects:@"facebook_email",@"username",@"device_type",@"device_token",nil];
    NSLog(@"str value------%@",Ary_Parameter);
    Ary_Value =[[NSMutableArray alloc]initWithObjects:[pref valueForKey:@"pref_SocialEmail"],[pref valueForKey:@"pref_Social_name"],@"ios",str_StripeToken,nil];
    NSLog(@"str value------%@",Ary_Value);
    //
    //    Ary_Image =[[NSMutableArray alloc]init];
    //    NSString *str_image=[pref valueForKey:@"pref_profilepic"];
    //    NSData *data123=[NSData dataWithContentsOfURL:[NSURL URLWithString:str_image]];
    //    [Ary_Image addObject:data123];
    //    post=[[PostFunctionHelper alloc]init];
    //    post.str_photo=@"1";
    //    post.delegate=self;
    //    [post RequestWithURL:@"login.php" :Ary_Parameter :Ary_Value : Ary_Image];
    //    if ([self CheckNetwork] == NotReachable)
    //    {
    //        UIAlertView *  alert=[[UIAlertView alloc]initWithTitle:@"Information message" message:@"No Internet Connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    //        [alert show];
    //        [SVProgressHUD dismiss];
    //    }
    //    else
    //    {
    //        Ary_Parameter =[[NSMutableArray alloc]initWithObjects:@"email",@"fb_id",@"flag",@"name",nil];
    //        NSLog(@"ARRAY parameter------ %@",Ary_Parameter);
    //        TF_Email.text = [TF_Email.text lowercaseString];
    //        Ary_Value =[[NSMutableArray alloc]initWithObjects:[pref objectForKey:@"pref_email_fb"],[pref objectForKey:@"pref_FBmyID"],@"facebook",[pref objectForKey:@"Pref_fullname"], nil ];
    
    NSLog(@"ary pram----%@   ary value----%@",Ary_Parameter,Ary_Value);
    NSString *str=@"http://danielrusso.xyz/APP/login.php";
    NSLog(@"Url Post --- %@",str);
    NSString *urlString = [NSString stringWithFormat:@"%@",str];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];
    NSMutableData *body = [NSMutableData data];
    NSString *boundary = @"---------------------------14737809831466499882746641449";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    ////////////imagedata//[[[result objectForKey:@"picture"] objectForKey:@"data"] objectForKey:@"url"]
    //UIImageView*IMG_FB= [[UIImageView alloc]init];
    NSString*STRRR=[NSString stringWithFormat:@"%@",[pref objectForKey:@"pref_profilepic"]];
    NSURL*imgUrl=[NSURL URLWithString:STRRR];
    //IMG_FB.image = [UIImage imageWithContentsOfURL:imgUrl];
    //[IMG_FB setImageWithURL:STRRR placeholderImage:[UIImage imageNamed:@"image_128.png"] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    //    NSData* data_Image ;//= UIImagePNGRepresentation(img_profile.image);
    NSData *imageData = [NSData dataWithContentsOfURL:imgUrl];
    //data_Image =  UIImageJPEGRepresentation(IMG_FB.image, 0.001);
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"image\"; filename=\"image.jpg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[NSData dataWithData:imageData]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    //        //parameter  $_POST['token']
    //        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    //        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"device_token\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    //        [body appendData:[[pref objectForKey:@"pref_device_token"] dataUsingEncoding:NSUTF8StringEncoding]];
    //        [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    //        //parameter  $_POST['device type']
    //        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    //        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"device_type\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    //        [body appendData:[[pref objectForKey:@"pref_device_type"] dataUsingEncoding:NSUTF8StringEncoding]];
    //        [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    for (int b=0; b<Ary_Parameter.count; b++) {
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",[Ary_Parameter objectAtIndex:b]] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[[NSString stringWithFormat:@"%@",[Ary_Value objectAtIndex:b]] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        NSLog(@"parameter---%@",[Ary_Parameter objectAtIndex:b]);
        NSLog(@"value---%@",[Ary_Value objectAtIndex:b]);
    }
    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:body];
    NSData* returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSDictionary *dict1;
    if (returnData == NULL) {
        
    }
    else {
        dict1=[NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"post function taggg==%@",dict1);
        NSLog(@"0 - %@",[dict1 objectForKey:@"success"]);
        NSLog(@"0 - %@",[dict1 objectForKey:@"msg"]);
        if ([[dict1 objectForKey:@"success"]isEqualToString:@"true"]) {
            [MBProgressHUD hideHUDForView:self.view animated:NO];
            
            //            if ([[pref valueForKey:@"pref_login_type1"]isEqualToString:@"facebook"])
            //            {
            NSString *str_email=[dict1 objectForKey:@"email"];
            [pref setObject:[dict1 objectForKey:@"email"] forKey:@"pref_User_Email_Id"];
            [pref setObject:[dict1 objectForKey:@"phone"] forKey:@"pref_User_Phone_No"];
            [pref setObject:@"sushil" forKey:@"pref_fb_check"];
            [pref setObject:str_email forKey:@"pref_facebook_email"];
            NSString *str_user_id_fb=[dict1 objectForKey:@"user_id"];
            [pref setObject:str_user_id_fb forKey:@"pref_User_Id"];
            NSString *str_user_type=[dict1 objectForKey:@"user_type"];
            [pref setObject:str_user_type forKey:@"pref_user_type"];
            NSString *str_Admin=[dict1 objectForKey:@"admin_id"];
            [pref setObject:str_Admin forKey:@"pref_Admin_id"];
            CategoriesViewController *cate=[[CategoriesViewController alloc]initWithNibName:@"CategoriesViewController" bundle:nil];
            [self.navigationController pushViewController:cate animated:YES];
        }
        else {
            [MBProgressHUD hideHUDForView:self.view animated:NO];
            UIAlertView *  alert=[[UIAlertView alloc]initWithTitle:@"Information message" message:[dict1 objectForKey:@"msg"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
        }
        // }
        [MBProgressHUD hideHUDForView:self.view animated:NO];
    }
}

- (IBAction)SIGN_IN:(id)sender {
    LoginViewController2 *loginVC = [[LoginViewController2 alloc] initWithNibName:@"LoginViewController2" bundle:nil];
    [self.navigationController pushViewController:loginVC animated:NO];
}

- (IBAction)SIGN_UP:(id)sender {
    Customer_SignupVC *signUpVC = [[Customer_SignupVC alloc] initWithNibName:@"Customer_SignupVC" bundle:nil];
    [self.navigationController pushViewController:signUpVC animated:NO];
}

@end
