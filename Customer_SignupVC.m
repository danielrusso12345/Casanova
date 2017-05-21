//
//  SignupVC.m
//  Dalal
//
//  Created by mac on 4/6/16.
//  Copyright © 2016 mac. All rights reserved.
//

#import "Customer_SignupVC.h"
#import "Reachability.h"
#import "LoginViewController.h"
#import "LoginViewController2.h"
#import "termsAndConditionsViewController.h"
//#import "PrivacyPolicyViewController.h"
//#import "Verification_VC.h"
//#import "LoginVC.h"
#import "MBProgressHUD.h"

#import <AssetsLibrary/AssetsLibrary.h>
#import "BRImagePicker.h"
#import "BR_ImageInfo.h"

#define textNum @"0123456789"
#define TextNumericspace @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.~`@#$%^&*()_-+=|\?/>.<':;"

@interface Customer_SignupVC ()
{
    int flagbtn;
    NSString *strinvalid1,*str_txtDate;
    
}
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (nonatomic, strong) NSArray *selectedAssetsArray;
@end

@implementation Customer_SignupVC
@synthesize btn_remember;
@synthesize img_profile;
@synthesize txt_password,txt_email,txt_name,txt_phone,txt_confirm_password,img_view,TF_city,TF_country,btn_sign_up,lbl_bg,lbl_blank;
- (void)viewDidLoad
{
    [super viewDidLoad];
    pref=[NSUserDefaults standardUserDefaults];
    flagbtn=0;
    flag =1;
   // [self doneBar];
    
    lbl_blank.layer.masksToBounds = true;
    lbl_blank.layer.cornerRadius =lbl_blank.frame.size.width/2;// 12.0;
    lbl_blank.layer.borderColor = [UIColor whiteColor].CGColor;
    lbl_blank.layer.borderWidth = 1.0;
    img_view.layer.cornerRadius = img_view.frame.size.width / 2;
    img_view.clipsToBounds = YES;
    btn_sign_up.layer.borderColor = [UIColor whiteColor].CGColor;
    btn_sign_up.layer.borderWidth = 1.0;
    
    pickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    pickerToolbar.barStyle = UIBarStyleBlackOpaque;
    [pickerToolbar sizeToFit];
    
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    
    UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonPressed:)];
    [barItems addObject:cancelBtn];
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [barItems addObject:flexSpace];
    
    
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonPressed:)];
    
    [barItems addObject:doneBtn];
    
    [pickerToolbar setItems:barItems animated:YES];

    txt_phone.inputAccessoryView=pickerToolbar;
    
    lbl_bg.layer.cornerRadius=10.0;
    lbl_bg.clipsToBounds=YES;
    
    btn_sign_up.layer.cornerRadius=btn_sign_up.frame.size.height/2;
    btn_sign_up.clipsToBounds=YES;


  //  [self getAlltype];
    // Do any additional setup after loading the view from its nib.
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (IBAction)back_action:(id)sender {
//    //[self.navigationController popViewControllerAnimated:YES];
//    LoginVC *vc=[[LoginVC alloc]initWithNibName:@"LoginVC" bundle:nil];
//    [self.navigationController pushViewController:vc animated:YES];
//}


- (IBAction)signUp_action:(id)sender 
{
    
    
    NSString *str1 =[self validate];
    
    if ([self CheckNetwork] == NotReachable)
    {
        NSLog(@"Not Reachable");
       
        
         [MBProgressHUD hideAllHUDsForView:self.view animated:true];
        
                UIAlertView *  Myalert=[[UIAlertView alloc]initWithTitle:@"School of Casanova" message:@"No internet connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [Myalert show];
        
       
        
    }
    
    
    else if (str1)
    {
        
        UIAlertView *  Myalert=[[UIAlertView alloc]initWithTitle:@"School of Casanova" message:str1 delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [Myalert show];
        
        btn_sign_up.layer.cornerRadius=btn_sign_up.frame.size.height/2;
            btn_sign_up.layer.borderColor = [UIColor whiteColor].CGColor;
        btn_sign_up.layer.borderWidth = 1.0;
        [btn_sign_up setBackgroundColor:[UIColor colorWithRed:148.0/255 green:110.0/255 blue:131.0/255 alpha:1.0]];
        btn_sign_up.titleLabel.textColor=[UIColor colorWithRed:0.0/255 green:0.0/255 blue:0.0/255 alpha:1.0];
        btn_sign_up.clipsToBounds=YES;
        
    }
    else if (flagbtn==0)
    {
      
        
        UIAlertView *  Myalert=[[UIAlertView alloc]initWithTitle:@"School of Casanova" message:@"Please accept terms & conditions and privacy policies" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [Myalert show];
        
        
    }
    
    else
    {
        [MBProgressHUD showHUDAddedTo:self.view animated:NO];
        
        [self performSelector:@selector(post_Method) withObject:nil afterDelay:1.0];

        
      
    }
}

-(void)post_Method
{
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"pref_token"]length]==0)
    {
        str_StripeToken=@"";
    }
    else
    {
        str_StripeToken=[[NSUserDefaults standardUserDefaults] valueForKey:@"pref_token"];
    }
    
        Ary_Parameter =[[NSMutableArray alloc]initWithObjects:@"username",@"password",@"email",@"device_type",@"device_token",nil];
      //  NSInteger user;
        
        PREF=[NSUserDefaults standardUserDefaults];
      //  user=[PREF integerForKey:@"userID"];
       // NSLog(@"User---> %d",user );
        
        Ary_Value =[[NSMutableArray alloc]initWithObjects:txt_name.text,txt_password.text,txt_email.text,@"ios",str_StripeToken, nil];
        NSLog(@"str value------%@",Ary_Value);
        Ary_Image =[[NSMutableArray alloc]init];
      [Ary_Image addObject:img_view.image];
        //  Ary_Image=[Ary_Image ]
        
        
        post=[[PostFunctionHelper alloc]init];
        post.delegate=self;
         post.str_photo=@"1";
        [post RequestWithURL:@"sign_up.php" :Ary_Parameter :Ary_Value : Ary_Image];
        
        
    
}

-(void)DidRecieveResponse:(NSDictionary *)Dictionary
{
    NSLog(@"dict - %@",Dictionary);
    
    if ([[Dictionary objectForKey:@"success"]isEqualToString:@"true"])
    {
        [MBProgressHUD hideHUDForView:self.view animated:NO];
        
//        NSString *str_user_ID=[NSString stringWithFormat:@"%@",[Dictionary valueForKey:@"user_id"]];
//        
//         [pref setObject:str_user_ID forKey:@"pref_User_Id"];
//         [pref setObject:[Dictionary valueForKey:@"email"] forKey:@"pref_email_sign"];
    
        
        LoginViewController2 *los=[[LoginViewController2 alloc]initWithNibName:@"LoginViewController2" bundle:nil];
        [self.navigationController pushViewController:los animated:NO];
        
        

        
       // NSString *ver=[NSString stringWithFormat:@"%@",[Dictionary objectForKey:@"msg"]];
        
//        if ([ver isEqualToString:@"Sign up successfully. Please check your email for verify your account."])
//        {
//            Verification_VC *LOG=[[Verification_VC alloc]initWithNibName:@"Verification_VC" bundle:nil];
//            [self.navigationController pushViewController:LOG animated:YES];
//        }
        
      
        
       // [self.navigationController popViewControllerAnimated:YES];//pref_email_sign
        
    }
    
    else
    {
        [MBProgressHUD hideHUDForView:self.view animated:NO];
        
       UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"School of Casanova" message:[Dictionary objectForKey:@"msg"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    
    [MBProgressHUD hideHUDForView:self.view animated:NO];
}



-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSCharacterSet *unacceptedInput = nil;
    
    if (textField.tag == 1) {
        
        NSInteger oldLength = [textField.text length];
        NSInteger newLength = oldLength + [string length] - range.length;
        
        unacceptedInput = [[NSCharacterSet characterSetWithCharactersInString:[TextNumericspace stringByAppendingString:@""]] invertedSet];
        if(newLength >= 21){
            return NO;
        }
        return ([[string componentsSeparatedByCharactersInSet:unacceptedInput] count] <= 1);
    }
    if (textField.tag == 2) {
        
        NSInteger oldLength = [textField.text length];
        NSInteger newLength = oldLength + [string length] - range.length;
        
        unacceptedInput = [[NSCharacterSet characterSetWithCharactersInString:[TextNumericspace stringByAppendingString:@""]] invertedSet];
        if(newLength >= 16){
            return NO;
        }
        return ([[string componentsSeparatedByCharactersInSet:unacceptedInput] count] <= 1);
    }
    if (textField.tag == 5) {
        
        NSInteger oldLength = [textField.text length];
        NSInteger newLength = oldLength + [string length] - range.length;
        
        unacceptedInput = [[NSCharacterSet characterSetWithCharactersInString:[TextNumericspace stringByAppendingString:@""]] invertedSet];
        if(newLength >= 16){
            return NO;
        }
        if ((![txt_password.text isEqualToString:@""] ) && txt_confirm_password.text.length>=3)
        {
            btn_sign_up.layer.cornerRadius=btn_sign_up.frame.size.height/2;
             btn_sign_up.layer.borderColor = [UIColor whiteColor].CGColor;
            btn_sign_up.layer.borderWidth = 1.0;
            [btn_sign_up setBackgroundColor:[UIColor whiteColor]];
            btn_sign_up.titleLabel.textColor=[UIColor colorWithRed:148.0/255 green:110.0/255 blue:131.0/255 alpha:1.0];
            btn_sign_up.clipsToBounds=YES;
        }
        return ([[string componentsSeparatedByCharactersInSet:unacceptedInput] count] <= 1);
    }
    if (textField.tag == 3) {
        
        NSInteger oldLength = [textField.text length];
        NSInteger newLength = oldLength + [string length] - range.length;
        
        //unacceptedInput = [[NSCharacterSet characterSetWithCharactersInString:[TextNumericspace stringByAppendingString:@""]] invertedSet];
        if(newLength >= 41){
            return NO;
        }
        return YES;//([[string componentsSeparatedByCharactersInSet:unacceptedInput] count] <= 1);
    }
    if (textField.tag == 4) {
        
        NSInteger oldLength = [textField.text length];
        NSInteger newLength = oldLength + [string length] - range.length;
        
        unacceptedInput = [[NSCharacterSet characterSetWithCharactersInString:[textNum stringByAppendingString:@""]] invertedSet];
        if(newLength >= 16){
            return NO;
        }
        return ([[string componentsSeparatedByCharactersInSet:unacceptedInput] count] <= 1);
    }
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (self.view.bounds.size.height==480)
    {
        if (textField.tag == 1)
        {
            //[self animateTextField:textField up:YES];
        }
        else if (textField.tag == 2)
        {
            [self animateTextField:textField up:YES];
        }
        else if (textField.tag == 3)
        {
            
            //[self animateTextField:textField up:YES];
        }
//        else if (textField.tag == 4)
//        {
//            senderTag=textField.tag;
//            txt_phone.text=@"";
//            NSLog(@"sender tag-----%ld",senderTag);
//           // [self.txt_phone setInputView:view1];
//             [self animateTextField:textField up:YES];
//            
//        }
        else if (textField.tag == 5)
        {
            
            [self animateTextField:textField up:YES];
        }
//        else if (textField.tag == 11)
//        {
//            [self animateTextField:textField up:YES];
//            if ([Arr_provinace count]!=0)
//            {
//                
//                
//                
//                
//                arr_picker=Arr_provinace;
//                
//                senderTag=textField.tag;
//                
//                NSLog(@"sender tag-----%ld",senderTag);
//                
//                NSLog(@"ArrCategory-----%@",arr_picker);
//                [picker1 reloadAllComponents];
//            }
//            else
//            {
//                [picker1 reloadAllComponents];
//                [self.view endEditing:YES];
//                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"No provinace Found" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//                [alert show];
//            }
//            
//        }
//        else if (textField.tag == 12)
//        {
//            [self animateTextField:textField up:YES];
//           
//            // [Arr_Brand_id_in removeAllObjects];
//            [self getAllSize];
//            senderTag=textField.tag;
//           
//            
//            if ([Arr_city count]!=0)
//            {
//                
//                arr_picker=Arr_city;
//                
//                NSLog(@"sender tag-----%ld",senderTag);
//                
//                NSLog(@"ArrCharity-----%@",arr_picker);
//                
//                [picker1 reloadAllComponents];
//            }
//            else
//            {
//                [picker1 removeFromSuperview];
//                
//                [pickerToolbar removeFromSuperview];
//                
//                [textField resignFirstResponder];
//                
//                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"No city Found" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//                [alert show];
//                
//            }
//            //            if ([arr_city count]!=0)
//            //            {
//            //
//            //
//            //
//            //
//            //                arr_picker=arr_city;
//            //
//            //                senderTag=textField.tag;
//            //
//            //                NSLog(@"sender tag-----%ld",senderTag);
//            //
//            //                NSLog(@"ArrCategory-----%@",arr_picker);
//            //                [picker1 reloadAllComponents];
//            //            }
//            //            else
//            //            {
//            //                [picker1 reloadAllComponents];
//            //                [self.view endEditing:YES];
//            //                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"No city Found" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//            //                [alert show];
//            //            }
//            
//        }
    }
    else
    {
        if (textField.tag == 1)
        {
           // [self animateTextField:textField up:YES];
        }
        else if (textField.tag == 2)
        {
           // [self animateTextField:textField up:YES];
        }
       else if (textField.tag == 3)
        {
            //[self animateTextField:textField up:YES];
        }
        else if (textField.tag == 4)
        {
            senderTag=textField.tag;
            txt_phone.text=@"";
            NSLog(@"sender tag-----%ld",senderTag);
           // [self.txt_phone setInputView:view1];
             [self animateTextField:textField up:YES];
            
        }
        else if (textField.tag == 5)
        {
            
           [self animateTextField:textField up:YES];
        }
//        else if (textField.tag == 11)
//        {
//            [self animateTextField:textField up:YES];
//            if ([Arr_provinace count]!=0)
//            {
//                
//                
//                
//                
//                arr_picker=Arr_provinace;
//                
//                senderTag=textField.tag;
//                
//                NSLog(@"sender tag-----%ld",senderTag);
//                
//                NSLog(@"ArrCategory-----%@",arr_picker);
//                [picker1 reloadAllComponents];
//            }
//            else
//            {
//                [picker1 reloadAllComponents];
//                [self.view endEditing:YES];
//                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"No provinace Found" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//                [alert show];
//            }
//            
//        }
//        else if (textField.tag == 12)
//        {
//            [self animateTextField:textField up:YES];
//            // [Arr_Brand_id_in removeAllObjects];
//            [self getAllSize];
//            senderTag=textField.tag;
//            
//            
//            if ([Arr_city count]!=0)
//            {
//                
//                arr_picker=Arr_city;
//                
//                NSLog(@"sender tag-----%ld",senderTag);
//                
//                NSLog(@"ArrCharity-----%@",arr_picker);
//                
//                [picker1 reloadAllComponents];
//            }
//            else
//            {
//                [picker1 removeFromSuperview];
//                
//                [pickerToolbar removeFromSuperview];
//                
//                [textField resignFirstResponder];
//                
//                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"No city Found" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//                [alert show];
//                
//            }
//        }
    }
}
-(void)animateTextField:(UITextField*)textField up:(BOOL)up
{
    
    if (self.view.bounds.size.height==480)
    {
        int a;
        a= 580-(textField.frame.origin.y+420);
        
        const int movementDistance = a;
        const float movementDuration = 0.3f;
        
        int movement = (up ? movementDistance : -movementDistance);
        
        [UIView beginAnimations: @"animateTextField" context: nil];
        [UIView setAnimationBeginsFromCurrentState: YES];
        [UIView setAnimationDuration: movementDuration];
        self.view.frame = CGRectOffset(self.view.frame, 0, movement);
        [UIView commitAnimations];
    }
    else
    {
        int a;
        a= 580-(textField.frame.origin.y+320);
        
        const int movementDistance = a;
        const float movementDuration = 0.3f;
        
        int movement = (up ? movementDistance : -movementDistance);
        
        [UIView beginAnimations: @"animateTextField" context: nil];
        [UIView setAnimationBeginsFromCurrentState: YES];
        [UIView setAnimationDuration: movementDuration];
        self.view.frame = CGRectOffset(self.view.frame, 0, movement);
        [UIView commitAnimations];
        
    }
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSString *string = textField.text;
    NSString *trimmedString = [string stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceCharacterSet]];
    textField.text = trimmedString;
    
    if (self.view.bounds.size.height==480)
    {
        if (textField.tag == 1)
        {
           // [self animateTextField:textField up:NO];
        }
        else if (textField.tag == 2)
        {
            [self animateTextField:textField up:NO];
        }
        else if (textField.tag == 3)
        {
            
            //[self animateTextField:textField up:NO];
        }
        else if (textField.tag == 4)
        {
          //  [self doneBar];
           [self animateTextField:textField up:NO];
        }
        else if (textField.tag == 5)
        {
            
           [self animateTextField:textField up:NO];
            
            if ((![txt_password.text isEqualToString:@""] ) && txt_confirm_password.text.length>=3)
            {
                btn_sign_up.layer.cornerRadius=btn_sign_up.frame.size.height/2;
                 btn_sign_up.layer.borderColor = [UIColor whiteColor].CGColor;
                btn_sign_up.layer.borderWidth = 1.0;
                [btn_sign_up setBackgroundColor:[UIColor whiteColor]];
                btn_sign_up.titleLabel.textColor=[UIColor colorWithRed:148.0/255 green:110.0/255 blue:131.0/255 alpha:1.0];
                btn_sign_up.clipsToBounds=YES;
            }

        }
        else if (textField.tag == 11)
        {
            
            [self animateTextField:textField up:NO];
        }
        else if (textField.tag == 12)
        {
            
            [self animateTextField:textField up:NO];
        }
    }
    else
    {
        if (textField.tag == 1)
        {
           // [self animateTextField:textField up:NO];
        }
        else if (textField.tag == 2)
        {
           // [self animateTextField:textField up:NO];
        }
        else if (textField.tag == 3)
        {
           // [self animateTextField:textField up:NO];
        }
        else if (textField.tag == 4)
        {
            [self animateTextField:textField up:NO];
        }
        else if (textField.tag == 5)
        {
            [self animateTextField:textField up:NO];
            
            if ((![txt_password.text isEqualToString:@""] ) && txt_confirm_password.text.length>=3)
            {
                btn_sign_up.layer.cornerRadius=btn_sign_up.frame.size.height/2;
                 btn_sign_up.layer.borderColor = [UIColor whiteColor].CGColor;
                btn_sign_up.layer.borderWidth = 1.0;
                [btn_sign_up setBackgroundColor:[UIColor whiteColor]];
                btn_sign_up.titleLabel.textColor=[UIColor colorWithRed:148.0/255 green:110.0/255 blue:131.0/255 alpha:1.0];
                btn_sign_up.clipsToBounds=YES;
            }
        }
        else if (textField.tag == 11)
        {
            
            [self animateTextField:textField up:NO];
        }
        else if (textField.tag == 12)
        {
            
            [self animateTextField:textField up:NO];
        }
        
    }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
///////--------validation---------/////////

-(NSString *)validate
{
    NSString *strinvalid;
    if(flag==1)
    {
        strinvalid=@"Please add a photo";
    }
   
    else if ([txt_name.text isEqualToString:@""])
    {
        strinvalid=@"Please enter a name";
        //return strinvalid;
    }
    else if (![self validateEmail:txt_email.text])
    {
        strinvalid=@"Please enter a valid email";
        //return strinvalid;
        
    }
    else if([txt_password.text isEqualToString:@""])
    {
        strinvalid=@"Please enter a password";
        //return strinvalid;
    }
    else if([txt_password.text isEqualToString:@""]|| [txt_password.text isEqualToString:@"NA"] || txt_password.text.length<=3)
    {
        strinvalid=@"Please Enter Password Minimum 4 & Maximum 15 characters to Continue";
    }
    else if([txt_confirm_password.text isEqualToString:@""]|| [txt_confirm_password.text isEqualToString:@"NA"])
    {
        strinvalid=@" Please Confirm Password";
    }
    else if ((![txt_password.text isEqualToString:txt_confirm_password.text]))
    {
        strinvalid=@"Please enter matching passwords";
    }
//    else if([txt_phone.text isEqualToString:@""]|| [txt_phone.text isEqualToString:@"NA"] || txt_phone.text.length<=4)
//    {
//        NSLog(@"Txt Phone Number : %@",txt_phone.text);
//        strinvalid=@"Please Enter Phone Number minimum 5 & maximum 15 character to continue";
//    }
//    else if([TF_country.text isEqualToString:@""])
//    {
//        strinvalid=@" Please select province";
//    }
//    else if([TF_city.text isEqualToString:@""])
//    {
//        strinvalid=@" Please select city";
//    }

    
    
    //   else if (flagbtn==0)
    //    {
    //     strinvalid=@"Please accept terms & conditions and privacy policies";
    //        return strinvalid;
    //    }
    //    else
    //    {
    //        strinvalid=nil;
    //    }
    return strinvalid;
    
}

- (BOOL) validateEmail: (NSString *) candidate
{
    NSString *emailRegex = @"[a-z0-9A-Z]+([._%+-]{1}[a-z0-9A-Z]+)*@[a-z0-9A-Z]+([.-]{1}[a-z0-9A-Z]+)*(\\.[a-zA-Z]{2,4})";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:candidate];
}
-(BOOL)CheckNetwork
{
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.google.com"];
    NetworkStatus NetworkStatus = [reachability currentReachabilityStatus];
    return NetworkStatus;
}

- (IBAction)rememberr_action1:(id)sender {
    if (flagbtn==0)
    {
        
        [btn_remember setBackgroundImage:[UIImage imageNamed:@"checked24.png"] forState:UIControlStateNormal];
        flagbtn=1;
         //_signup.enabled=YES;
        //NSLog(@"Email-->%@\nPass-->%@",)
    }
    else
    {
        [btn_remember setBackgroundImage:[UIImage imageNamed:@"unch24.png"] forState:UIControlStateNormal];
       
       // _signup.enabled =NO;
        flagbtn=0;
        
    }
}

-(IBAction)LOGIN_ACTON:(id)sender
{
    LoginViewController *LOG=[[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    [self.navigationController pushViewController:LOG animated:YES];
}

-(void)doneButtonPressed:(UIButton*)sender
{
    
    NSLog(@"text Field Close ==%ld",(long)sender.tag);
    
    [txt_phone resignFirstResponder];
   // [txt_postalCode resignFirstResponder];
}

-(void)cancelButtonPressed:(UIButton*)sender{
    
    NSLog(@"text Field Close ==%ld",(long)sender.tag);
    
    
    [txt_phone resignFirstResponder];
    //[txt_postalCode resignFirstResponder];
}

-(IBAction)TERMS_AND_CONDITION:(id)sender
{
    termsAndConditionsViewController *TERM=[[termsAndConditionsViewController alloc]initWithNibName:@"termsAndConditionsViewController" bundle:nil];
    TERM.str_terms=@"1";
    [self.navigationController pushViewController:TERM animated:YES];
}
//
//-(IBAction)PRIVACY_POLACEY:(id)sender
//{
//    PrivacyPolicyViewController *TERM1=[[PrivacyPolicyViewController alloc]initWithNibName:@"PrivacyPolicyViewController" bundle:nil];
//    TERM1.str_privacy=@"1";
//    [self.navigationController pushViewController:TERM1 animated:YES];
//    
//}


//
//-(IBAction)ChoosePhoto:(UIButton*)sender
//{
//    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Choose From Library",@"Take Photo", nil];
//    [actionSheet showInView:self.view];
//}
//
//- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
//{
//    switch (buttonIndex)
//    {
//        case 0:
//        {    NSLog(@"Choose From Library");
//            
//            ipc= [[UIImagePickerController alloc]init];
//            ipc.delegate = self;
//            ipc.navigationBar.barStyle = UIBarStyleBlackTranslucent;
//            ipc.navigationBar.barTintColor = [UIColor colorWithRed:185.0/255 green:2.0/255 blue:30.0/255 alpha:1.0]; // Background color
//            ipc.navigationBar.tintColor = [UIColor whiteColor]; // Cancel button ~ any UITabBarButton items
//            
//            ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//            
//            if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone)
//                [self presentViewController:ipc animated:YES completion:nil];
//            else
//            {
//                popover = [[UIPopoverController alloc]initWithContentViewController:ipc];
//                [popover presentPopoverFromRect:self.view.frame inView:self.view
//                       permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
//            }
//            
//            break;
//        }
//        case 1:
//        {    NSLog(@" Take Photo");
//            
//            if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
//            {   // Has camera
//                
//                ipc= [[UIImagePickerController alloc]init];
//                ipc.delegate = self;
//                
//                /////  For Camera   /////
//                ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
//                
//                if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone)
//                    [self presentViewController:ipc animated:YES completion:nil];
//                else
//                {
//                    popover = [[UIPopoverController alloc]initWithContentViewController:ipc];
//                    [popover presentPopoverFromRect:self.view.frame inView:self.view
//                           permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
//                }
//            }
//            else
//            {
//                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Information" message:@"Sorry ! Camera is not present in this device" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
//                [alert show];
//            }
//            
//            
//            break;
//        }
//        default:
//            break;
//    }
//}
//-(void)imagePickerController:(UIImagePickerController *)picker
//didFinishPickingMediaWithInfo:(NSDictionary *)info
//{
//    flag=2;
//    
//    img_view.image = [info objectForKey:UIImagePickerControllerOriginalImage];
//    
//    
//    
//    
//    if(UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone)
//    {
//        [picker dismissViewControllerAnimated:YES completion:nil];
//    }
//    else
//    {
//        [popover dismissPopoverAnimated:YES];
//    }
//    
//    
//    
//    img_view.image = [info objectForKey:UIImagePickerControllerOriginalImage];
//    
//    
//    
//    ////////// Croping image in SQUARE Shape
//    
//    
//    CGSize imageSize = img.image.size;
//    
//    CGFloat width = imageSize.width;
//    
//    CGFloat height = imageSize.height;
//    
//    if (width != height) {
//        
//        CGFloat newDimension = MIN(width, height);
//        
//        CGFloat widthOffset = (width - newDimension) / 2;
//        
//        CGFloat heightOffset = (height - newDimension) / 2;
//        
//        UIGraphicsBeginImageContextWithOptions(CGSizeMake(newDimension,
//                                                          newDimension), YES, 1.0);
//        
//        
//        
//        [img_view.image drawAtPoint:CGPointMake(-widthOffset, -heightOffset)
//         
//                          blendMode:kCGBlendModeCopy
//         
//                              alpha:1.];
//        
//        img_view.image = UIGraphicsGetImageFromCurrentImageContext();
//        
//        UIGraphicsEndImageContext();
//        
//        
//        
//        ////////// to show square shape on camera screen and crop
//        
//        //http://stackoverflow.com/questions/17712797/ios-custom-uiimagepickercontroller-camera-crop-to-square
//        
//        
//        
//        if (img_view.image.imageOrientation==UIImageOrientationLeft
//            || img_view.image.imageOrientation == UIImageOrientationLeftMirrored)
//            
//        {
//            
//            CGAffineTransform transform = CGAffineTransformIdentity;
//            
//            transform = CGAffineTransformTranslate(transform,
//                                                   img_view.image.size.width, 0);
//            
//            transform = CGAffineTransformRotate(transform, M_PI_2);
//            
//            
//            
//            
//            
//            CGContextRef ctx = CGBitmapContextCreate(NULL,
//                                                     img_view.image.size.width, img_view.image.size.height,
//                                                     
//                                                     
//                                                     CGImageGetBitsPerComponent(img_view.image.CGImage), 0,
//                                                     
//                                                     
//                                                     CGImageGetColorSpace(img_view.image.CGImage),
//                                                     
//                                                     
//                                                     CGImageGetBitmapInfo(img.image.CGImage));
//            
//            CGContextConcatCTM(ctx, transform);
//            
//            CGContextDrawImage(ctx,
//                               CGRectMake(0,0,img_view.image.size.height,img_view.image.size.width),
//                               img_view.image.CGImage);
//            
//            CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
//            
//            UIImage *img2 = [UIImage imageWithCGImage:cgimg];
//            
//            CGContextRelease(ctx);
//            
//            CGImageRelease(cgimg);
//            
//            
//            
//            img_view.image =img2;
//            
//        }
//        
//        NSLog(@"image orientation value : %ld",img_view.image.imageOrientation);
//        
//        
//        
//    }
//    
//    
//    
//}
//-(UIImage *) resizeImage:(UIImage *)orginalImage resizeSize:(CGSize)size
//{
//    CGFloat actualHeight = orginalImage.size.height;
//    CGFloat actualWidth = orginalImage.size.width;
//    
//    float oldRatio = actualWidth/actualHeight;
//    float newRatio = size.width/size.height;
//    if(oldRatio < newRatio)
//    {
//        oldRatio = size.height/actualHeight;
//        actualWidth = oldRatio * actualWidth;
//        actualHeight = size.height;
//    }
//    else
//    {
//        oldRatio = size.width/actualWidth;
//        actualHeight = oldRatio * actualHeight;
//        actualWidth = size.width;
//    }
//    
//    CGRect rect = CGRectMake(0.0,0.0,actualWidth,actualHeight);
//    UIGraphicsBeginImageContext(rect.size);
//    [orginalImage drawInRect:rect];
//    orginalImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return orginalImage;
//}


//
//-(void)getAlltype
//{
//    
//    
//    if ([self CheckNetwork] == NotReachable)
//    {
//        NSLog(@"Not Reachable");
//        
//        
//        UIAlertView *  alert=[[UIAlertView alloc]initWithTitle:@"Information Message" message:@"NO Internet Connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//        [alert show];
//    }
//    else
//    {
//        NSLog(@"Reachable");
//        
//        NSString *str123=[NSString stringWithFormat:@"http://bringmestyle.com/webservice/get_all_province.php"];
//        
//        NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:str123]];
//        
//        [request setHTTPMethod:@"GET"];
//        [request setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"content-type"];
//        NSError *error;
//        NSURLResponse *response;
//        NSData *responseData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
//        NSDictionary *jsonDist=[NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
//        
//        NSLog(@"jsonDist = %@",jsonDist);
//        
//        Arr_provinace=[[jsonDist objectForKey:@"data"]valueForKey:@"province_name"];
//        Arr_provinace_id=[[jsonDist objectForKey:@"data"]valueForKey:@"province_id"];
//        
//       // [self getAllSize];
//        
//    }
//}
//
//-(void)getAllSize
//{
//    
//    
//    if ([self CheckNetwork] == NotReachable)
//    {
//        NSLog(@"Not Reachable");
//        
//        
//        UIAlertView *  alert=[[UIAlertView alloc]initWithTitle:@"Information Message" message:@"NO Internet Connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//        [alert show];
//    }
//    else
//    {
//        NSLog(@"Reachable");
//        
//        NSString *str123=[NSString stringWithFormat:@"http://bringmestyle.com/webservice/get_city_by_province_id.php?province_id=%@",str_provinace_id];
//        
//        NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:str123]];
//        
//        [request setHTTPMethod:@"GET"];
//        [request setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"content-type"];
//        NSError *error;
//        NSURLResponse *response;
//        NSData *responseData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
//        NSDictionary *jsonDist=[NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
//        
//        NSLog(@"jsonDist = %@",jsonDist);
//        
//        Arr_city=[[jsonDist objectForKey:@"data"]valueForKey:@"city_name"];
//        Arr_city_id=[[jsonDist objectForKey:@"data"]valueForKey:@"city_id"];
//       
//        
//    }
//}

-(IBAction)openpicker:(UITextField*)sender
{
    picker1 = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 44, 0, 0)];
    picker1.delegate=self;
    picker1.dataSource=self;
    picker1.hidden = NO;
    picker1.backgroundColor = [UIColor whiteColor];
    pickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    pickerToolbar.barStyle = UIBarStyleBlackOpaque;
    [pickerToolbar sizeToFit];
    
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    
    UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonPressed1:)];
    cancelBtn.tag=sender.tag;
    
    
    [cancelBtn setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                       [UIFont fontWithName:@"Sansation" size:20.0], NSFontAttributeName,
                                       [UIColor whiteColor], NSForegroundColorAttributeName,
                                       nil]
                             forState:UIControlStateNormal];
    
    [barItems addObject:cancelBtn];
    
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [barItems addObject:flexSpace];
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonPressed1:)];
    doneBtn.tag=sender.tag;
    
    [doneBtn setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                     [UIFont fontWithName:@"Sansation" size:20.0], NSFontAttributeName,
                                     [UIColor whiteColor], NSForegroundColorAttributeName,
                                     nil]
                           forState:UIControlStateNormal];
    
    [barItems addObject:doneBtn];
    
    [pickerToolbar setItems:barItems animated:YES];
    
    
    UITextField *TF=(UITextField *)[self.view viewWithTag:sender.tag];
    [TF setInputView:picker1];
    TF.inputAccessoryView=pickerToolbar;
    
}

