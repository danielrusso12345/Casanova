//
//  LoginViewController.m
//  TennisWalesLeaders
//
//  Created by mac on 10/30/15.
//  Copyright (c) 2015 youngdecade. All rights reserved.
//

#import "LoginViewController2.h"
#import "Reachability.h"
#import "MBProgressHUD.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "ForgotPasswordViewController.h"
//#import "DEMONavigationController.h"
//#import "DEMOMenuViewController.h"
//#import "Customer_SignupVC.h"
//#import "ForgotPasswordViewController.h"
//#import "Customer_home_ViewController.h"
//#import "WelcomeOptionVC.h"
//#import <FBSDKCoreKit/FBSDKCoreKit.h>
//#import <FBSDKLoginKit/FBSDKLoginKit.h>
//#import <GoogleMaps/GoogleMaps.h>
//#import <GooglePlus/GooglePlus.h>
#import "CategoriesViewController.h"
//Or you can sign in with social media
#define TextNumeric @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789\"<>,.?/';:|]}[{+=_-)(*&^%$#@!~`"
#define TextNumericspace @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789. "
#define TextNumericspace1 @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 "

@interface LoginViewController2 ()//<GMSMapViewDelegate>
{
  //  DEMONavigationController *navigationController;
    //REFrostedViewController *frostedViewController ;

     //GPPSignIn *signIn;
}
//@property (nonatomic, strong) AppDelegate *appDelegate;
//-(void)handleFBSessionStateChangeWithNotification:(NSNotification *)notification;

@end

@implementation LoginViewController2
static NSString * const kClientId = @"418390474126-h1rkg878ph3pva9fmh8stf04utmo2mf2.apps.googleusercontent.com";

@synthesize txt_password,txt_Email,btn_loging,btn_check,my_view,txt_Username1;//,signInButton;

@synthesize TF_city,TF_country,lbl_bg,btn_login,lbl_blank;





