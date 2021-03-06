//
//  After_sign_in _provider_ViewController.m
//  Yubna
//
//  Created by Mac on 4/6/16.
//  Copyright (c) 2016 Young Decade. All rights reserved.
//

#import "Create_Post_ViewController1.h"
//#import "Add_sub_category_ViewController1.h"
#import "Reachability.h"
#import "MBProgressHUD.h"
//#import "DEMONavigationController.h"
//#import "DEMOMenuViewController.h"
#import "AppDelegate.h"
#import "Create_Post2_ViewController1.h"
//#import "Home_ViewController.h"
//#import "Donate_ViewController.h"
#import "EditProfileViewController.h"
#define numeric @"1234567890"
#define numericDecimal @"1234567890."
#define TextNumeric @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
#define TextNumericspace @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789: "
#define TextALPHABATES @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz "
#define TextALPHABATES1 @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz "
#import "PhotoTweaksViewController.h"

#import <AssetsLibrary/AssetsLibrary.h>
#import "BRImagePicker.h"
#import "BR_ImageInfo.h"

#pragma mark -
#pragma mark Scale and crop image

@interface Create_Post_ViewController1 ()<PhotoTweaksViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (nonatomic, strong) NSArray *selectedAssetsArray;
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


@implementation Create_Post_ViewController1
@synthesize TF_price,TF_category,TF_sub_category,TV_terms,str_project_id,lbl_bg11,img_view,Start_time4,Start_time3,Start_time2,Start_time1,End_time4,End_time3,End_time2,End_time1,btn_back,str_service_id,str_dec,str_update_cat_name,str_update_image,str_start_price,str_staff,str_update_cat_id,Str_flag_update,str_sub_cate,lbl_heading,btn_update,btn_add,Str_sub_category_name,str_end_price,img11,str_dure,lbl_blank,lbl_color,btn_attach,btn_next;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
        self.navigationController.navigationBarHidden=YES;
    pref=[NSUserDefaults standardUserDefaults];