//////-----------Touch Event----------------///////////

-(void)dismissKeyboard
{
    [self.view endEditing:YES];
}

-(void)doneButtonPressed1:(UIButton*)sender
{
    UITextField * tf=(UITextField *)[self.view viewWithTag:sender.tag];
    [tf resignFirstResponder];
    
    if(senderTag==10)
    {
        
        NSLog(@"sender tag12-----%ld",senderTag);
        NSLog(@"country Array value= %@",str_All);
        // TF_provinace.enabled=YES;
        
        NSInteger row = [picker1 selectedRowInComponent:0];
        
        //Choose it for other components
        
        NSString *yourIndustry  = [arr_picker objectAtIndex:row];
        
        NSLog(@"arr1 value--%@",yourIndustry);
        
        TF_country.text=yourIndustry;
        
        //  str_type_id =[Arr_type_id objectAtIndex:row];
        
        [picker1 removeFromSuperview];
        
        [pickerToolbar removeFromSuperview];
        
        [tf resignFirstResponder];
        
        
        
        str_All=@"";
    }
    
    if(senderTag==11)
    {
        TF_city.enabled=YES;
        TF_city.text=@"";
        NSInteger row = [picker1 selectedRowInComponent:0];
        
        //Choose it for other components
        
        NSString *yourIndustry  = [arr_picker objectAtIndex:row];
        
        NSLog(@"arr1 value--%@",yourIndustry);
        
        TF_country.text=yourIndustry;
        
        
        
        
        str_provinace_id =[Arr_provinace_id objectAtIndex:row];
        
        
        [picker1 removeFromSuperview];
        
        [pickerToolbar removeFromSuperview];
        
        [tf resignFirstResponder];
        
        
        str_All=@"";
    }
    
    if(senderTag==12)
    {
        
        NSInteger row = [picker1 selectedRowInComponent:0];
        
        //Choose it for other components
        
        NSString *yourIndustry  = [arr_picker objectAtIndex:row];
        
        NSLog(@"arr1 value--%@",yourIndustry);
        
        TF_city.text=yourIndustry;
        
        
        
        
        str_city_id =[Arr_city_id objectAtIndex:row];
        NSString *STR_lat=[Arr_lat objectAtIndex:row];
        [pref setObject:STR_lat forKey:@"pref_lt11_customer"];
        NSString *STR_long=[Arr_log objectAtIndex:row];
        [pref setObject:STR_long forKey:@"pref_ln12_customer"];
        
        
//        marker.position = CLLocationCoordinate2DMake([[pref valueForKey:@"pref_lt11"] floatValue], [[pref valueForKey:@"pref_ln12"] floatValue]);
//        
//        
//        CGPoint point = [gms.projection pointForCoordinate:marker.position];
//        point.x = point.x ;
//        GMSCameraUpdate * camera =[GMSCameraUpdate setTarget:[gms.projection coordinateForPoint:point]];
//        gms.camera = [GMSCameraPosition cameraWithTarget:marker.position zoom:6];
//        [gms animateWithCameraUpdate:camera];
        [picker1 removeFromSuperview];
        
        [pickerToolbar removeFromSuperview];
        
        [tf resignFirstResponder];
        
        
        str_All=@"";
    }
    
    
    
    
}