- (void)viewDidLoad {
    [super viewDidLoad];
     pref=[NSUserDefaults standardUserDefaults];
  //  FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
   // [loginManager logOut];
    //[FBSDKAccessToken setCurrentAccessToken:nil];
   my_view.hidden=YES;
    flag_checkBox = 0;
    flag=0;
    
    lbl_bg.layer.cornerRadius=10.0;
    lbl_bg.clipsToBounds=YES;
    
    btn_login.layer.cornerRadius=btn_login.frame.size.height/2;
    btn_login.clipsToBounds=YES;
    
    lbl_blank.layer.masksToBounds = true;
    lbl_blank.layer.cornerRadius =lbl_blank.frame.size.width/2;// 12.0;
    lbl_blank.layer.borderColor = [UIColor grayColor].CGColor;
    lbl_blank.layer.borderWidth = 1.0;
    
      // [self getAlltype];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)Back_Button:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=YES;
    
    

    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/////-----login service--------///////




-(void)DidRecieveResponse:(NSDictionary *)Dictionary
{
    NSLog(@"dict - %@",Dictionary);
    
     if ([[Dictionary objectForKey:@"success"]isEqualToString:@"true"])
    {
        [MBProgressHUD hideHUDForView:self.view animated:NO];
        
        if (flag ==2)
        {
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
     else
     {
         [MBProgressHUD hideHUDForView:self.view animated:NO];
         
         alert=[[UIAlertView alloc]initWithTitle:@"Information Message" message:[Dictionary objectForKey:@"msg"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
         [alert show];
     }
    
    [MBProgressHUD hideHUDForView:self.view animated:NO];

}


///////----------facebook-------


//-(void)loginButtonClicked   // Facebook
//{
//    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
//    
//     [pref setObject:@"facebook" forKey:@"pref_facebook"];
//    
//   
//    [login logInWithReadPermissions:@[@"public_profile", @"email", @"user_friends"] handler:^(FBSDKLoginManagerLoginResult *result,NSError *error) {
//        if (error) {
//            NSLog(@"Process error");
//        } else if (result.isCancelled) {
//            NSLog(@"Cancelled");
//        } else {
//            NSLog(@"Logged in");
//            
//            if ([result.grantedPermissions containsObject:@"email"])
//            {
//                if ([FBSDKAccessToken currentAccessToken])
//                { [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"first_name, last_name, picture.type(normal), email"}] startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error)
//                   { if (!error)
//                   {
//                       NSLog(@"email : %@",[result objectForKey:@"email"]);
//                        NSLog(@"result==== : %@",result);
//                       [pref setObject:[result objectForKey:@"first_name"] forKey:@"pref_Social_name"];//
//                       
//                       //
//                       
//                        [pref setObject:[[[result objectForKey:@"picture"] objectForKey:@"data"] objectForKey:@"url"] forKey:@"pref_profilepic"];
//                       
//                       [pref setObject:[result objectForKey:@"email"] forKey:@"pref_SocialEmail"];//
//                       [pref setObject:@"facebook" forKey:@"pref_lastpage"];
//                       
//                       [MBProgressHUD showHUDAddedTo:self.view animated:NO];
//                       [self performSelector:@selector(loginfunction_facebook) withObject:nil afterDelay:1.0];
//
//                      // [self loginfunction_facebook];
//
//                   }
//                  }];
//                }
//                
//            }
//            
//            
//            
//        }
//    }];
//    
//}
//- (IBAction)FaceBook:(id)sender
//{
//    [FBSDKAccessToken setCurrentAccessToken:nil];
//    [self loginButtonClicked];
//}
////--------web service login--------///

-(void)loginfunction_facebook
{
    flag=2;
    pref=[NSUserDefaults standardUserDefaults];
    
    if ([[pref valueForKey:@"pref_token"]length]==0)
    {
        str_StripeToken=@"";
    }
    else
    {
        str_StripeToken=[pref valueForKey:@"pref_token"];
    }
  
    //NSLog(@"facebook_login==%@",[pref valueForKey:@"pref_Social_id"]);
    // NSLog(@"facebook_login==%@",[pref valueForKey:@"pref_SocialEmail"]);
    
    Ary_Parameter =[[NSMutableArray alloc]initWithObjects:@"email",@"password",@"device_type",@"device_token",nil];
    
      NSLog(@"str value------%@",Ary_Parameter);
    Ary_Value =[[NSMutableArray alloc]initWithObjects:txt_Email.text,txt_password.text,@"ios",str_StripeToken,nil];
    NSLog(@"str value------%@",Ary_Value);
//    
//    Ary_Image =[[NSMutableArray alloc]init];
//    NSString *str_image=[pref valueForKey:@"pref_profilepic"];
//    NSData *data123=[NSData dataWithContentsOfURL:[NSURL URLWithString:str_image]];
//    [Ary_Image addObject:data123];
//    
//    post=[[PostFunctionHelper alloc]init];
//    post.str_photo=@"1";
//    post.delegate=self;
//    
//    [post RequestWithURL:@"login.php" :Ary_Parameter :Ary_Value : Ary_Image];





//    
//    if ([self CheckNetwork] == NotReachable)
//        
//    {
//        
//        UIAlertView *  alert=[[UIAlertView alloc]initWithTitle:@"Information message" message:@"No Internet Connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//        
//        [alert show];
//        
//        [SVProgressHUD dismiss];
//        
//    }
//    
//    else
//        
//    {
    
//        Ary_Parameter =[[NSMutableArray alloc]initWithObjects:@"email",@"fb_id",@"flag",@"name",nil];
//        
//        NSLog(@"ARRAY parameter------ %@",Ary_Parameter);
//        
//        TF_Email.text = [TF_Email.text lowercaseString];
//        
//        
//        
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
        
//        NSString*STRRR=[NSString stringWithFormat:@"%@",[pref objectForKey:@"pref_profilepic"]];
//        
//        NSURL*imgUrl=[NSURL URLWithString:STRRR];
//        
//        //IMG_FB.image = [UIImage imageWithContentsOfURL:imgUrl];
//        
//        //[IMG_FB setImageWithURL:STRRR placeholderImage:[UIImage imageNamed:@"image_128.png"] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//        
//    //    NSData* data_Image ;//= UIImagePNGRepresentation(img_profile.image);
//        
//        NSData *imageData = [NSData dataWithContentsOfURL:imgUrl];
//        
//        //data_Image =  UIImageJPEGRepresentation(IMG_FB.image, 0.001);
//        
//        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//        
//        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"image\"; filename=\"image.jpg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//        
//        [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//        
//        [body appendData:[NSData dataWithData:imageData]];
//        
//        [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
        
        
//        //parameter  $_POST['token']
//        
//        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//        
//        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"device_token\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//        
//        [body appendData:[[pref objectForKey:@"pref_device_token"] dataUsingEncoding:NSUTF8StringEncoding]];
//        
//        [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//        
//        
//        
//        //parameter  $_POST['device type']
//        
//        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//        
//        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"device_type\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//        
//        [body appendData:[[pref objectForKey:@"pref_device_type"] dataUsingEncoding:NSUTF8StringEncoding]];
//        
//        [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//        
    
        
        for (int b=0; b<Ary_Parameter.count; b++)
            
            
            
        {
            
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
        
        if (returnData == NULL)
            
        {
            
            
            
            
            
        }
        
        else
            
        {
            
            dict1=[NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingMutableLeaves error:nil];
            
            
            
            NSLog(@"post function taggg==%@",dict1);
            
            NSLog(@"0 - %@",[dict1 objectForKey:@"success"]);
            
            NSLog(@"0 - %@",[dict1 objectForKey:@"msg"]);
            
            
            
            if ([[dict1 objectForKey:@"success"]isEqualToString:@"true"])
                
            {
                
                [MBProgressHUD hideHUDForView:self.view animated:NO];
                
                //            if ([[pref valueForKey:@"pref_login_type1"]isEqualToString:@"facebook"])
                //            {
                
                NSString *str_email=[dict1 objectForKey:@"email"];
                
                [pref setObject:[dict1 objectForKey:@"email"] forKey:@"pref_User_Email_Id"];
                
              //  [pref setObject:[dict1 objectForKey:@"phone"] forKey:@"pref_User_Phone_No"];
                
                [pref setObject:@"sushil" forKey:@"pref_fb_check"];
                
             //   [pref setObject:str_email forKey:@"pref_facebook_email"];
                
                NSString *str_user_id_fb=[dict1 objectForKey:@"user_id"];
                
                [pref setObject:str_user_id_fb forKey:@"pref_User_Id"];
                
                
                NSString *str_user_type=[dict1 objectForKey:@"user_type"];
                
                [pref setObject:str_user_type forKey:@"pref_user_type"];
                
                
                NSString *str_Admin=[dict1 objectForKey:@"admin_id"];
                
                [pref setObject:str_Admin forKey:@"pref_Admin_id"];
                
                
                CategoriesViewController *cate=[[CategoriesViewController alloc]initWithNibName:@"CategoriesViewController" bundle:nil];
                [self.navigationController pushViewController:cate animated:YES];
                
            }
            
            else
                
            {
                
              [MBProgressHUD hideHUDForView:self.view animated:NO];
                
                UIAlertView *  alert=[[UIAlertView alloc]initWithTitle:@"Information message" message:[dict1 objectForKey:@"msg"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                
                [alert show];
                
               // [alert show];
                
            }
            
       // }
        
        
        
      [MBProgressHUD hideHUDForView:self.view animated:NO];
        
    }
    
    
    
    
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
        if (textField.tag == 1) {
            // [self animateTextField:textField up:YES];
        }
        
        else if (textField.tag == 2) {
            //[self animateTextField:textField up:YES];
           

        }
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    NSString *string = textField.text;
    
    NSString *trimmedString = [string stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceCharacterSet]];
    
    textField.text = trimmedString;
    
   
        if (textField.tag == 1)
        {
            // [self animateTextField:textField up:NO];
        }
        else  if (textField.tag == 2)
        {
            // [self animateTextField:textField up:NO];
            if ((![txt_Email.text isEqualToString:@""] ) && txt_password.text.length>=3)
            {
                btn_login.layer.cornerRadius=btn_login.frame.size.height/2;
                [btn_login setBackgroundColor:[UIColor colorWithRed:227.0/255 green:128.0/255 blue:139.0/255 alpha:1.0]];
                btn_login.titleLabel.textColor=[UIColor whiteColor];
                btn_login.clipsToBounds=YES;
            }
        }
    
    
}

-(void)dismissKeyboard
{
    [self.view endEditing:YES];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
/////----Email validation--------////////

- (BOOL) validateEmail: (NSString *) candidate {
    NSString *emailRegex = @"[A-Z0-9a-z]+[A-Z0-9a-z_./%-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:candidate];
}

-(BOOL)CheckNetwork
{
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.google.com"];
    NetworkStatus NetworkStatus = [reachability currentReachabilityStatus];
    return NetworkStatus;
}

///////--------validation---------/////////

-(NSString *)validate
{
    NSString *strinvalid=nil;
    if (![self validateEmail:txt_Email.text])
    {
        strinvalid=@"Please enter valid email id";
    }
    else if([txt_password.text isEqualToString:@""]|| [txt_password.text isEqualToString:@"NA"] || txt_password.text.length<=3)
    {
        strinvalid=@"Please enter password minimum 4 & maximum 15 characters to continue";
    }
    return strinvalid;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSCharacterSet *unacceptedInput = nil;
    
    if (textField.tag == 1) {
        
        NSInteger oldLength = [textField.text length];
        NSInteger newLength = oldLength + [string length] - range.length;
        unacceptedInput = [[NSCharacterSet characterSetWithCharactersInString:[TextNumeric stringByAppendingString:@""]] invertedSet];
        
        if(newLength >= 41){
            return NO;
        }
        return ([[string componentsSeparatedByCharactersInSet:unacceptedInput] count] <= 1);
    }
    if (textField.tag == 2) {
        
        NSInteger oldLength = [textField.text length];
        NSInteger newLength = oldLength + [string length] - range.length;
        
        unacceptedInput = [[NSCharacterSet characterSetWithCharactersInString:[TextNumeric stringByAppendingString:@""]] invertedSet];
        
        if(newLength >= 16){
            return NO;
        }
        if ((![txt_Email.text isEqualToString:@""] ) && txt_password.text.length>=3)
        {
            btn_login.layer.cornerRadius=btn_login.frame.size.height/2;
            [btn_login setBackgroundColor:[UIColor colorWithRed:227.0/255 green:128.0/255 blue:139.0/255 alpha:1.0]];
            btn_login.titleLabel.textColor=[UIColor whiteColor];
            btn_login.clipsToBounds=YES;
        }

        return ([[string componentsSeparatedByCharactersInSet:unacceptedInput] count] <= 1);
    }
    return YES;
}

-(IBAction)login_button:(id)sender
{
    NSString *str =[self validate];
    
   
    if (str)
    {
        
        alert=[[UIAlertView alloc]initWithTitle:@"Information Message" message:str delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        
        btn_login.layer.cornerRadius=btn_login.frame.size.height/2;
        [btn_login setBackgroundColor:[UIColor whiteColor]];
        btn_login.titleLabel.textColor=[UIColor colorWithRed:227.0/255 green:128.0/255 blue:139.0/255 alpha:1.0];
        btn_login.clipsToBounds=YES;
        return;
    }
    else
    {
        [MBProgressHUD showHUDAddedTo:self.view animated:NO];
    [self performSelector:@selector(loginfunction_facebook) withObject:nil afterDelay:1.0];
    }

}
-(IBAction)BACK:(id)sender
{
    LoginViewController *loss=[[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    [self.navigationController pushViewController:loss animated:NO];
   // [self.navigationController popViewControllerAnimated:NO];
}

-(IBAction)Forgot_Button:(id)sender
{
    ForgotPasswordViewController *loss=[[ForgotPasswordViewController alloc]initWithNibName:@"ForgotPasswordViewController" bundle:nil];
    [self.navigationController pushViewController:loss animated:NO];
    // [self.navigationController popViewControllerAnimated:NO];
}
@end
