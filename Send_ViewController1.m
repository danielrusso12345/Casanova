//
//  After_sign_in _provider_ViewController.m
//  Yubna
//
//  Created by Mac on 4/6/16.
//  Copyright (c) 2016 Young Decade. All rights reserved.
//

#import "Send_ViewController1.h"
//#import "Add_sub_category_ViewController1.h"
#import <MobileCoreServices/UTCoreTypes.h>
#import "Reachability.h"
#import "MBProgressHUD.h"
//#import "DEMONavigationController.h"
//#import "DEMOMenuViewController.h"
#import "AppDelegate.h"
#import "MY_AllChat_Start_ViewController.h"
#import "MY_AllChat2_ViewController.h"
//#import "Home_ViewController.h"
//#import "Donate_ViewController.h"
#import "ZYQAssetPickerController.h"
#define numeric @"1234567890"
#define numericDecimal @"1234567890."
#define TextNumeric @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
#define TextNumericspace @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789: "
#define TextALPHABATES @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz "
#define TextALPHABATES1 @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz "
//#import "UIImagePickerController+HiddenAPIs.h"

@interface Send_ViewController1 ()<ZYQAssetPickerControllerDelegate>
{
    UIPopoverController *popoverController;
    UIBarButtonItem *doneButton;
    int IMAGE_COUNTER;
}

@end

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


@implementation Send_ViewController1
@synthesize TF_price,TF_category,TF_sub_category,TV_terms,str_project_id,lbl_bg11,img_view,Start_time4,Start_time3,Start_time2,Start_time1,End_time4,End_time3,End_time2,End_time1,btn_back,str_service_id,str_dec,str_update_cat_name,str_update_image,str_start_price,str_staff,str_update_cat_id,Str_flag_update,str_sub_cate,lbl_heading,btn_update,btn_add,Str_sub_category_name,str_end_price,img11,str_dure,lbl_blank,lbl_color,btn_attach,btn_next,lbl_title,image_view,chosenImages,Str_flag_update_message,str_pages;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
        self.navigationController.navigationBarHidden=YES;
    pref=[NSUserDefaults standardUserDefaults];
//    if ([[pref valueForKey:@"pref_staff_flag"]isEqualToString:@"no"])
//    {
//        btn_back.hidden=YES;
//    }
     img_view.image=image_view;
    lbl_heading.text=[pref valueForKey:@"pref_cat_name"];
    lbl_title.text=str_sub_cate;
    lbl_color.layer.masksToBounds = true;
    lbl_color.layer.cornerRadius =12.0; //lbl_color.frame.size.width/2;
    lbl_color.layer.borderColor = [UIColor grayColor].CGColor;
    lbl_color.layer.borderWidth = 1.0;
    
    lbl_blank.layer.masksToBounds = true;
    lbl_blank.layer.cornerRadius = lbl_blank.frame.size.width/2;
    lbl_blank.layer.borderColor = [UIColor grayColor].CGColor;
    lbl_blank.layer.borderWidth = 1.0;
    
    btn_next.layer.masksToBounds = true;
    btn_next.layer.cornerRadius = 5.0;
    btn_next.layer.borderColor = [UIColor colorWithRed:148.0/255 green:110.0/255 blue:131.0/255 alpha:1.0].CGColor;
    btn_next.layer.borderWidth = 1.0;
    btn_attach.layer.masksToBounds = true;
    btn_attach.layer.cornerRadius = 5.0;
    btn_attach.layer.borderColor = [UIColor grayColor].CGColor;
    btn_attach.layer.borderWidth = 1.0;

    
    lbl_title.text=str_dure;
//    btn_attach.layer.masksToBounds = true;
//    btn_attach.layer.cornerRadius = 5.0;
//    btn_attach.layer.borderColor = [UIColor colorWithRed:219.0/255 green:84.0/255 blue:97.0/255 alpha:1.0].CGColor;
//    btn_attach.layer.borderWidth = 1.0;
   // btn_newpost.layer.cornerRadius = 5.0;
    arr_time_data=[[NSMutableArray alloc]initWithObjects:@"06:00 AM",@"06:30 AM",@"07:00 AM",@"07:30 AM",@"08:00 AM",@"08:30 AM",@"09:00 AM",@"09:30 AM",@"10:00 AM",@"10:30 AM",@"11:00 AM",@"11:30 AM",@"12:00 PM",@"12:30 PM",@"01:00 PM",@"01:30 PM",@"02:00 PM",@"02:30 PM",@"03:00 PM",@"03:30 PM",@"04:00 PM",@"04:30 PM",@"05:00 PM",@"05:30 PM",@"06:00 PM",@"06:30 PM",@"07:00 PM",@"07:30 PM",@"08:00 PM",@"08:30 PM",@"09:00 PM",@"09:30 PM",@"10:00 PM",@"10:30 PM",@"11:00 PM", nil];
    
            btn_update.hidden=YES;
        
        flag=1;
       TV_terms.text=@"Ask me anything...";
        
    [TV_terms.layer setBorderColor:[UIColor colorWithRed:86.0/255.0 green:82.0/255.0 blue:100.0/255.0 alpha:1.0f].CGColor];
        [TV_terms.layer setBorderWidth:1.0];
        TV_terms.clipsToBounds = YES;
    TV_terms.layer.masksToBounds = true;
    TV_terms.layer.cornerRadius = 5.0;


    lbl_bg11.layer.masksToBounds = true;
    
    lbl_bg11.layer.cornerRadius = 5.0;
    
    // arr_cat_name=[[NSMutableArray alloc]initWithObjects:@"sushil",@"kripa",@"jay",@"pawan",@"ankit",@"diksha",@"sanjay",@"ruchi", nil];
  //  self.navigationController.navigationBarHidden=NO;
    //self.title = @"Bid on the project";
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
//                                             initWithImage:[UIImage imageNamed:@"dot32.png"] style:UIBarButtonItemStylePlain target:(DEMONavigationController *)self.navigationController action:@selector(showMenu)];
   
    
    
    view2=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 200)];
    
    
    // Do any additional setup after loading the view from its nib.
    
    
    keyboardToolbar1 = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0,320, 44)];
    
    [keyboardToolbar1 setBarStyle:UIBarStyleBlackTranslucent];
    
    UIBarButtonItem *cancel1 = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:self action:@selector(CancelButton)];
    
    [cancel1 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                    [UIFont fontWithName:@"Sansation" size:17.0], NSFontAttributeName,
                                    [UIColor whiteColor], NSForegroundColorAttributeName,
                                    nil]
                          forState:UIControlStateNormal];
    
    UIBarButtonItem *extraSpace1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *accept1 = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(closeKeyboard:)];
    
    [accept1 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                    [UIFont fontWithName:@"Sansation" size:17.0], NSFontAttributeName,
                                    [UIColor whiteColor], NSForegroundColorAttributeName,
                                    nil]
                          forState:UIControlStateNormal];
    
    [keyboardToolbar1 setItems:[[NSArray alloc] initWithObjects: cancel1,extraSpace1, accept1, nil]];
    
    
    
    [view2 addSubview:keyboardToolbar1];
    