-(void)cancelButtonPressed1:(UIButton*)sender{
    
    NSLog(@"text Field Close ==%ld",(long)sender.tag);
    //    if (sender.tag==10)
    //    {
    //        TF_provinace.enabled=NO;
    //        TF_city.enabled=NO;
    //    }
    //    if (sender.tag==11)
    //    {
    //
    //    }
    
    UITextField * tf=(UITextField *)[self.view viewWithTag:sender.tag];
    [tf resignFirstResponder];
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return arr_picker.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [arr_picker objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    str_picker=[arr_picker objectAtIndex:row];
    
    NSLog(@"Text Selected == %@",str_picker);
    
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel* tView = (UILabel*)view;
    if (!tView)
    {
        tView = [[UILabel alloc] init];
        [tView setFont:[UIFont fontWithName:@"Sansation" size:24.0]];
        
        [tView setTextAlignment:NSTextAlignmentCenter];
        [tView setBackgroundColor:[UIColor lightGrayColor]];
        tView.numberOfLines=3;
    }
    // Fill the label text here
    tView.text=[arr_picker objectAtIndex:row];
    return tView;
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:str_picker attributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
    
    return attString;
    
}
-(IBAction)BACK:(id)sender
{
    [self.navigationController popViewControllerAnimated:NO];
}

- (IBAction)BtnImage:(id)sender

{
    
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Choose profile picture"
                            
                                                      message:@""
                            
                                                     delegate:self
                            
                                            cancelButtonTitle:@"Cancel"
                            
                                            otherButtonTitles:@"Camera", @"Gallery",nil];
    
    
    
    
    
    [message show];
    
    
    
}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex

