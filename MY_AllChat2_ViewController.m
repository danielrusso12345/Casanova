//
//  HomeViewController.m
//  TennisWalesLeaders
//
//  Created by mac on 10/30/15.
//  Copyright (c) 2015 youngdecade. All rights reserved.
//

#import "MY_AllChat2_ViewController.h"
#import "EXPhotoViewer.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
#import "Reachability.h"
#import "MBProgressHUD.h"
#import "Responds_ViewController.h"
#import "My_Message_ViewController.h"
#import "Send_ViewController1.h"
#import "Sub_Category_ViewController.h"
#import "CategoriesViewController.h"
//#import "DEMONavigationController.h"
@interface MY_AllChat2_ViewController ()

@end

@implementation MY_AllChat2_ViewController
@synthesize scroll_view1,Lbl_Name,home,lbl_date,lbl_time;

@synthesize img1,str_Showreview,arr_showReview,lbl_message,tv_message,Btn_details,img_category,lbl_category,lbl_blank,lbl_color,BTN_msg,STR_USER_ID1,LBL_MSG;

-(void)ConnectionNotEstablish
{
    [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Info" message:@"No internet connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    

    LBL_MSG.hidden=YES;
 
    
    pref = [NSUserDefaults standardUserDefaults];
    //img1.layer.masksToBounds = true;
    
    [pref removeObjectForKey:@"user_lost_item"];
  
    tv_message.editable=NO;
    tv_message.scrollEnabled=YES;
    lbl_color.layer.masksToBounds = true;
    lbl_color.layer.cornerRadius = lbl_color.frame.size.width/2;//12.0;
    
    lbl_blank.layer.masksToBounds = true;
    lbl_blank.layer.cornerRadius = lbl_blank.frame.size.width/2;//12.0;
    lbl_blank.layer.borderColor = [UIColor grayColor].CGColor;
    lbl_blank.layer.borderWidth = 1.0;
    
    BTN_msg.layer.masksToBounds = true;
    BTN_msg.layer.cornerRadius = 5.0;
   // lbl_blank.layer.borderColor = [UIColor grayColor].CGColor;
    //lbl_blank.layer.borderWidth = 1.0;
    
//    self.scroll_view1.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"edit_profile_bg.png"]];
    
              self.navigationController.navigationBarHidden=YES;
    
//    if ([str_Showreview isEqualToString:@"1"])
//    {
//         self.title = @"INBOX";
//        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
//                                                 initWithImage:[UIImage imageNamed:@"back32.png"] style:UIBarButtonItemStylePlain target:self action:@selector(backclick:)];
//    }
//    else
//    {
//    self.title = @"INBOX";
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
//                                             initWithImage:[UIImage imageNamed:@"dot32.png"] style:UIBarButtonItemStylePlain target:(DEMONavigationController *)self.navigationController action:@selector(showMenu)];
//    
//    }
//   
    
    // Do any additional setup after loading the view from its nib.
   // [self loginfun];
    
   // [self scrollFunction];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(BOOL)CheckNetwork
{
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.google.com"];
    NetworkStatus NetworkStatus = [reachability currentReachabilityStatus];
    return NetworkStatus;
}


-(void)viewWillAppear:(BOOL)animated
{
    flag = 1;
    
    //self.navigationController.navigationBarHidden=YES;

    [self loginfun];
  //  [self performSelector:@selector(startTimer) withObject:nil afterDelay:0.0005];
}
- (void)startTimer
{
    timer =
    [NSTimer scheduledTimerWithTimeInterval:10.7
                                     target:self
                                   selector:@selector(targetMethod:)
                                   userInfo:nil
                                    repeats:YES];
}
-(IBAction)targetMethod:(id)sender
{
    //[MBProgressHUD showHUDAddedTo:self.view animated:NO];
    if ([self CheckNetwork] == NotReachable)
    {
        //[self stopTimer];
        NSLog(@"Not Reachable");
        // [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Info" message:@"Slow or no internet connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        
        //        [HHAlertView showAlertWithStyle:HHAlertStyleError inView:self.view Title:@"Info" detail:@"Slow or no internet connection" cancelButton:nil Okbutton:@"Ok"];
    }
    else
    {
        [self loginfun];
    }
    
}
- (void)stopTimer {
    if ([timer isValid]) {
        [timer invalidate];
    }
    timer = nil;
}
-(void)loginfun
{
    if ([self CheckNetwork] == NotReachable)
    {
        NSLog(@"Not Reachable");
        
        UIAlertView *  alert=[[UIAlertView alloc]initWithTitle:@"info" message:@"NO Internet Connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }
    else
    {
        flag = 1;
    
        NSLog(@"Flag 1 ----- %d",flag);
    
       // [self activityIndicatorCall];
    
    // http://youngdecadeprojects.biz/charity/webservice/getall_story.php
    
       [MBProgressHUD showHUDAddedTo:self.view animated:NO];
//        NSString *str = [NSString stringWithFormat:@"show_all_chat.php?user_id=%@",[pref valueForKey:@"pref_user_id"]];
//        
//        if([[pref valueForKey:@"pref_log_in"]isEqualToString:@"providers"])
//        {
//            
//            str =[NSString stringWithFormat:@"show_all_chat.php?service_provider_id=%@&flag=service-provider",[pref valueForKey:@"pref_User_Id"]];
//        }
//        else
//        {
            str =[NSString stringWithFormat:@"show_all_message.php?user_id=%@",[pref valueForKey:@"pref_User_Id"]];
       // }

        
        jsr =[[JSONRequestHelper alloc]init];
        jsr.delegate = self;
        [jsr RecieveRequestWithURL:str];
    }
}

- (IBAction)Activity_PostDetails:(UIButton*)sender
{
    NSLog(@"Btn Tag --- %ld",(long)sender.tag);
    
    [self stopTimer];
        str_user_id1=[[Arr_data objectAtIndex:sender.tag-100]valueForKey:@"message_id"];
    //  [NSThread detachNewThreadSelector: @selector(Start) toTarget:self withObject:nil];
   // NSString *str_lost_found_id=[[Arr_data objectAtIndex:sender.tag-100]valueForKey:@"lost_n_found_id"];
   // [pref setObject:str_lost_found_id forKey:@"user_lost_item"];
    
    
    NSString *str_cat_ismess=  [[Arr_data objectAtIndex:sender.tag-100]valueForKey:@"cat_id"];
    
    [pref setObject:str_cat_ismess forKey:@"pref_str_cat_id"];
    
    NSString *str_cat_ismother=  [[Arr_data objectAtIndex:sender.tag-100]valueForKey:@"from_userid"];
    
    [pref setObject:str_cat_ismother forKey:@"pref_str_other_id"];
//
//    if ([[[Arr_data valueForKey:@"flag"] objectAtIndex:sender.tag-100]isEqualToString:@"received"])
//    {
    Responds_ViewController *chat=[[Responds_ViewController alloc]initWithNibName:@"Responds_ViewController" bundle:nil];
         chat.str_user_id2=[[Arr_data objectAtIndex:sender.tag-100]valueForKey:@"from_userid"];
  //  chat.Str_sub_category_name=[[Arr_data objectAtIndex:sender.tag-100]valueForKey:@"message"];
  //  chat.str_sub_cate=[[Arr_data objectAtIndex:sender.tag-100]valueForKey:@"from_user_name"];
    chat.str_category_id=[[Arr_data objectAtIndex:sender.tag-100]valueForKey:@"cat_id"];
        chat.str_message_id=str_user_id1;
    chat.Str_flag_update_message=@"no";
    //chat.str_lost_found_id=[[Arr_data objectAtIndex:sender.tag-100]valueForKey:@"lost_n_found_id"];
    
    [self.navigationController pushViewController:chat animated:NO];
//    }
//   else
//   {
//       My_Message_ViewController *chat1=[[My_Message_ViewController alloc]initWithNibName:@"My_Message_ViewController" bundle:nil];
//      // chat1.Str_sub_category_name=[[Arr_data objectAtIndex:sender.tag-100]valueForKey:@"message"];
//       chat1.str_user_id2=[[Arr_data objectAtIndex:sender.tag-100]valueForKey:@"from_userid"];
//       chat1.str_cat_id=[[Arr_data objectAtIndex:sender.tag-100]valueForKey:@"cat_id"];
//       //chat.str_lost_found_id=[[Arr_data objectAtIndex:sender.tag-100]valueForKey:@"lost_n_found_id"];
//       [self.navigationController pushViewController:chat1 animated:YES];
//   }
}
- (IBAction)back:(id)sender
{
    [self stopTimer];
    if ([str_Showreview isEqualToString:@"yes"])
    {
      
        CategoriesViewController *sub_ds=[[CategoriesViewController alloc]initWithNibName:@"CategoriesViewController" bundle:nil];
        [self.navigationController pushViewController:sub_ds animated:NO];
    }
    else
    {
//    Sub_Category_ViewController *sub_ds=[[Sub_Category_ViewController alloc]initWithNibName:@"Sub_Category_ViewController" bundle:nil];
//    [self.navigationController pushViewController:sub_ds animated:NO];
        
        [self.navigationController popViewControllerAnimated:NO];
    }
   // [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)showAvatar:(UITapGestureRecognizer*)sender
{
    [EXPhotoViewer showImageFrom:(UIImageView*)sender.view];
}


// ----XXXX---- Action Methods Close-----XXXX---- //


// ---------- Get Method Parsing ----------- //

-(void)DidRecieveRequest:(NSDictionary *)Dictionary
{
    NSLog(@"Dictionary --- %@",Dictionary);
    
    NSLog(@"flag----%d",flag);
    NSString *str_success =[NSString stringWithFormat:@"%@",[Dictionary valueForKey:@"success"]];
    
    if ([str_success isEqualToString:@"true"])
    {
         LBL_MSG.hidden=YES;
        Arr_data =[[NSMutableArray alloc]init];
        
        //
      
        Arr_data =[Dictionary valueForKey:@"msg_data"];
        NSLog(@"Arr_data====%@",[Dictionary valueForKey:@"msg_data"]);
        myvar =0;
//        if ([[Dictionary valueForKey:@"msg_data"]isEqualToString:@"[]"])
//        {
//        }
        if ([Arr_data objectAtIndex:0])
        {
        for (int i = 0;i<Arr_data.count; i++)
        {
            NSLog(@"i value---%d",i);
            
            NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"Reviews2" owner:self options:nil];
            
            UIView *mainView = [subviewArray objectAtIndex:0];
            
            home.frame=CGRectMake(0, myvar, self.view.bounds.size.width, 60);
            
            
            [scroll_view1 addSubview:mainView];
            
            
            img1.layer.cornerRadius =  img1.frame.size.height/2;
            
            img1.layer.BorderColor = [[UIColor colorWithRed:227.0/255.0 green:128.0/255.0 blue:139.0/255.0 alpha:1.0f] CGColor];
            img1.layer.BorderWidth = 1;
            img1.clipsToBounds=YES;
            tv_message.editable=NO;
            tv_message.scrollEnabled=YES;
            
            Lbl_Name.text =[[NSString stringWithFormat:@"%@",[[Arr_data valueForKey:@"from_user_name"] objectAtIndex:i]] uppercaseString];
          //  lbl_message.text=[NSString stringWithFormat:@"%@",[[Arr_data valueForKey:@"message"] objectAtIndex:i]];
            
            if ([[[Arr_data valueForKey:@"flag"] objectAtIndex:i]isEqualToString:@"received"])
            {
                lbl_time.text=[NSString stringWithFormat:@"MESSAGE RECEIVED"];
            }
            else
            {
                lbl_time.text=[NSString stringWithFormat:@"MESSAGE SENT"];
            }
          
            str_user_id5=[[Arr_data valueForKey:@"user_id"] objectAtIndex:i];
          //  lbl_date.text=[NSString stringWithFormat:@"%@",[[Arr_data valueForKey:@"date"] objectAtIndex:i]];
            str_other_user_id=[[Arr_data valueForKey:@"from_userid"] objectAtIndex:i];
            Btn_details.tag=100+i;
            NSLog(@"Btn_details==%ld",(long)Btn_details.tag);
            [ Btn_details addTarget:self action:@selector(Activity_PostDetails:) forControlEvents:UIControlEventTouchUpInside];
 
            NSURL *myurl123 = [NSURL URLWithString:[[Arr_data valueForKey:@"from_user_image"] objectAtIndex:i]];
            
            [img1 setImageWithURL:myurl123 placeholderImage:[UIImage imageNamed:@"noimageavailable123.png"] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
            
            UITapGestureRecognizer * tapimage=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showAvatar:)];
            
            [img1 addGestureRecognizer:tapimage];
            
            img1.userInteractionEnabled=YES;


            
            myvar = myvar + 62;
        }
        scroll_view1.contentSize = CGSizeMake(320, myvar+100);

        }
        
    }
    
    else
    {
      [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        LBL_MSG.hidden=NO;
//        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Info" message:[Dictionary objectForKey:@"msg"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//        [alert show];
        //[self.navigationController popViewControllerAnimated:YES];
    }
    [MBProgressHUD hideHUDForView:self.view animated:YES];

}




-(void)scrollFunction
{
     myvar =0;
    for (int i = 0; i<10; i++)
    {
        NSLog(@"i value---%d",i);
        
        NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"Reviews" owner:self options:nil];
        
        UIView *mainView = [subviewArray objectAtIndex:0];
        
        home.frame=CGRectMake(0, myvar, 320, 60);
        
        
        [scroll_view1 addSubview:mainView];
        
        
        img1.layer.cornerRadius = 25.0;
        img1.layer.BorderColor = [[UIColor grayColor] CGColor];
        img1.layer.BorderWidth = 1;
        img1.clipsToBounds=YES;
        tv_message.editable=NO;
        tv_message.scrollEnabled=YES;
        
        myvar = myvar + 62;
    }
    scroll_view1.contentSize = CGSizeMake(320, myvar+50);
   // [_multiColorLoader stopAnimation];
}


-(IBAction)backclick:(id)sender
{
    [self.navigationController popViewControllerAnimated:NO];
}


-(IBAction)Write_Message:(id)sender
{
    Send_ViewController1 *send=[[Send_ViewController1 alloc]initWithNibName:@"Send_ViewController1" bundle:nil];
   // send.Str_flag_update=@"yes";
   send.str_service_id=[pref valueForKey:@"pref_Admin_id"];
  // send.str_pages=@"";
    [self.navigationController pushViewController:send animated:NO];
}
@end
