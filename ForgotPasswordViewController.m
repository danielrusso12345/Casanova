//
//  ForgotPasswordViewController.m
//  TennisWalesLeaders
//
//  Created by mac on 10/30/15.
//  Copyright (c) 2015 youngdecade. All rights reserved.
//

#import "ForgotPasswordViewController.h"
#import "Reachability.h"
#import "MBProgressHUD.h"

@interface ForgotPasswordViewController ()

@end
//
//@implementation UITextField (DisableCopyPaste)
//
//- (BOOL)canPerformAction:(SEL)action withSender:(UITextField *)sender
//{
//    if (action == @selector(paste:))
//        return NO;
//    if (action == @selector(cut:))
//        return NO;
//    if (action == @selector(copy:))
//        return NO;
//    
//    
//    
//    if (action == @selector(select:))
//        return NO;
//    if (action == @selector(selectAll:))
//        return NO;
//    return [super canPerformAction:action withSender:sender];
//}
//@end

@implementation ForgotPasswordViewController
@synthesize txt_email,lbl_bg,btn_submit,lbl_back;

-(void)ConnectionNotEstablish
{
    [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Info" message:@"No internet connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    lbl_bg.layer.masksToBounds = true;
    lbl_bg.layer.cornerRadius = 10.0;
    btn_submit.layer.masksToBounds=true;
    btn_submit.layer.cornerRadius=btn_submit.frame.size.height/2;
    
    
    lbl_back.layer.masksToBounds = true;
    lbl_back.layer.cornerRadius =lbl_back.frame.size.width/2;// 12.0;
    lbl_back.layer.borderColor = [UIColor grayColor].CGColor;
    lbl_back.layer.borderWidth = 1.0;
    UISwipeGestureRecognizer *gestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandler:)];
    [gestureRecognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    
    [self.view addGestureRecognizer:gestureRecognizer];
    // Do any additional setup after loading the view from its nib.
}

-(void)swipeHandler:(UISwipeGestureRecognizer *)recognizer {
    NSLog(@"Swipe received.");
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=YES;
    [txt_email setValue:[UIColor darkGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];

}



//////-----------Touch Event----------------///////////

-(void)dismissKeyboard
{
    [self.view endEditing:YES];
}

/////----Email validation--------////////

//- (BOOL) validateEmail: (NSString *) candidate {
//    NSString *emailRegex = @"[A-Z0-9a-z]+[A-Z0-9a-z_./%-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}";
//    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
//    
//    return [emailTest evaluateWithObject:candidate];
//}

- (BOOL) validateEmail: (NSString *) candidate
{
    
    NSString *emailRegex = @"[a-z0-9A-Z]+([._%+-]{1}[a-z0-9A-Z]+)*@[a-z0-9A-Z]+([.-]{1}[a-z0-9A-Z]+)*(\\.[a-zA-Z]{2,4})";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:candidate];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
  //  NSCharacterSet *unacceptedInput = nil;
    
    if (textField.tag == 1) {
        
        NSInteger oldLength = [textField.text length];
        NSInteger newLength = oldLength + [string length] - range.length;
        
        if(newLength >= 39){
            return NO;
        }
        if ((![txt_email.text isEqualToString:@""] ))
        {
            btn_submit.layer.cornerRadius=btn_submit.frame.size.height/2;
            [btn_submit setBackgroundColor:[UIColor colorWithRed:1.0/255 green:110.0/255 blue:166.0/255 alpha:1.0]];
            btn_submit.titleLabel.textColor=[UIColor whiteColor];
            btn_submit.clipsToBounds=YES;
        }
        return YES;
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)CheckNetwork
{
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.google.com"];
    NetworkStatus NetworkStatus = [reachability currentReachabilityStatus];
    return NetworkStatus;
}

- (IBAction)Submit_Button:(id)sender
{
    if ([self CheckNetwork] == NotReachable)
    {
        NSLog(@"Not Reachable");
         [MBProgressHUD hideHUDForView:self.view animated:YES];
       // [HHAlertView showAlertWithStyle:HHAlertStyleWraning inView:self.view Title:@"Info" detail:@"No internet connection" cancelButton:nil Okbutton:@"Ok"];
       // [_multiColorLoader stopAnimation];
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Info" message:@"No internet connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
       

    }
     if (![self validateEmail:txt_email.text])
    {
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Info" message:@"Please enter a valid email id" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        
        btn_submit.layer.cornerRadius=btn_submit.frame.size.height/2;
        [btn_submit setBackgroundColor:[UIColor whiteColor]];
        btn_submit.titleLabel.textColor=[UIColor colorWithRed:1.0/255 green:110.0/255 blue:166.0/255 alpha:1.0];
        btn_submit.clipsToBounds=YES;
    }
    
    else
    {
      
        
       // [self activityIndicatorCall];
        if ([self CheckNetwork] == NotReachable)
        {
            NSLog(@"Not Reachable");
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Info" message:@"No internet connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            

        }
        else
       {
            NSLog(@"Reachable");
            
            //------------ Post Method----------//
            
           // [self performSelector:@selector(signUp_function) withObject:self afterDelay:0.000001];
            [MBProgressHUD showHUDAddedTo:self.view animated:NO];
            NSString *str1=[NSString stringWithFormat:@"forgot_password.php?email=%@",txt_email.text];
            
            jsr1=[[JSONRequestHelper alloc]init];
            
            jsr1.delegate=self;
            
            [jsr1 RecieveRequestWithURL:str1];
       }
        
    }
}

- (IBAction)Back_Button:(id)sender
{
    [self.navigationController popViewControllerAnimated:NO];
}

-(void)DidRecieveRequest:(NSDictionary *)Dictionary
{
    NSLog(@"dictonary ---- %@",Dictionary);
    if ([[Dictionary objectForKey:@"success"] isEqualToString:@"true"])
    {
        [MBProgressHUD hideHUDForView:self.view animated:YES];

        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Info" message:[Dictionary objectForKey:@"msg"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        [self.navigationController popViewControllerAnimated:YES];

    }
    else
    {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Info" message:[Dictionary objectForKey:@"msg"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];

    }
    
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}
//- (void)didClickButtonAnIndex:(HHAlertButton)button
//{
//    if (button == HHAlertButtonOk) {
//        NSLog(@"ok Button is seleced use delegate");
//    }
//    else
//    {
//        NSLog(@"cancel Button is seleced use delegate");
//        
//    }
//}

@end