{
    
    //NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
    
    
    if (buttonIndex == 0)
        
    {
        
        NSLog(@"Button 1 was selected.");
        
    }
    
    else if(buttonIndex == 1)
        
    {
        
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            
            
            UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                        
                                                                  message:@"Device has no camera"
                                        
                                                                 delegate:nil
                                        
                                                        cancelButtonTitle:@"OK"
                                        
                                                        otherButtonTitles: nil];
            
            
            
            [myAlertView show];
            
            
            
        }
        
        else
            
        {
            
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            picker.delegate = self;
            picker.allowsEditing = NO;
            picker.navigationBarHidden = YES;
            [self presentViewController:picker animated:YES completion:NULL];
            
            
        }
        
    }
    
    
    
    else if(buttonIndex == 2)
        
    {
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.delegate = self;
        picker.allowsEditing = NO;
        picker.navigationBarHidden = YES;
        [self presentViewController:picker animated:YES completion:NULL];
        
    }
    
}





- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info

{
    flag=2;
    //    UIImage *image = info[UIImagePickerControllerEditedImage];
    //    [picker dismissViewControllerAnimated:YES completion:NULL];
    //    image = [info objectForKey:UIImagePickerControllerEditedImage];
    //    if (image.imageOrientation==UIImageOrientationLeft || image.imageOrientation == UIImageOrientationLeftMirrored)
    //    {
    //        CGAffineTransform transform = CGAffineTransformIdentity;
    //        transform = CGAffineTransformTranslate(transform, image.size.width, 0);
    //        transform = CGAffineTransformRotate(transform, M_PI_2);
    //        CGContextRef ctx = CGBitmapContextCreate(NULL, image.size.width, image.size.height,CGImageGetBitsPerComponent(image.CGImage), 0,CGImageGetColorSpace(image.CGImage),CGImageGetBitmapInfo(image.CGImage));
    //
    //            CGContextConcatCTM(ctx, transform);
    //            CGContextDrawImage(ctx, CGRectMake(0,0,image.size.height,image.size.width), image.CGImage);
    //            CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    //            UIImage *img15 = [UIImage imageWithCGImage:cgimg];
    //             CGContextRelease(ctx);
    //        CGImageRelease(cgimg);
    //        image =img15;
    //        img_view.image = img15;
    //    }
    //    else
    //    {
    //        img_view.image = image;
    //    }
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    PhotoTweaksViewController *photoTweaksViewController = [[PhotoTweaksViewController alloc] initWithImage:image];
    photoTweaksViewController.delegate = self;
    photoTweaksViewController.autoSaveToLibray = NO;
    photoTweaksViewController.maxRotationAngle = M_PI_4;
    [picker pushViewController:photoTweaksViewController animated:NO];
    //img_view.image = image;
    
//    if (![TV_terms.text isEqualToString:@"TITLE (35 CHARACTERS LIMIT)"])
//    {
//        if (TV_terms.text.length>0)
//        {
//            if(flag==2)
//            {
//                btn_attach.backgroundColor=[UIColor colorWithRed:86.0/255.0 green:82.0/255.0 blue:100.0/255.0 alpha:1.0f];
//                [btn_attach setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//                [btn_attach setTitle:@"ATTACHED" forState:UIControlStateNormal];
//            }
//        }
//    }
    
    
    
}

- (void)photoTweaksController:(PhotoTweaksViewController *)controller didFinishWithCroppedImage:(UIImage *)croppedImage
{
    [controller dismissViewControllerAnimated:YES completion:NULL];
    img_view.image =croppedImage;
    
//    if (![TV_terms.text isEqualToString:@"TITLE (35 CHARACTERS LIMIT)"])
//    {
//        if (TV_terms.text.length>0)
//        {
//            if(flag==2)
//            {
//                btn_attach.backgroundColor=[UIColor colorWithRed:86.0/255.0 green:82.0/255.0 blue:100.0/255.0 alpha:1.0f];
//                [btn_attach setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//                [btn_attach setTitle:@"ATTACHED" forState:UIControlStateNormal];
//            }
//        }
//    }
}

- (void)photoTweaksControllerDidCancel:(PhotoTweaksViewController *)controller
{
    [controller.navigationController popViewControllerAnimated:NO];
}


@end
