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
#import "CategoriesViewController.h"
//Or you can sign in with social media
#define TextNumeric @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789\"<>,.?/';:|]}[{+=_-)(*&^%$#@!~`"
#define TextNumericspace @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789. "
#define TextNumericspace1 @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 "

@interface LoginViewController2 ()

@property (weak, nonatomic) IBOutlet UITextField *txt_Email;
@property (weak, nonatomic) IBOutlet UITextField *txt_password;
@property (strong, nonatomic) IBOutlet UIButton *btn_login;
@property(strong,nonatomic)UIActivityViewController *activityViewController;
@property (weak, nonatomic) IBOutlet UILabel *lbl_blank;

@end

@implementation LoginViewController2
//static NSString * const kClientId = @"418390474126-h1rkg878ph3pva9fmh8stf04utmo2mf2.apps.googleusercontent.com";

- (void)viewDidLoad {
    [super viewDidLoad];
    pref = [NSUserDefaults standardUserDefaults];
    flag_checkBox = 0;
    flag = 0;
    self.btn_login.layer.cornerRadius = self.btn_login.frame.size.height/2;
    self.btn_login.clipsToBounds = YES;
    self.btn_login.layer.borderColor = [UIColor whiteColor].CGColor;
    self.btn_login.layer.borderWidth = 1.0;
    
    _lbl_blank.layer.masksToBounds = true;
    _lbl_blank.layer.cornerRadius =_lbl_blank.frame.size.width/2;// 12.0;
    _lbl_blank.layer.borderColor = [UIColor whiteColor].CGColor;
    _lbl_blank.layer.borderWidth = 1.0;
    
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
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

- (void)DidRecieveResponse:(NSDictionary *)Dictionary {
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


- (void)loginfunction_facebook {
    flag = 2;
    pref = [NSUserDefaults standardUserDefaults];
    if ([[pref valueForKey:@"pref_token"] length] == 0) {
        str_StripeToken = @"";
    }
    else {
        str_StripeToken=[pref valueForKey:@"pref_token"];
    }
    //NSLog(@"facebook_login==%@",[pref valueForKey:@"pref_Social_id"]);
    // NSLog(@"facebook_login==%@",[pref valueForKey:@"pref_SocialEmail"]);
    Ary_Parameter =[[NSMutableArray alloc]initWithObjects:@"email",@"password",@"device_type",@"device_token",nil];
    
    NSLog(@"str value------%@",Ary_Parameter);
    Ary_Value =[[NSMutableArray alloc]initWithObjects:self.txt_Email.text,self.txt_password.text,@"ios",str_StripeToken,nil];
    NSLog(@"str value------%@",Ary_Value);
    
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
        else {
            [MBProgressHUD hideHUDForView:self.view animated:NO];
            UIAlertView *  alert=[[UIAlertView alloc]initWithTitle:@"Information message" message:[dict1 objectForKey:@"msg"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
        }
        [MBProgressHUD hideHUDForView:self.view animated:NO];
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField.tag == 1) {
        // [self animateTextField:textField up:YES];
    }
    
    else if (textField.tag == 2) {
        //[self animateTextField:textField up:YES];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSString *string = textField.text;
    NSString *trimmedString = [string stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceCharacterSet]];
    textField.text = trimmedString;
    if (textField.tag == 1) {
        // [self animateTextField:textField up:NO];
    }
    else if (textField.tag == 2) {
        // [self animateTextField:textField up:NO];
        if ((![self.txt_Email.text isEqualToString:@""] ) && self.txt_password.text.length>=3) {
            self.btn_login.layer.cornerRadius=self.btn_login.frame.size.height/2;
            [self.btn_login setBackgroundColor:[UIColor whiteColor]];
            self.btn_login.titleLabel.textColor=[UIColor colorWithRed:148.0/255 green:110.0/255 blue:131.0/255 alpha:1.0];
            self.btn_login.clipsToBounds=YES;
            self.btn_login.layer.borderColor = [UIColor whiteColor].CGColor;
            self.btn_login.layer.borderWidth = 1.0;

        }
    }
}

- (void)dismissKeyboard {
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Email validation

- (BOOL)validateEmail: (NSString *) candidate {
    NSString *emailRegex = @"[A-Z0-9a-z]+[A-Z0-9a-z_./%-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:candidate];
}

- (BOOL)CheckNetwork {
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.google.com"];
    NetworkStatus NetworkStatus = [reachability currentReachabilityStatus];
    return NetworkStatus;
}

#pragma mark - Validation

- (NSString *)validate {
    NSString *strinvalid=nil;
    if (![self validateEmail:self.txt_Email.text]) {
        strinvalid=@"Please enter valid email id";
    }
    else if([self.txt_password.text isEqualToString:@""]|| [self.txt_password.text isEqualToString:@"NA"] || self.txt_password.text.length<=3) {
        strinvalid=@"Please enter password minimum 4 & maximum 15 characters to continue";
    }
    return strinvalid;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSCharacterSet *unacceptedInput = nil;
    if (textField.tag == 1) {
        
        NSInteger oldLength = [textField.text length];
        NSInteger newLength = oldLength + [string length] - range.length;
        unacceptedInput = [[NSCharacterSet characterSetWithCharactersInString:[TextNumeric stringByAppendingString:@""]] invertedSet];
        
        if(newLength >= 41) {
            return NO;
        }
        return ([[string componentsSeparatedByCharactersInSet:unacceptedInput] count] <= 1);
    }
    if (textField.tag == 2) {
        NSInteger oldLength = [textField.text length];
        NSInteger newLength = oldLength + [string length] - range.length;
        unacceptedInput = [[NSCharacterSet characterSetWithCharactersInString:[TextNumeric stringByAppendingString:@""]] invertedSet];
        
        if(newLength >= 16) {
            return NO;
        }
        if ((![self.txt_Email.text isEqualToString:@""] ) && self.txt_password.text.length>=3) {
            self.btn_login.layer.cornerRadius=self.btn_login.frame.size.height/2;
            [self.btn_login setBackgroundColor:[UIColor whiteColor]];
            self.btn_login.titleLabel.textColor=[UIColor colorWithRed:148.0/255 green:110.0/255 blue:131.0/255 alpha:1.0];
            self.btn_login.clipsToBounds=YES;
            self.btn_login.layer.borderColor = [UIColor whiteColor].CGColor;
            self.btn_login.layer.borderWidth = 1.0;
        }
        return ([[string componentsSeparatedByCharactersInSet:unacceptedInput] count] <= 1);
    }
    return YES;
}

#pragma mark - IBActions

- (IBAction)loginAction:(id)sender {
    NSString *str = [self validate];
    if (str) {
        alert = [[UIAlertView alloc]initWithTitle:@"Information Message" message:str delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        self.btn_login.layer.cornerRadius=self.btn_login.frame.size.height/2;
        [self.btn_login setBackgroundColor:[UIColor whiteColor]];
        self.btn_login.titleLabel.textColor=[UIColor colorWithRed:148.0/255 green:110.0/255 blue:131.0/255 alpha:1.0];
        self.btn_login.clipsToBounds=YES;
        self.btn_login.layer.borderColor = [UIColor whiteColor].CGColor;
        self.btn_login.layer.borderWidth = 1.0;
        return;
    }
    else {
        [MBProgressHUD showHUDAddedTo:self.view animated:NO];
        [self performSelector:@selector(loginfunction_facebook) withObject:nil afterDelay:1.0];
    }
}

- (IBAction)back:(id)sender {
//    LoginViewController *loss=[[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
//    [self.navigationController pushViewController:loss animated:NO];
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)forgotPasswordAction:(id)sender {
    ForgotPasswordViewController *loss=[[ForgotPasswordViewController alloc]initWithNibName:@"ForgotPasswordViewController" bundle:nil];
    [self.navigationController pushViewController:loss animated:NO];
    // [self.navigationController popViewControllerAnimated:NO];
}

@end