//    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 44, 320, 200)];
//    
//    datePicker.tag=2;
//    
//    datePicker.datePickerMode = UIDatePickerModeTime;
//    
//    [view2 addSubview:datePicker];

   // [self getAllcategory];
    
   // [self getAll_subcategory];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)Back_Action:(id)sender
{
    [self.navigationController popViewControllerAnimated:NO];
}
-(NSString *)validate
{
    NSString *strinvalid=nil;
    
  
    if ([TV_terms.text isEqualToString:@"Ask me anything..."])
    {
        strinvalid=@"Ask me anything...";
    }
    
    return strinvalid;
}

///////------tag use in textfield validation---------/////////
//
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSCharacterSet *unacceptedInput = nil;
    
    if (textField.tag == 1) {
        
        NSInteger oldLength = [textField.text length];
        NSInteger newLength = oldLength + [string length] - range.length;
        
        unacceptedInput = [[NSCharacterSet characterSetWithCharactersInString:[TextALPHABATES1 stringByAppendingString:@""]] invertedSet];
        if(newLength >= 26){
            return NO;
        }
        return ([[string componentsSeparatedByCharactersInSet:unacceptedInput] count] <= 1);
    }
    
    else  if (textField.tag == 2) {
        
        NSInteger oldLength = [textField.text length];
        NSInteger newLength = oldLength + [string length] - range.length;
        
        
        unacceptedInput = [[NSCharacterSet characterSetWithCharactersInString:[TextALPHABATES stringByAppendingString:@""]] invertedSet];
        if(newLength >= 30){
            return NO;
        }
        return ([[string componentsSeparatedByCharactersInSet:unacceptedInput] count] <= 1);
        
    }
    else  if (textField.tag == 3) {
        
        NSInteger oldLength = [textField.text length];
        NSInteger newLength = oldLength + [string length] - range.length;
        
        
        unacceptedInput = [[NSCharacterSet characterSetWithCharactersInString:[TextALPHABATES stringByAppendingString:@""]] invertedSet];
        if(newLength >= 30){
            return NO;
        }
        return ([[string componentsSeparatedByCharactersInSet:unacceptedInput] count] <= 1);
        
    }
    
    
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    if (textField.tag == 1)
    {
       [self animateTextField:textField up:YES];
    }
    
    if (textField.tag == 2)
    {
        // [self animateTextField:textField up:YES];
        
        if ([arr_cat_name count]!=0)
        {
            
            
            
            
            arr_picker=arr_cat_name;
            
            senderTag=textField.tag;
            
            NSLog(@"sender tag-----%ld",senderTag);
            
            NSLog(@"ArrCategory-----%@",arr_picker);
            [picker1 reloadAllComponents];
            
           
        }
        else
        {
            [picker1 reloadAllComponents];
            [self.view endEditing:YES];
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"No category Found" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            
        }
    }

    if (textField.tag == 3)
    {
        // [self animateTextField:textField up:YES];
        if ([TF_category.text isEqualToString:@""])
        {
           // [picker1 reloadAllComponents];
            [self.view endEditing:YES];
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Please select category first" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else
        {
           // [self getAll_subcategory];
            
            
            if ([arr_subcat_name count]!=0)
            {
                arr_picker=arr_subcat_name;
                
                senderTag=textField.tag;
              
                NSLog(@"sender tag-----%ld",senderTag);
                
                NSLog(@"ArrCategory-----%@",arr_picker);
                [picker1 reloadAllComponents];
            }
            else
            {
                [picker1 reloadAllComponents];
                [self.view endEditing:YES];
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"This category has no subcategory " delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [alert show];
            }
        }
    }
    
    else if (textField.tag == 4)
    {
        senderTag=textField.tag;
        if ([arr_time_data count]!=0)
        {
            
            
            
            
            arr_picker=arr_time_data;
            
            senderTag=textField.tag;
            
            NSLog(@"sender tag-----%ld",senderTag);
            
            NSLog(@"ArrCategory-----%@",arr_picker);
            [picker1 reloadAllComponents];
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"No data Found" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
    
    else if (textField.tag == 5)
    {
        senderTag=textField.tag;
        if ([arr_time_data count]!=0)
        {
            
            
            
            
            arr_picker=arr_time_data;
            
            senderTag=textField.tag;
            
            NSLog(@"sender tag-----%ld",senderTag);
            
            NSLog(@"ArrCategory-----%@",arr_picker);
            [picker1 reloadAllComponents];
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"No data Found" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
        }
        
    }
    
    else if (textField.tag == 6)
    {
        senderTag=textField.tag;
        //  [self animateTextField:textField up:YES];
        NSLog(@"sender tag-----%ld",senderTag);
        [Start_time2 setInputView:view2];
    }
    
    else if (textField.tag == 7)
    {
        senderTag=textField.tag;
        // [self animateTextField:textField up:YES];
        NSLog(@"sender tag-----%ld",senderTag);
        [End_time2 setInputView:view2];
    }

    
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    NSString *string = textField.text;
    
    NSString *trimmedString = [string stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceCharacterSet]];
    
    // NSString *trim=[string stringByTrimming
    
    textField.text = trimmedString;
    
    if (textField.tag == 1)
    {
        
        NSRange range = [string rangeOfString:@"^0*" options:NSRegularExpressionSearch];
        string= [string stringByReplacingCharactersInRange:range withString:@""];
        NSLog(@"str %@",string);
        
        textField.text = string;
        [self animateTextField:textField up:NO];
        
    }
    
//    else  if (textField.tag == 2)
//    {
//        
//        NSRange range = [string rangeOfString:@"^0*" options:NSRegularExpressionSearch];
//        string= [string stringByReplacingCharactersInRange:range withString:@""];
//        NSLog(@"str %@",string);
//        
//        textField.text = string;
//        
//    }
    
   
    
    if (textField.tag == 2)
    {
        //[self animateTextField:textField up:NO];
    }
    if (textField.tag == 3)
    {
       // [self animateTextField:textField up:NO];
    }
    
    if (textField.tag == 4)
    {
        //[self animateTextField:textField up:NO];
    }
    if (textField.tag == 5)
    {
        // [self animateTextField:textField up:NO];
    } if (textField.tag == 6)
    {
        //[self animateTextField:textField up:NO];
    }
    if (textField.tag == 7)
    {
        // [self animateTextField:textField up:NO];
    }
    
}



///------textfield Animation----/////

-(void)animateTextField:(UITextField*)textField up:(BOOL)up
{
    
    
    const int movementDistance = -150; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? movementDistance : -movementDistance);
    
    [UIView beginAnimations: @"animateTextField" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//----------------textview validation-------------------//

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    if(textView==TV_terms)
    {
        if ([textView.text isEqualToString:@"Ask me anything..."])
        {
            TV_terms.text=@"";
        }
        
        TV_terms.textColor=[UIColor blackColor];
    }
    
    [self animateTextView:textView up:YES];
    
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
    NSString *rawString = [textView text];
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmed = [rawString stringByTrimmingCharactersInSet:whitespace];
    
    if ([trimmed length] == 0 || textView.text.length==0)
    {
        TV_terms.text=@"Ask me anything...";
        
        textView.textColor = [UIColor darkGrayColor];
        
        btn_next.backgroundColor=[UIColor whiteColor];
        [btn_next setTitleColor:[UIColor colorWithRed:148.0/255.0 green:110.0/255.0 blue:131.0/255.0 alpha:1.0f] forState:UIControlStateNormal];
    }
    
    else
    {
        textView.textColor=[UIColor blackColor];
    }
    [self animateTextView:textView up:NO];
}

///////------textview animation-------////////

- (void) animateTextView: (UITextView*) textView up: (BOOL) up
{
    const int movementDistance = 10;
    const float movementDuration = 0.3f;
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
    
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (![TV_terms.text isEqualToString:@"Ask me anything..."])
    {
        if (TV_terms.text.length>0)
        {
            btn_next.backgroundColor=[UIColor colorWithRed:148.0/255.0 green:110.0/255.0 blue:131.0/255.0 alpha:1.0f];
            [btn_next setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
    }
       
    return ((textView.text.length + text.length) - range.length) <= 50000;
}



-(IBAction)cancel_Action:(id)sender
{
   
        [self.navigationController popViewControllerAnimated:NO];
    
}

-(IBAction)Submit_Action:(id)sender
{
    
   // [MBProgressHUD showHUDAddedTo:self.view animated:NO];
    NSString *str1=[self validate];
    if ([self CheckNetwork] == NotReachable)
    {
        NSLog(@"Not Reachable");
        [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Information Message" message:@"No internet connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    else if (str1)
    {
        [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
        UIAlertView   *MyAlert = [[UIAlertView alloc] initWithTitle:@"Info!" message:str1 delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [MyAlert show];
        
        
    }
    else
    {
        //
        [MBProgressHUD showHUDAddedTo:self.view animated:NO];
        [self performSelector:@selector(post_Method) withObject:nil afterDelay:1.0];
        
    }
    
    
}
//-(IBAction)Submit_Action2:(id)sender
//{
//    [MBProgressHUD showHUDAddedTo:self.view animated:NO];
//    NSString *str1=[self validate];
//    if ([self CheckNetwork] == NotReachable)
//    {
//        NSLog(@"Not Reachable");
//        [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
//        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Information Message" message:@"No internet connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//        [alert show];
//        
//    }
//    else if (str1)
//    {
//        [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
//        UIAlertView   *MyAlert = [[UIAlertView alloc] initWithTitle:@"Information Message" message:str1 delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//        [MyAlert show];
//        
//        
//    }
//    else
//    {
//        //
//        [MBProgressHUD showHUDAddedTo:self.view animated:NO];
//        [self performSelector:@selector(post_Method2) withObject:nil afterDelay:1.0];
//        
//    }
//    
//    
//}



-(BOOL)CheckNetwork
{
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.google.com"];
    NetworkStatus NetworkStatus = [reachability currentReachabilityStatus];
    return NetworkStatus;
}


-(void)post_Method
{
//    NSLog(@"Reachable");
//     web_flag=1;
//    Ary_Parameter =[[NSMutableArray alloc]initWithObjects:@"to_user_id",@"from_user_id",@"cat_id",@"message",nil];
//   
//    Ary_Value =[[NSMutableArray alloc]initWithObjects:[pref valueForKey:@"pref_User_Id"],str_service_id,str_update_cat_id,TV_terms.text,nil];
//    
//    
//    NSLog(@"str Ary_Parameter------%@",Ary_Parameter);
//    NSLog(@"str pref_user_id------%@",[pref valueForKey:@"pref_User_Id"]);
//    
//    NSLog(@"str value------%@",Ary_Value);
//   
//    
//   Ary_Image =[[NSMutableArray alloc]init];
//    Ary_Image=[self.chosenImages copy];
//   // Ary_Video =[[NSMutableArray alloc]init];
//    
//
//    
//    post=[[PostFunctionHelper alloc]init];
//   // post.str_photo=@"1";
//    post.delegate=self;
//    
//    [post RequestWithURL:@"create_message.php" :Ary_Parameter :Ary_Value : Ary_Image];
//    
//    
//    
    
   
        
        
      //  [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        
        //[picker1 removeFromSuperview];
       // [keyboardToolbar removeFromSuperview];
      //  [txtAdditional resignFirstResponder];
        
        /*******************     POST METHOD     ********************/
        
    NSString *urlString = [NSString stringWithFormat:@"http://danielrusso.xyz/APP/create_message.php/"];
    
    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    
    [request setURL:[NSURL URLWithString:urlString]];
    
    [request setHTTPMethod:@"POST"];
    
    NSMutableData *body = [NSMutableData data];
    
    NSString *boundary = @"---------------------------14737809831466499882746641449";
    
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    
    
    NSLog(@"data=%@ %@ %@",[pref valueForKey:@"pref_User_Id"],str_service_id,[pref valueForKey:@"pref_str_cat_id"]);
    
    //  parameter to_user_id Id
    
    // NSString *strjobseeker=@"1";
    pref=[NSUserDefaults standardUserDefaults];
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"to_user_id\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[str_service_id dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSString *str_u_id=[NSString stringWithFormat:@"%@",[pref valueForKey:@"pref_User_Id"]];
    
    
    //  parameter from_user_id
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"from_user_id\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    [body appendData:[str_u_id dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    
    //  parameter description
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"message\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    [body appendData:[TV_terms.text dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    //  parameter cat_id
    
//    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"cat_id\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    [body appendData:[[pref valueForKey:@"pref_str_cat_id"] dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//    
    
    
    
    ///////////// multipal  IMAGES SEND BY POST METHOD   //////////////////
    int i = 0;
    for(UIImage *eachImage in chosenImages)
    {
        
        NSData *imgdata = UIImageJPEGRepresentation(eachImage, 0.01);
        
       // NSLog(@"imagedata-------%@",imgdata);
        
        
        //            NSString *str_imageName=[NSString stringWithFormat:@"image%d.jpg",i ];
        //            i++;
        
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[@"Content-Disposition: form-data; name=\"image[]\"; filename=\"images.jpg\"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        
        
        [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[NSData dataWithData:imgdata]];
        
        [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        
        
    }
    
    // close form
    
    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    
    // setting the body of the post to the reqeust
    
    [request setHTTPBody:body];
    
    //[NSThread detachNewThreadSelector: @selector(Start) toTarget:self withObject:nil];
    
    
    
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    // NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    
    
    
    NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingMutableLeaves error:nil];
    
    NSLog(@"dict------------%@",dict);
    
    
    
    
    
    
        if ([[dict objectForKey:@"success"] isEqualToString:@"true"]) {
            
            ////////// field empty/////
            
          
            
            [MBProgressHUD hideHUDForView:self.view animated:YES];
//            UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Info!" message:[dict objectForKey:@"msg"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//
//            [alert show];
            if ([Str_flag_update_message isEqualToString:@"yes"])
            {
                MY_AllChat_Start_ViewController *sub_cat=[[MY_AllChat_Start_ViewController alloc]initWithNibName:@"MY_AllChat_Start_ViewController" bundle:nil];
                [self.navigationController pushViewController:sub_cat animated:NO];
            }
            else
            {
            MY_AllChat2_ViewController *sub_cat=[[MY_AllChat2_ViewController alloc]initWithNibName:@"MY_AllChat2_ViewController" bundle:nil];
                sub_cat.str_Showreview=@"yes";
            [self.navigationController pushViewController:sub_cat animated:NO];
            }
            
        }
        
        else
        {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Info!" message:[dict objectForKey:@"msg"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            
            [alert show];
            
            NSLog(@"%@",[dict objectForKey:@"msg"]);
            
        }
        
   
    
}

-(void)post_Method2
{
    NSLog(@"Reachable");
    web_flag=2;
   //  $_POST['staff_name']
   
    Ary_Parameter =[[NSMutableArray alloc]initWithObjects:@"service_provider_id",@"cat_id",@"subcat_id",@"staff_name",@"description",@"first_half",@"second_half",@"staff_id",nil];
    
    Ary_Value =[[NSMutableArray alloc]initWithObjects:[pref valueForKey:@"pref_User_Id"],str_category_id,str_Subcategory_id,TF_price.text,TV_terms.text,Start_time1.text,End_time1.text,str_service_id,nil];
    
    
    NSLog(@"str Ary_Parameter------%@",Ary_Parameter);
    NSLog(@"str pref_user_id------%@",[pref valueForKey:@"pref_user_id"]);
    
    NSLog(@"str value------%@",Ary_Value);
    
    
    Ary_Image =[[NSMutableArray alloc]init];
    [Ary_Image addObject:img_view.image];
    // Ary_Video =[[NSMutableArray alloc]init];
    
    
    
    post=[[PostFunctionHelper alloc]init];
    post.str_photo=@"1";
    post.delegate=self;
    
    [post RequestWithURL:@"update_staff.php" :Ary_Parameter :Ary_Value : Ary_Image];
    
}
-(void)DidRecieveResponse:(NSDictionary *)Dictionary
{
    NSLog(@"dict post_bidding - %@",Dictionary);
    
    if ([[Dictionary objectForKey:@"success"]isEqualToString:@"true"])
    {
        if (web_flag == 1)
        {
            [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
            
            
            
            UIAlertView *  Myalert=[[UIAlertView alloc]initWithTitle:@"Information Message" message:[Dictionary objectForKey:@"msg"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [Myalert show];
            
           // [self.navigationController popViewControllerAnimated:YES];
            
            if ([[pref valueForKey:@"pref_user_type"]isEqualToString:@"user"])
            {
            
            MY_AllChat2_ViewController *sub_cat=[[MY_AllChat2_ViewController alloc]initWithNibName:@"MY_AllChat2_ViewController" bundle:nil];
            [self.navigationController pushViewController:sub_cat animated:NO];
                
            }
            else
            {
                MY_AllChat2_ViewController *sub_cat=[[MY_AllChat2_ViewController alloc]initWithNibName:@"MY_AllChat2_ViewController" bundle:nil];
                [self.navigationController pushViewController:sub_cat animated:NO];
 
            }

        }
        

        
    }
    else
    {
        [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
        
        
            UIAlertView *  Myalert=[[UIAlertView alloc]initWithTitle:@"Information Message" message:[Dictionary objectForKey:@"msg"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [Myalert show];
            
            
       
        
    }
    [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
    
}


-(IBAction)ChoosePhoto:(UIButton*)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Choose From Library",@"Take Photo", nil];
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex)
    {
        case 0:
        {    NSLog(@"Choose From Library");
            
            ipc= [[UIImagePickerController alloc]init];
            ipc.delegate = self;
            ipc.navigationBar.barStyle = UIBarStyleBlackTranslucent;
            ipc.navigationBar.barTintColor = [UIColor colorWithRed:185.0/255 green:2.0/255 blue:30.0/255 alpha:1.0]; // Background color
            ipc.navigationBar.tintColor = [UIColor whiteColor]; // Cancel button ~ any UITabBarButton items
            
            ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            
            if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone)
                [self presentViewController:ipc animated:YES completion:nil];
            else
            {
                popover = [[UIPopoverController alloc]initWithContentViewController:ipc];
                [popover presentPopoverFromRect:self.view.frame inView:self.view
                       permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
            }
            
            break;
        }
        case 1:
        {    NSLog(@" Take Photo");
            
            if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
            {   // Has camera
                
                ipc= [[UIImagePickerController alloc]init];
                ipc.delegate = self;
                
                /////  For Camera   /////
                ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
                
                if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone)
                    [self presentViewController:ipc animated:YES completion:nil];
                else
                {
                    popover = [[UIPopoverController alloc]initWithContentViewController:ipc];
                    [popover presentPopoverFromRect:self.view.frame inView:self.view
                           permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
                }
            }
            else
            {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Information" message:@"Sorry ! Camera is not present in this device" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
                [alert show];
            }
            
            
            break;
        }
        default:
            break;
    }
}
-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    flag=2;
    
    img_view.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    
    
    
    if(UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone)
    {
        [picker dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        [popover dismissPopoverAnimated:YES];
    }
    
    
    
    img_view.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    
    
    ////////// Croping image in SQUARE Shape
    
    
    CGSize imageSize = img.image.size;
    
    CGFloat width = imageSize.width;
    
    CGFloat height = imageSize.height;
    
    if (width != height) {
        
        CGFloat newDimension = MIN(width, height);
        
        CGFloat widthOffset = (width - newDimension) / 2;
        
        CGFloat heightOffset = (height - newDimension) / 2;
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(newDimension,
                                                          newDimension), YES, 1.0);
        
        
        
        [img_view.image drawAtPoint:CGPointMake(-widthOffset, -heightOffset)
         
                     blendMode:kCGBlendModeCopy
         
                         alpha:1.];
        
        img_view.image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        
        
        ////////// to show square shape on camera screen and crop
        
        //http://stackoverflow.com/questions/17712797/ios-custom-uiimagepickercontroller-camera-crop-to-square
        
        
        
        if (img_view.image.imageOrientation==UIImageOrientationLeft
            || img_view.image.imageOrientation == UIImageOrientationLeftMirrored)
            
        {
            
            CGAffineTransform transform = CGAffineTransformIdentity;
            
            transform = CGAffineTransformTranslate(transform,
                                                   img_view.image.size.width, 0);
            
            transform = CGAffineTransformRotate(transform, M_PI_2);
            
            
            
            
            
            CGContextRef ctx = CGBitmapContextCreate(NULL,
                                                     img_view.image.size.width, img_view.image.size.height,
                                                     
                                                     
                                                     CGImageGetBitsPerComponent(img_view.image.CGImage), 0,
                                                     
                                                     
                                                     CGImageGetColorSpace(img_view.image.CGImage),
                                                     
                                                     
                                                     CGImageGetBitmapInfo(img.image.CGImage));
            
            CGContextConcatCTM(ctx, transform);
            
            CGContextDrawImage(ctx,
                               CGRectMake(0,0,img_view.image.size.height,img_view.image.size.width),
                               img_view.image.CGImage);
            
            CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
            
            UIImage *img2 = [UIImage imageWithCGImage:cgimg];
            
            CGContextRelease(ctx);
            
            CGImageRelease(cgimg);
            
            
            
            img_view.image =img2;
            
        }
        
        NSLog(@"image orientation value : %ld",img_view.image.imageOrientation);
        
        
        
    }
    
    
    
}
-(UIImage *) resizeImage:(UIImage *)orginalImage resizeSize:(CGSize)size
{
    CGFloat actualHeight = orginalImage.size.height;
    CGFloat actualWidth = orginalImage.size.width;
    
    float oldRatio = actualWidth/actualHeight;
    float newRatio = size.width/size.height;
    if(oldRatio < newRatio)
    {
        oldRatio = size.height/actualHeight;
        actualWidth = oldRatio * actualWidth;
        actualHeight = size.height;
    }
    else
    {
        oldRatio = size.width/actualWidth;
        actualHeight = oldRatio * actualHeight;
        actualWidth = size.width;
    }
    
    CGRect rect = CGRectMake(0.0,0.0,actualWidth,actualHeight);
    UIGraphicsBeginImageContext(rect.size);
    [orginalImage drawInRect:rect];
    orginalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return orginalImage;
}

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
    
    UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonPressed:)];
    cancelBtn.tag=sender.tag;
    
    
    [cancelBtn setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                       [UIFont fontWithName:@"Sansation" size:20.0], NSFontAttributeName,
                                       [UIColor whiteColor], NSForegroundColorAttributeName,
                                       nil]
                             forState:UIControlStateNormal];
    
    [barItems addObject:cancelBtn];
    
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [barItems addObject:flexSpace];
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonPressed:)];
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

-(void)doneButtonPressed:(UIButton*)sender
{
    [self.view endEditing:YES];
    UITextField * tf=(UITextField *)[self.view viewWithTag:sender.tag];
    [tf resignFirstResponder];
    
    
    if(senderTag==2)
    {
        NSLog(@"sender tag-----%ld",senderTag);
        NSLog(@"state Array value= %@",str_All);
        
        NSInteger row = [picker1 selectedRowInComponent:0];
        
        //Choose it for other components
        
        NSString *yourIndustry  = [arr_picker objectAtIndex:row];
        
        NSLog(@"arr1 value--%@",yourIndustry);
        
        TF_category.text=yourIndustry;
        
        str_category_id =[arr_cat_id objectAtIndex:row];
        
        NSLog(@"str str_category_id----%@",str_category_id);
        str_url=[arr_url objectAtIndex:row];
        
        NSLog(@"str_url==%@",str_url);
        
        [picker1 removeFromSuperview];
        
        [pickerToolbar removeFromSuperview];
        
        [tf resignFirstResponder];
        
        str_All=@"";
        TF_sub_category.text=@"";
        //
        //        Url_WebViewVC *vc_url=[[Url_WebViewVC alloc]initWithNibName:@"Url_WebViewVC" bundle:nil];
        //        vc_url.str_url=str_url;
        //  [self.navigationController pushViewController:vc_url animated:YES];
    }
    if(senderTag==3)
    {
        NSLog(@"sender tag-----%ld",senderTag);
        NSLog(@"state Array value= %@",str_All);
        
        NSInteger row = [picker1 selectedRowInComponent:0];
        
        //Choose it for other components
        
        NSString *yourIndustry  = [arr_picker objectAtIndex:row];
        
        NSLog(@"arr1 value--%@",yourIndustry);
        
        TF_sub_category.text=yourIndustry;
        
        str_Subcategory_id =[arr_subcat_id objectAtIndex:row];
        str_duration_time=[arr_duration_time objectAtIndex:row];
        
        NSLog(@"str str_Subcategory_id----%@",str_Subcategory_id);
        str_url=[arr_url objectAtIndex:row];
        
        NSLog(@"str_url==%@",str_url);
        
        [picker1 removeFromSuperview];
        
        [pickerToolbar removeFromSuperview];
        
        [tf resignFirstResponder];
        
        str_All=@"";
        //
        //        Url_WebViewVC *vc_url=[[Url_WebViewVC alloc]initWithNibName:@"Url_WebViewVC" bundle:nil];
        //        vc_url.str_url=str_url;
        //  [self.navigationController pushViewController:vc_url animated:YES];
    }

    if(senderTag==4)
    {
        NSLog(@"sender tag-----%ld",senderTag);
        NSLog(@"state Array value= %@",str_All);
        
        NSInteger row = [picker1 selectedRowInComponent:0];
        
        //Choose it for other components
        
        NSString *yourIndustry  = [arr_picker objectAtIndex:row];
        
        NSLog(@"arr1 value--%@",yourIndustry);
        
        Start_time1.text=yourIndustry;
        
        // str_category_id =[arr_Establish_id objectAtIndex:row];
        
       // NSLog(@"str str_category_id----%@",str_category_id);
       // str_url=[arr_url objectAtIndex:row];
        
      //  NSLog(@"str_url==%@",str_url);
        
        [picker1 removeFromSuperview];
        
        [pickerToolbar removeFromSuperview];
        
        [tf resignFirstResponder];
        
        str_All=@"";
        //
        //        Url_WebViewVC *vc_url=[[Url_WebViewVC alloc]initWithNibName:@"Url_WebViewVC" bundle:nil];
        //        vc_url.str_url=str_url;
        //  [self.navigationController pushViewController:vc_url animated:YES];
        
        End_time1.text=@"";
    }
    
    if(senderTag==5)
    {
        NSLog(@"sender tag-----%ld",senderTag);
        NSLog(@"state Array value= %@",str_All);
        
        NSInteger row = [picker1 selectedRowInComponent:0];
        
        //Choose it for other components
        
        NSString *yourIndustry  = [arr_picker objectAtIndex:row];
        
        NSLog(@"arr1 value--%@",yourIndustry);
        
        End_time1.text=yourIndustry;
        
        // str_category_id =[arr_Establish_id objectAtIndex:row];
        
       // NSLog(@"str str_category_id----%@",str_category_id);
       // str_url=[arr_url objectAtIndex:row];
        
       // NSLog(@"str_url==%@",str_url);
        
        [picker1 removeFromSuperview];
        
        [pickerToolbar removeFromSuperview];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        // [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
        [dateFormatter setDateFormat:@"hh:mm a"];
       // NSDate *date1 = [dateFormatter dateFromString:Start_time1.text];
        // [date1 setDateFormat:@"hh:mm a"];
       // [dateFormatter setDateFormat:@"hh:mm a"];
       // NSDate *date2 = [dateFormatter dateFromString: End_time1.text];
        
        NSTimeInterval distanceBetweenDates = [[dateFormatter dateFromString: End_time1.text] timeIntervalSinceDate:[dateFormatter dateFromString:Start_time1.text]];
        double secondsInAnHour = 3600;
        NSInteger hoursBetweenDates = distanceBetweenDates / secondsInAnHour;
        NSInteger minutesBetweenDates = distanceBetweenDates / 60;
        
         NSLog(@"hoursBetweenDates==%ld",(long)hoursBetweenDates);
         NSLog(@"minutesBetweenDates==%ld",(long)minutesBetweenDates);
        
        /*"30 min",
         "45 min",
         "1 hour",
         "1 hour 30 min",
         "1 hour 45 min",
         "2 hour"
         */
       // BOOL availFlag=NO;
        
        int tempHour=0,tempMin=0,totalMin=0;
       
        
        if ([str_duration_time rangeOfString:@"hour"].length>0)
        {
            tempHour= [[str_duration_time substringToIndex:1] intValue];
            if ([str_duration_time rangeOfString:@"min"].length>0)
            {
                tempMin= [[[str_duration_time substringFromIndex:7] substringToIndex:3] intValue];
            }
        }
        else
        {
            tempMin= [[str_duration_time substringToIndex:2] intValue];
        }
        totalMin=(tempHour*60)+tempMin;
        NSLog(@"totalMin==%d",totalMin);
        
        if (totalMin> minutesBetweenDates)
        {
            //Start_time1.text=@"";
            End_time1.text=@"";
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:[NSString stringWithFormat:@"Subcatagory needs at least %@ to proceed. Please set time again",str_duration_time] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
        }
        
        
        
        [tf resignFirstResponder];
        
        str_All=@"";
        //
        //        Url_WebViewVC *vc_url=[[Url_WebViewVC alloc]initWithNibName:@"Url_WebViewVC" bundle:nil];
        //        vc_url.str_url=str_url;
        //  [self.navigationController pushViewController:vc_url animated:YES];
    }
    
    
}




-(void)cancelButtonPressed:(UIButton*)sender{
    
    NSLog(@"text Field Close ==%ld",(long)sender.tag);
    
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

-(IBAction)add_action:(id)sender
{
    [self viewWillAppear:YES];
    TF_category.text=@"";
    TF_price.text=@"";
    TF_sub_category.text=@"";
   Start_time2.text=@"";
    Start_time1.text=@"";
    End_time2.text=@"";
    End_time1.text=@"";
   TV_terms.text=@"Ask me anything...";
    img_view.image=[UIImage imageNamed:@"picture128.png"];
     flag=1;
//    Create_Staff_ViewController1 *crea=[[Create_Staff_ViewController1 alloc]initWithNibName:@"Create_Staff_ViewController1" bundle:nil];
//    [self.navigationController pushViewController:crea animated:NO];
}

-(void)closeKeyboard:(UIButton*)sender
{
    //UITextField * tf=(UITextField *)[self.view viewWithTag:sender.tag];
    
    
    
    if(senderTag==4)
    {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        //[dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
        [dateFormatter setDateFormat:@"hh:mm a"];
     //  currentTime = [dateFormatter stringFromDate:datePicker.date];
        
        
       Start_time1.text=@"";
         End_time1.text=@"";
       // [Start_time1 resignFirstResponder];
    }
    
    if(senderTag==5)
    {
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        // [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
        [dateFormatter setDateFormat:@"hh:mm a"];
       // currentTime1 = [dateFormatter stringFromDate:datePicker.date];
        
//        if ([currentTime1 compare:currentTime] == NSOrderedSame)
//        {
//            NSLog(@"event is same time");
//             End_time1.text = [NSString stringWithFormat:@"%@",currentTime1];
//            dateforchecktime= End_time1.text;
//            
//        }
//        else if ([currentTime1 compare:currentTime] == NSOrderedAscending)
//        {
//            NSLog(@"event is after start time");
//            
//           End_time1.text=@"";
//            dateforchecktime= End_time1.text;
//            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"You can not set past time" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//            [alert show];
//        }
//        else if ([currentTime1 compare:currentTime] == NSOrderedDescending)
//        {
//            NSLog(@"event is before start time");
//            [datePicker setDate:[NSDate date]];
//            End_time1.text= [NSString stringWithFormat:@"%@",currentTime1];
//
//        }

        
       End_time1.text=@"";
        
       
      
       // [End_time1 resignFirstResponder];
    }
    
    if(senderTag==6)
    {
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        // [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
        [dateFormatter setDateFormat:@"hh:mm a"];
       currentTime = [dateFormatter stringFromDate:datePicker.date];
        
        
        Start_time2.text=currentTime;
        [Start_time2 resignFirstResponder];
    }
    
    if(senderTag==7)
    {
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
       
        [dateFormatter setDateFormat:@"hh:mm a"];
       currentTime = [dateFormatter stringFromDate:datePicker.date];
        
        
        End_time2.text=currentTime;
        [End_time2 resignFirstResponder];
    }
 
    
}
-(void)CancelButton
{
    
    if(senderTag==4)
    {
        Start_time1.text=@"";
        [Start_time1 resignFirstResponder];
    }
    if(senderTag==5)
    {
        End_time1.text=@"";
        [End_time1 resignFirstResponder];
    }
    
    if(senderTag==6)
    {
        Start_time2.text=@"";
        
        [Start_time2 resignFirstResponder];
    }
    
    if(senderTag==7)
    {
        End_time2.text=@"";
        [End_time2 resignFirstResponder];
    }
    
  
    
}
-(void)getAllcategory
{
    
    if ([self CheckNetwork] == NotReachable)
    {
        NSLog(@"Not Reachable");
        
        
        UIAlertView *  alert=[[UIAlertView alloc]initWithTitle:@"info" message:@"NO Internet Connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        [MBProgressHUD hideHUDForView:self.view animated:NO];
        
    }
    else
    {
        NSLog(@"Reachable");
        NSString *str_user_id1=[pref valueForKey:@"pref_User_Id"];
        [MBProgressHUD showHUDAddedTo:self.view animated:NO];
        
        
        NSString *str123=[NSString stringWithFormat:@"http://bringmestyle.com/webservice/getallACTIVEcategoryBYSERVICEPROVIDER_id.php?service_provider_id=%@",str_user_id1];
        
        NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:str123]];
        
        [request setHTTPMethod:@"GET"];
        [request setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"content-type"];
        NSError *error;
        NSURLResponse *response;
        NSData *responseData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        NSDictionary *jsonDist=[NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
        
        NSLog(@"jsonDist = %@",jsonDist);
        
                arr_cat_name=[[jsonDist objectForKey:@"data"]valueForKey:@"cat_name"];
        
        
                //
                arr_cat_id=[[jsonDist objectForKey:@"data"]valueForKey:@"cat_id"];
        
        
        
                //  arr_url=[[jsonDist objectForKey:@"data"]valueForKey:@"web_url"];
                [MBProgressHUD hideHUDForView:self.view animated:NO];
                

        
//        arr_Establish=[[jsonDist objectForKey:@"data"]valueForKey:@"cat_name"];
//        
//        TF_category.text=[arr_Establish objectAtIndex:0];
//        //
//        arr_Establish_id=[[jsonDist objectForKey:@"data"]valueForKey:@"cat_id"];
//        
//        str_cat_id=[arr_Establish_id objectAtIndex:0];
        
        //  arr_url=[[jsonDist objectForKey:@"data"]valueForKey:@"web_url"];
        [MBProgressHUD hideHUDForView:self.view animated:NO];
        
        
    }
    [MBProgressHUD hideHUDForView:self.view animated:NO];
}


//-(void)getAllcategory
//{
//    
//    
//    if ([self CheckNetwork] == NotReachable)
//    {
//        NSLog(@"Not Reachable");
//        
//        
//        UIAlertView *  alert=[[UIAlertView alloc]initWithTitle:@"info" message:@"NO Internet Connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//        [alert show];
//        [MBProgressHUD hideHUDForView:self.view animated:NO];
//        
//    }
//    else
//    {
//        NSLog(@"Reachable");
//        NSString *str_user_id1=[pref valueForKey:@"pref_User_Id"];
//        [MBProgressHUD showHUDAddedTo:self.view animated:NO];
//        
//        
//        NSString *str123=[NSString stringWithFormat:@"http://bringmestyle.com/webservice/getallcategory.php?service_provider_id=%@",str_user_id1];
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
//        
//        arr_cat_name=[[jsonDist objectForKey:@"data"]valueForKey:@"cat_name"];
//        
//      
//        //
//        arr_cat_id=[[jsonDist objectForKey:@"data"]valueForKey:@"cat_id"];
//        
//      
//        
//        //  arr_url=[[jsonDist objectForKey:@"data"]valueForKey:@"web_url"];
//        [MBProgressHUD hideHUDForView:self.view animated:NO];
//        
//        
//    }
//    
//    [MBProgressHUD hideHUDForView:self.view animated:NO];
//}

-(void)getAll_subcategory
{
    
    
    if ([self CheckNetwork] == NotReachable)
    {
        NSLog(@"Not Reachable");
        
        
        UIAlertView *  alert=[[UIAlertView alloc]initWithTitle:@"info" message:@"NO Internet Connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        [MBProgressHUD hideHUDForView:self.view animated:NO];
        
    }
    else
    {
        NSLog(@"Reachable");
        NSString *str_user_id1=[pref valueForKey:@"pref_User_Id"];
        [MBProgressHUD showHUDAddedTo:self.view animated:NO];
        
        
        NSString *str123=[NSString stringWithFormat:@"http://danielrusso.xyz/APP/get_single_message.php?user_id=%@&message_id=%@",[pref valueForKey:@"pref_User_Id"],str_service_id];
        NSLog(@"str123==%@",str123);
        
        NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:str123]];
        
        [request setHTTPMethod:@"GET"];
        [request setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"content-type"];
        NSError *error;
        NSURLResponse *response;
        NSData *responseData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        NSDictionary *jsonDist=[NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
        
        NSLog(@"jsonDist = %@",jsonDist);
        
        
      arr_subcat_name=[jsonDist objectForKey:@"msg_data"];
      lbl_title.text= [[arr_subcat_name objectAtIndex:0]valueForKey:@"from_user_name"];
        TV_terms.text=[[arr_subcat_name objectAtIndex:0]valueForKey:@"message_attachment"];
     str_message_id= [[arr_subcat_name objectAtIndex:0]valueForKey:@"message_id"];
        //
       // arr_subcat_id=[[jsonDist objectForKey:@"data"]valueForKey:@"subcat_id"];
       // arr_duration_time=[[jsonDist objectForKey:@"data"]valueForKey:@"duration"];
        //  arr_url=[[jsonDist objectForKey:@"data"]valueForKey:@"web_url"];
        [MBProgressHUD hideHUDForView:self.view animated:NO];
        
        
    }
    [MBProgressHUD hideHUDForView:self.view animated:NO];
}

//-(UIStatusBarStyle)preferredStatusBarStyle{
//    return UIStatusBarStyleLightContent;
//}

////-----------multipal images picker-------///////

- (IBAction)launchController
{
//    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
//    imagePickerController.delegate = self;
//    
//    //[imagePickerController setAllowsMultipleSelection:YES];
//    [self presentViewController:imagePickerController animated:YES completion:nil];
    
    ELCImagePickerController *elcPicker = [[ELCImagePickerController alloc] initImagePicker];
    
    elcPicker.maximumImagesCount = 100; //Set the maximum number of images to select to 100
    elcPicker.returnsOriginalImage = YES; //Only return the fullScreenImage, not the fullResolutionImage
    elcPicker.returnsImage = YES; //Return UIimage if YES. If NO, only return asset location information
    elcPicker.onOrder = YES; //For multiple image selection, display and return order of selected images
    elcPicker.mediaTypes = @[(NSString *)kUTTypeImage, (NSString *)kUTTypeMovie]; //Supports image and movie type
    
    elcPicker.imagePickerDelegate = self;

    //elcPicker.setSourceType:UIImagePickerControllerSourceTypePhotoLibrary;
   // elcPicker.
    
    [self presentViewController:elcPicker animated:YES completion:nil];
}



- (void)displayPickerForGroup:(ALAssetsGroup *)group
{
   ELCImagePickerController *  elcPicker = [[ELCImagePickerController alloc] initImagePicker];
   
    elcPicker.imagePickerDelegate = self;
   
    [self presentViewController:elcPicker animated:YES completion:nil];

    
//    ELCAssetTablePicker *tablePicker = [[ELCAssetTablePicker alloc] initWithStyle:UITableViewStylePlain];
//    tablePicker.singleSelection = YES;
//    tablePicker.immediateReturn = YES;
    
    //ELCImagePickerController *elcPicker = [[ELCImagePickerController alloc] initWithRootViewController:tablePicker];
    elcPicker.maximumImagesCount = 1;
    
//    elcPicker.returnsOriginalImage = YES; //Only return the fullScreenImage, not the fullResolutionImage
//    elcPicker.returnsImage = YES; //Return UIimage if YES. If NO, only return asset location information
//    elcPicker.onOrder = NO; //For single image selection, do not display and return order of selected images
    
    elcPicker.returnsOriginalImage = NO; //Only return the fullScreenImage, not the fullResolutionImage
    elcPicker.returnsImage = YES; //Return UIimage if YES. If NO, only return asset location information
    elcPicker.onOrder = YES; //Fo
    elcPicker.imagePickerDelegate = self;
   // tablePicker.parent = elcPicker;
    
    // Move me
   // tablePicker.assetGroup = group;
   // [tablePicker.assetGroup setAssetsFilter:[ALAssetsFilter allAssets]];
    
    [self presentViewController:elcPicker animated:YES completion:nil];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return YES;
    } else {
        return toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
    }
}

#pragma mark ELCImagePickerControllerDelegate Methods

- (void)elcImagePickerController:(ELCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info
{
    [self dismissViewControllerAnimated:YES completion:nil];
   
    
        //extracting image from the picker and saving it
    
//    for (UIView *v in [Image_Scroller subviews]) {
//        [v removeFromSuperview];
//    }
    
   // CGRect workingFrame = Image_Scroller.frame;
  //  workingFrame.origin.x = 0;
    
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:[info count]];
    for (NSDictionary *dict in info)
    {
        if ([dict objectForKey:UIImagePickerControllerSourceTypePhotoLibrary] == ALAssetTypePhoto)
        {
            if ([dict objectForKey:UIImagePickerControllerOriginalImage]){
                UIImage* image=[dict objectForKey:UIImagePickerControllerOriginalImage];
                [images addObject:image];
                
                imageview = [[UIImageView alloc] initWithImage:image];
                // [imageview setContentMode:UIViewContentModeScaleAspectFit];
                // imageview.frame = workingFrame;
                imageview.frame = CGRectMake(0, 0, 320, 163);
                //   [Image_Scroller addSubview:imageview];
                
                // workingFrame.origin.x = workingFrame.origin.x + workingFrame.size.width;
            } else {
                NSLog(@"UIImagePickerControllerReferenceURL = %@", dict);
            }
        }
       else if ([dict objectForKey:UIImagePickerControllerMediaType] == ALAssetTypePhoto){
            if ([dict objectForKey:UIImagePickerControllerOriginalImage]){
                UIImage* image=[dict objectForKey:UIImagePickerControllerOriginalImage];
                [images addObject:image];
                
                imageview = [[UIImageView alloc] initWithImage:image];
                // [imageview setContentMode:UIViewContentModeScaleAspectFit];
                // imageview.frame = workingFrame;
                imageview.frame = CGRectMake(0, 0, 320, 163);
                //   [Image_Scroller addSubview:imageview];
                
                // workingFrame.origin.x = workingFrame.origin.x + workingFrame.size.width;
            } else {
                NSLog(@"UIImagePickerControllerReferenceURL = %@", dict);
            }
        }
        else if ([dict objectForKey:UIImagePickerControllerMediaType] == ALAssetTypeVideo){
            if ([dict objectForKey:UIImagePickerControllerOriginalImage]){
                UIImage* image=[dict objectForKey:UIImagePickerControllerOriginalImage];
                
                [images addObject:image];
                
                imageview = [[UIImageView alloc] initWithImage:image];
                //[imageview setContentMode:UIViewContentModeScaleAspectFit];
                // imageview.frame = workingFrame;
                
                imageview.frame = CGRectMake(0, 0, 320, 163);
                // [Image_Scroller addSubview:imageview];
                
                // workingFrame.origin.x = workingFrame.origin.x + workingFrame.size.width;
            } else {
                NSLog(@"UIImagePickerControllerReferenceURL = %@", dict);
            }
        }
        
        else
        {
            NSLog(@"Uknown asset type");
            UIImage* image=[dict objectForKey:UIImagePickerControllerOriginalImage];
            [images addObject:image];
           imageview = [[UIImageView alloc] initWithImage:image];
        }
    }
    
    self.chosenImages = images;
    
    btn_attach.layer.masksToBounds = true;
    btn_attach.layer.cornerRadius = 5.0;
    btn_attach.layer.borderColor = [UIColor whiteColor].CGColor;
    btn_attach.layer.borderWidth = 1.0;
    btn_attach.backgroundColor=[UIColor colorWithRed:86.0/255 green:82.0/255 blue:100.0/255 alpha:1.0];
    [btn_attach setTitle:@"A T T A C H E D" forState:UIControlStateNormal];
   // btn_attach.tintColor=[UIColor whiteColor];
    [btn_attach setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    //obtaining saving path
   }

- (void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    btn_attach.layer.masksToBounds = true;
    btn_attach.layer.cornerRadius = 5.0;
    btn_attach.layer.borderColor = [UIColor grayColor].CGColor;
    btn_attach.layer.borderWidth = 1.0;
    btn_attach.backgroundColor=[UIColor whiteColor];
    [btn_attach setTitle:@"ATTACH IMAGES" forState:UIControlStateNormal];
    // btn_attach.tintColor=[UIColor whiteColor];
    [btn_attach setTitleColor:[UIColor colorWithRed:38.0/255 green:84.0/255 blue:124.0/255 alpha:1.0] forState:UIControlStateNormal];
}

///////----------image picker close------
-(IBAction)Done_Action:(id)sender
{
    [TV_terms resignFirstResponder];
}
///////////////////////multiple image picker
- (IBAction)presentImagePicker:(id)sender
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
   
   //[imagePickerController setAllowsMultipleSelection:YES];
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

//*****************************************************************************/
#pragma mark - UIImagePickerControllerHiddenAPIDelegate Methods
//*****************************************************************************/

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfoArray:(NSArray *)infoArray
{
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:[infoArray count]];
    for (NSDictionary *infoDictionary in infoArray)
    {
        UIImage* image=[infoDictionary objectForKey:UIImagePickerControllerOriginalImage];
        [images addObject:image];
        NSLog(@"%@", infoDictionary);
        NSLog(@"image array%@", infoArray);
    }
    //////////
    
    [self dismissViewControllerAnimated:YES completion:nil];
    self.chosenImages = images;
    btn_attach.layer.masksToBounds = true;
    btn_attach.layer.cornerRadius = 5.0;
    btn_attach.layer.borderColor = [UIColor grayColor].CGColor;
    btn_attach.layer.borderWidth = 1.0;
    btn_attach.backgroundColor=[UIColor colorWithRed:86.0/255 green:82.0/255 blue:100.0/255 alpha:1.0];
    [btn_attach setTitle:@"A T T A C H E D" forState:UIControlStateNormal];
    // btn_attach.tintColor=[UIColor whiteColor];
    [btn_attach setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"Cancelled");
    btn_attach.layer.masksToBounds = true;
    btn_attach.layer.cornerRadius = 5.0;
    btn_attach.layer.borderColor = [UIColor grayColor].CGColor;
    btn_attach.layer.borderWidth = 1.0;
    btn_attach.backgroundColor=[UIColor whiteColor];
    [btn_attach setTitle:@"ATTACH IMAGES" forState:UIControlStateNormal];
    // btn_attach.tintColor=[UIColor whiteColor];
    [btn_attach setTitleColor:[UIColor colorWithRed:38.0/255 green:84.0/255 blue:124.0/255 alpha:1.0] forState:UIControlStateNormal];
}


-(IBAction)btnClick:(id)sender
{
    
    ZYQAssetPickerController *picker = [[ZYQAssetPickerController alloc] init];
    picker.maximumNumberOfSelection = 100;
    picker.assetsFilter = [ALAssetsFilter allPhotos];
    picker.showEmptyGroups=NO;
    picker.delegate=self;
    picker.selectionFilter = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        if ([[(ALAsset*)evaluatedObject valueForProperty:ALAssetPropertyType] isEqual:ALAssetTypeVideo]) {
            NSTimeInterval duration = [[(ALAsset*)evaluatedObject valueForProperty:ALAssetPropertyDuration] doubleValue];
            return duration >= 5;
        } else {
            return YES;
        }
    }];
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}
-(void)assetPickerController:(ZYQAssetPickerController *)picker didFinishPickingAssets:(NSArray *)assets{
    
    NSMutableArray *images = [[NSMutableArray alloc]init];

    
    [self dismissViewControllerAnimated:YES completion:nil];
   // self.chosenImages = images;
    btn_attach.layer.masksToBounds = true;
    btn_attach.layer.cornerRadius = 5.0;
    btn_attach.layer.borderColor = [UIColor grayColor].CGColor;
    btn_attach.layer.borderWidth = 1.0;
    btn_attach.backgroundColor=[UIColor colorWithRed:86.0/255 green:82.0/255 blue:100.0/255 alpha:1.0];
    [btn_attach setTitle:@"A T T A C H E D" forState:UIControlStateNormal];
    // btn_attach.tintColor=[UIColor whiteColor];
    [btn_attach setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

       
      for (int i=0; i<assets.count; i++)
      {
           ALAsset *asset=assets[i];
          
        
                     UIImage *tempImg=[UIImage imageWithCGImage:asset.defaultRepresentation.fullScreenImage];
            dispatch_async(dispatch_get_main_queue(), ^{
              
                
                [images addObject:tempImg];
            });
           [images addObject:tempImg];
       }
       self.chosenImages = images;
//    });
}



@end