//    if ([[pref valueForKey:@"pref_staff_flag"]isEqualToString:@"no"])
//    {
//        btn_back.hidden=YES;
//    }
    
    lbl_color.layer.masksToBounds = true;
    lbl_color.layer.cornerRadius =lbl_color.frame.size.width/2;// 12.0;
    
    lbl_blank.layer.masksToBounds = true;
    lbl_blank.layer.cornerRadius =lbl_blank.frame.size.width/2;// 12.0;
    lbl_blank.layer.borderColor = [UIColor grayColor].CGColor;
    lbl_blank.layer.borderWidth = 1.0;
    
    btn_next.layer.masksToBounds = true;
    btn_next.layer.cornerRadius = 5.0;
   btn_next.layer.borderColor = [UIColor colorWithRed:227.0/255 green:128.0/255 blue:139.0/255 alpha:1.0].CGColor;
    btn_next.layer.borderWidth = 1.0;
    
    btn_attach.layer.masksToBounds = true;
    btn_attach.layer.cornerRadius = 5.0;
    
      btn_attach.layer.borderColor = [UIColor colorWithRed:86.0/255.0 green:82.0/255.0 blue:100.0/255.0 alpha:1.0f].CGColor;
    btn_attach.layer.borderWidth = 1.0;
    
    
    img_view.layer.borderColor = [[UIColor grayColor] colorWithAlphaComponent:0.5].CGColor;
    img_view.layer.borderWidth = 1.0;
    
   // btn_newpost.layer.cornerRadius = 5.0;
    arr_time_data=[[NSMutableArray alloc]initWithObjects:@"06:00 AM",@"06:30 AM",@"07:00 AM",@"07:30 AM",@"08:00 AM",@"08:30 AM",@"09:00 AM",@"09:30 AM",@"10:00 AM",@"10:30 AM",@"11:00 AM",@"11:30 AM",@"12:00 PM",@"12:30 PM",@"01:00 PM",@"01:30 PM",@"02:00 PM",@"02:30 PM",@"03:00 PM",@"03:30 PM",@"04:00 PM",@"04:30 PM",@"05:00 PM",@"05:30 PM",@"06:00 PM",@"06:30 PM",@"07:00 PM",@"07:30 PM",@"08:00 PM",@"08:30 PM",@"09:00 PM",@"09:30 PM",@"10:00 PM",@"10:30 PM",@"11:00 PM", nil];
    
    if ([Str_flag_update isEqualToString:@"update"])
    {
        TF_category.enabled = NO;
        btn_add.hidden=YES;
        lbl_heading.text=@"UPDATE STAFF";
        TF_category.text=str_update_cat_name;
        TF_sub_category.text=Str_sub_category_name;
        TF_price.text=str_staff;
        str_category_id=str_update_cat_id;
        str_Subcategory_id=str_sub_cate;
        img11.hidden=YES;
        Start_time1.text=str_start_price;
        End_time1.text=str_end_price;
        TV_terms.text=str_dec;
        str_duration_time=str_dure;
        NSURL *myurl1 = [NSURL URLWithString:str_update_image];
        
        NSData *imageData = [NSData dataWithContentsOfURL:myurl1];
        
        img_view.image = [UIImage imageWithData:imageData];
        
        [TV_terms.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
        [TV_terms.layer setBorderWidth:1.0];
        TV_terms.clipsToBounds = YES;
        
        flag=2;
    }
    else
    {
         btn_update.hidden=YES;
        
        flag=1;
        TV_terms.text=@"TITLE (35 CHARACTERS LIMIT)";
        
        [TV_terms.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
        [TV_terms.layer setBorderWidth:1.0];
        TV_terms.clipsToBounds = YES;
    }
     TV_terms.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *)validate
{
    NSString *strinvalid=nil;
    
  if(flag==1)
    {
        strinvalid=@"Please attach image";
    }
    else if ([TV_terms.text isEqualToString:@"TITLE (35 CHARACTERS LIMIT)"])
    {
        strinvalid=@"Please enter title";
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
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Info!" message:@"No category Found" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
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
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Info!" message:@"Please select category first" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
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
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Info!" message:@"This category has no subcategory " delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
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
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Info!" message:@"No data Found" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
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
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Info!" message:@"No data Found" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
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
        if ([textView.text isEqualToString:@"TITLE (35 CHARACTERS LIMIT)"])
        {
            TV_terms.text=@"";
        }
        
        TV_terms.textColor=[UIColor blackColor];
    }
    
   // [self animateTextView:textView up:YES];
    
}
/////////cropppper./////////
- (IBAction)selectPressed:(id)sender
{
    BRImagePicker *imagePicker = [[BRImagePicker alloc] initWithPresentingController:self];
    [imagePicker showPickerWithDataBlock:^(NSArray *data) {
        
        // Each object in returned Array will be of type  "BR_ImageInfo"
        
        self.selectedAssetsArray = data;
        
        self.infoLabel.text = [NSString stringWithFormat:@"%lu  %@ selected.",(unsigned long)self.selectedAssetsArray.count, self.selectedAssetsArray.count==1 ? @"Asset" : @"Assets"];
        
    }];
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
    NSString *rawString = [textView text];
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmed = [rawString stringByTrimmingCharactersInSet:whitespace];
    
    if ([trimmed length] == 0 || textView.text.length==0)
    {
        TV_terms.text=@"TITLE (35 CHARACTERS LIMIT)";
        
        textView.textColor = [UIColor darkGrayColor];
        
        btn_attach.backgroundColor=[UIColor whiteColor];
        [btn_attach setTitleColor:[UIColor colorWithRed:86.0/255.0 green:82.0/255.0 blue:100.0/255.0 alpha:1.0f] forState:UIControlStateNormal];
         [btn_attach setTitle:@"ATTACH" forState:UIControlStateNormal];
        
    }
    
    else
    {
        textView.textColor=[UIColor blackColor];
    }
   // [self animateTextView:textView up:NO];
}

///////------textview animation-------////////

- (void) animateTextView: (UITextView*) textView up: (BOOL) up
{
    const int movementDistance = 180;
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
    
    if (![TV_terms.text isEqualToString:@"TITLE (35 CHARACTERS LIMIT)"])
    {
        if (TV_terms.text.length>0)
        {
            if(flag==2)
            {
            btn_attach.backgroundColor=[UIColor colorWithRed:86.0/255.0 green:82.0/255.0 blue:100.0/255.0 alpha:1.0f];
            [btn_attach setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                
                [btn_attach setTitle:@"ATTACHED" forState:UIControlStateNormal];

            }
            
        }
    }
    if ([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
    }
    
    return ((textView.text.length + text.length) - range.length) <= 35;
}



-(IBAction)cancel_Action:(id)sender
{
   
        [self.navigationController popViewControllerAnimated:NO];
    
}

-(IBAction)Submit_Action:(id)sender
{
    [MBProgressHUD showHUDAddedTo:self.view animated:NO];
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
        Create_Post2_ViewController1 *post22=[[Create_Post2_ViewController1 alloc]initWithNibName:@"Create_Post2_ViewController1" bundle:nil];
        post22.str_sub_cate=TV_terms.text;
         post22.image_view=img_view.image;
        [self.navigationController pushViewController:post22 animated:NO];
        //
       // [MBProgressHUD showHUDAddedTo:self.view animated:NO];
       // [self performSelector:@selector(post_Method) withObject:nil afterDelay:1.0];
        
    }
    
    
}
-(IBAction)Submit_Action2:(id)sender
{
    [MBProgressHUD showHUDAddedTo:self.view animated:NO];
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
        Create_Post2_ViewController1 *post22=[[Create_Post2_ViewController1 alloc]initWithNibName:@"Create_Post2_ViewController1" bundle:nil];
         post22.str_sub_cate=TV_terms.text;
        post22.image_view=img_view.image;
        [self.navigationController pushViewController:post22 animated:NO];
        //
        //[MBProgressHUD showHUDAddedTo:self.view animated:NO];
       // [self performSelector:@selector(post_Method2) withObject:nil afterDelay:1.0];
        
    }
    
    
}



-(BOOL)CheckNetwork
{
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.google.com"];
    NetworkStatus NetworkStatus = [reachability currentReachabilityStatus];
    return NetworkStatus;
}


-(void)post_Method
{
    NSLog(@"Reachable");
     web_flag=1;
    Ary_Parameter =[[NSMutableArray alloc]initWithObjects:@"service_provider_id",@"cat_id",@"subcat_id",@"staff",@"description",@"first_half",@"second_half",nil];
    
    Ary_Value =[[NSMutableArray alloc]initWithObjects:[pref valueForKey:@"pref_User_Id"],str_category_id,str_Subcategory_id,TF_price.text,TV_terms.text,Start_time1.text,End_time1.text,nil];
    
    
    NSLog(@"str Ary_Parameter------%@",Ary_Parameter);
    NSLog(@"str pref_user_id------%@",[pref valueForKey:@"pref_user_id"]);
    
    NSLog(@"str value------%@",Ary_Value);
    
    
    Ary_Image =[[NSMutableArray alloc]init];
     [Ary_Image addObject:img_view.image];
   // Ary_Video =[[NSMutableArray alloc]init];
    
    
    
    post=[[PostFunctionHelper alloc]init];
    post.str_photo=@"1";
    post.delegate=self;
    
    [post RequestWithURL:@"create_staff.php" :Ary_Parameter :Ary_Value : Ary_Image];
    
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
            
                           [self.navigationController popViewControllerAnimated:NO];
           
            

        }
        if (web_flag ==2 )
        {
            [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
            
           // [pref setObject:@"yes" forKey:@"pref_staff_flag"];
            
            UIAlertView *  Myalert=[[UIAlertView alloc]initWithTitle:@"Information Message" message:[Dictionary objectForKey:@"msg"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [Myalert show];
            
          
                [self.navigationController popViewControllerAnimated:NO];
           
            

        }
        

        
    }
    else
    {
        [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
        
        if ([[Dictionary objectForKey:@"flag"]isEqualToString:@"no"])
        {
            
            UIAlertView *  Myalert=[[UIAlertView alloc]initWithTitle:@"Information Message" message:[Dictionary objectForKey:@"msg"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [Myalert show];
            
            
        }
        else
        {
            UIAlertView *  Myalert=[[UIAlertView alloc]initWithTitle:@"Information Message" message:[Dictionary objectForKey:@"msg"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [Myalert show];
        }
        
    }
    [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
    
}




- (IBAction)BtnImage:(id)sender

{
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Choose profile picture" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Camera", @"Gallery",nil];
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
          
            UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Device has no camera" delegate:nil cancelButtonTitle:@"OK"  otherButtonTitles: nil];
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
    
    if (![TV_terms.text isEqualToString:@"TITLE (35 CHARACTERS LIMIT)"])
        {
                    if (TV_terms.text.length>0)
                    {
                        if(flag==2)
                        {
                                    btn_attach.backgroundColor=[UIColor colorWithRed:86.0/255.0 green:82.0/255.0 blue:100.0/255.0 alpha:1.0f];
                                    [btn_attach setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                                     [btn_attach setTitle:@"ATTACHED" forState:UIControlStateNormal];
                        }
                    }
        }
    
    
    
}

- (void)photoTweaksController:(PhotoTweaksViewController *)controller didFinishWithCroppedImage:(UIImage *)croppedImage
{
     [controller dismissViewControllerAnimated:YES completion:NULL];
    img_view.image =croppedImage;
    
    if (![TV_terms.text isEqualToString:@"TITLE (35 CHARACTERS LIMIT)"])
    {
        if (TV_terms.text.length>0)
        {
            if(flag==2)
            {
                btn_attach.backgroundColor=[UIColor colorWithRed:86.0/255.0 green:82.0/255.0 blue:100.0/255.0 alpha:1.0f];
                [btn_attach setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                [btn_attach setTitle:@"ATTACHED" forState:UIControlStateNormal];
            }
        }
    }
}

- (void)photoTweaksControllerDidCancel:(PhotoTweaksViewController *)controller
{
    [controller.navigationController popViewControllerAnimated:NO];
}




//-(IBAction)ChoosePhoto:(UIButton*)sender
//{
////    EditProfileViewController *eee=[[EditProfileViewController alloc]initWithNibName:@"EditProfileViewController" bundle:nil];
////    [self.navigationController pushViewController:eee animated:NO];
//    
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
//            ipc.navigationBar.barTintColor = [UIColor colorWithRed:227.0/255 green:128.0/255 blue:139.0/255 alpha:1.0]; // Background color
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
//                     blendMode:kCGBlendModeCopy
//         
//                         alpha:1.];
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
//        if (![TV_terms.text isEqualToString:@"TITLE (35 CHARACTERS LIMIT)"])
//        {
//            if (TV_terms.text.length>0)
//            {
//                if(flag==2)
//                {
//                    btn_attach.backgroundColor=[UIColor colorWithRed:86.0/255.0 green:82.0/255.0 blue:100.0/255.0 alpha:1.0f];
//                    [btn_attach setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//                     [btn_attach setTitle:@"ATTACHED" forState:UIControlStateNormal];
//                }
//            }
//        }
//        
//    }
//    
//    
//    
//}

//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
//{
//    flag=2;
//    
//    UIImage *image22 = info[UIImagePickerControllerOriginalImage];
//    
//    //////////
//    
//    //image22 = [info objectForKey:UIImagePickerControllerEditedImage];
//    
//    if (image22.imageOrientation==UIImageOrientationLeft || image22.imageOrientation == UIImageOrientationLeftMirrored)
//        
//    {
//        
//        CGAffineTransform transform = CGAffineTransformIdentity;
//        
//        transform = CGAffineTransformTranslate(transform, image22.size.width, 0);
//        
//        transform = CGAffineTransformRotate(transform, M_PI_2);
//        
//        
//        
//        
//        
//        CGContextRef ctx = CGBitmapContextCreate(NULL, image22.size.width, image22.size.height,
//                                                 
//                                                 CGImageGetBitsPerComponent(image22.CGImage), 0,
//                                                 
//                                                 CGImageGetColorSpace(image22.CGImage),
//                                                 
//                                                 CGImageGetBitmapInfo(image22.CGImage));
//        
//        CGContextConcatCTM(ctx, transform);
//        
//        CGContextDrawImage(ctx, CGRectMake(0,0,image22.size.height,image22.size.width), image22.CGImage);
//        
//        CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
//        
//        UIImage *img22 = [UIImage imageWithCGImage:cgimg];
//        
//        CGContextRelease(ctx);
//        
//        CGImageRelease(cgimg);
//        
//        
//        
//        image22 =img22;
//        img_view.image = img22;
//    }
//    else
//    {
//        img_view.image = [info objectForKey:UIImagePickerControllerOriginalImage];
//    }
//    if (![TV_terms.text isEqualToString:@"TITLE (35 CHARACTERS LIMIT)"])
//        {
//            if (TV_terms.text.length>0)
//            {
//                if(flag==2)
//                {
//                            btn_attach.backgroundColor=[UIColor colorWithRed:86.0/255.0 green:82.0/255.0 blue:100.0/255.0 alpha:1.0f];
//                            [btn_attach setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//                             [btn_attach setTitle:@"ATTACHED" forState:UIControlStateNormal];
//                }
//            }
//        }
//
//    [picker dismissViewControllerAnimated:YES completion:NULL];
//   
//    
//}
//
//- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
//    
//    [picker dismissViewControllerAnimated:YES completion:NULL];
//    
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
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Info!" message:[NSString stringWithFormat:@"Subcatagory needs at least %@ to proceed. Please set time again",str_duration_time] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
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
-(void)viewWillAppear:(BOOL)animated
{
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    if ([pref objectForKey:@"pref_crpped_img"])
    {
         flag=2;
        img_view.image = [UIImage imageWithData:[pref objectForKey:@"pref_crpped_img"]];
    }
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
   TV_terms.text=@"TITLE (35 CHARACTERS LIMIT)";
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
       // [MBProgressHUD showHUDAddedTo:self.view animated:NO];
        
        
        NSString *str123=[NSString stringWithFormat:@"http://bringmestyle.com/webservice/get_all_subcategoryBYCAT_ID.php?service_provider_id=%@&cat_id=%@",str_user_id1,str_category_id];
        
        NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:str123]];
        
        [request setHTTPMethod:@"GET"];
        [request setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"content-type"];
        NSError *error;
        NSURLResponse *response;
        NSData *responseData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        NSDictionary *jsonDist=[NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
        
        NSLog(@"jsonDist = %@",jsonDist);
        
        
        arr_subcat_name=[[jsonDist objectForKey:@"data"]valueForKey:@"subcat_name"];
        
        
        //
        arr_subcat_id=[[jsonDist objectForKey:@"data"]valueForKey:@"subcat_id"];
        arr_duration_time=[[jsonDist objectForKey:@"data"]valueForKey:@"duration"];
        //  arr_url=[[jsonDist objectForKey:@"data"]valueForKey:@"web_url"];
        [MBProgressHUD hideHUDForView:self.view animated:NO];
        
        
    }
    [MBProgressHUD hideHUDForView:self.view animated:NO];
}

//-(UIStatusBarStyle)preferredStatusBarStyle{
//    return UIStatusBarStyleLightContent;
//}
- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize
{
    UIImage *sourceImage = self;
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor > heightFactor)
        {
            scaleFactor = widthFactor; // scale to fit height
        }
        else
        {
            scaleFactor = heightFactor; // scale to fit width
        }
        
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        // center the image
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else
        {
            if (widthFactor < heightFactor)
            {
                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
            }
        }
    }
    
    UIGraphicsBeginImageContext(targetSize); // this will crop
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    if(newImage == nil)
    {
        NSLog(@"could not scale image");
    }
    
    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
