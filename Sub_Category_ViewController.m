

#import "Sub_Category_ViewController.h"
//#import "DEMONavigationController.h"
//#import "Create_Staff_ViewController1.h"
#import "MBProgressHUD.h"
#import "EXPhotoViewer.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
#import "Create_Post_ViewController1.h"
#import "Reachability.h"
#import "Edit_Create_Post_ViewController1.h"
#import "MY_AllChat_ViewController.h"
#import "MY_AllChat2_ViewController.h"
#import "Deatils_ViewController1.h"
#import "CategoriesViewController.h"
@interface Sub_Category_ViewController ()

@end

@implementation Sub_Category_ViewController
@synthesize scr_view,stock_hold,btn_cancel,btn_detail;
@synthesize lbl_address,lbl_time,lbl_sub_category,lbl_PRICE,lbl_name,lbl_category,lbl_message,str_page_flag,btn_cancel1,btn_ok,my_alert_view,tv_description,img_profile,str_cat_id,str_cat_name,btn_newpost,lbl_color,lbl_blank,btn_dedit,btn_Msg;
- (void)viewDidLoad
{
    [super viewDidLoad];
//    if ([str_page_flag isEqualToString:@"yes"])
//    {
        self.navigationController.navigationBarHidden=YES;
//        self.title = @"MY ALL STAFF";
//        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
//                                                 initWithImage:[UIImage imageNamed:@"back32.png"] style:UIBarButtonItemStylePlain target:self action:@selector(Back_Action)];
//
//    }
//    else
//    {
//      self.navigationController.navigationBarHidden=NO;
//    self.title = @"MY ALL CATEGORY";
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
//                                             initWithImage:[UIImage imageNamed:@"dot32.png"] style:UIBarButtonItemStylePlain target:(DEMONavigationController *)self.navigationController action:@selector(showMenu)];
//        
//    }
    lbl_color.layer.masksToBounds = true;
    lbl_color.layer.cornerRadius = lbl_color.frame.size.width/2;
    
    lbl_blank.layer.masksToBounds = true;
    lbl_blank.layer.cornerRadius = lbl_blank.frame.size.width/2;
    lbl_blank.layer.borderColor = [UIColor grayColor].CGColor;
    lbl_blank.layer.borderWidth = 1.0;
    btn_newpost.layer.cornerRadius = 10.0; // this value vary as per your desire
   
    btn_newpost.clipsToBounds = YES;
    my_alert_view.hidden=YES;
//
    prefrence=[NSUserDefaults standardUserDefaults];
 
    btn_cancel1.layer.cornerRadius = 3.0; // this value vary as per your desire
    btn_cancel1.layer.borderColor=[UIColor orangeColor].CGColor;
    btn_cancel1.layer.borderWidth=1.0f;
    btn_cancel1.clipsToBounds = YES;
    
    btn_ok.layer.cornerRadius =3.0; // this value vary as per your desire
    
 
    btn_ok.layer.borderColor=[UIColor orangeColor].CGColor;
    btn_ok.layer.borderWidth=1.0f;
    btn_ok.clipsToBounds = YES;
    
 [self.view bringSubviewToFront:my_alert_view ];
    
    lbl_sub_category.text=[prefrence valueForKey:@"pref_str_cat_name"];
    
    [prefrence setObject: lbl_sub_category.text forKey:@"pref_cat_name"];
    
    
   NSString *str_cat= [prefrence valueForKey:@"pref_str_cat_id"];
    
    
     [prefrence setObject: str_cat forKey:@"pref_cat_id"];
    if ([[prefrence valueForKey:@"pref_user_type"]isEqualToString:@"user"])
    {
        btn_newpost.hidden=YES;
    }
  //[self scrollFunction];
    
//    if ([[prefrence valueForKey:@"pref_user_type"]isEqualToString:@"user"])
//    {
//        btn_cancel.hidden=YES;
//        btn_detail.hidden=YES;
//    }
}
- (IBAction)showAvatar:(UITapGestureRecognizer*)sender
{
    [EXPhotoViewer showImageFrom:(UIImageView*)sender.view];
}
-(IBAction)backclick:(id)sender
{
    //[self.navigationController popViewControllerAnimated:YES];
    
    CategoriesViewController *cate=[[CategoriesViewController alloc]initWithNibName:@"CategoriesViewController" bundle:nil];
    cate.Str_Push=@"yes";
    [self.navigationController pushViewController:cate animated:NO];
}

-(void)function
{
    [self.navigationController popViewControllerAnimated:NO];
}
-(void)viewWillAppear:(BOOL)animated
{
     self.navigationController.navigationBarHidden=YES;
     prefrence=[NSUserDefaults standardUserDefaults];
    
//    [UIView animateWithDuration:1 animations:^ {
//       lbl_sub_category.frame = CGRectMake(0, 66, [UIScreen mainScreen].bounds.size.width,45);
//    } completion:^(BOOL finished) {
//    }];
//    if ([str_page_flag isEqualToString:@"yes"])
//    {
//        self.navigationController.navigationBarHidden=NO;
//        self.title = @"MY ALL STAFF";
//        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
//                                                 initWithImage:[UIImage imageNamed:@"back32.png"] style:UIBarButtonItemStylePlain target:self action:@selector(Back_Action)];
//    }
//    else
//    {
//        self.navigationController.navigationBarHidden=NO;
//        self.title = @"MY ALL CATEGORY";
//        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
//                                                 initWithImage:[UIImage imageNamed:@"dot32.png"] style:UIBarButtonItemStylePlain target:(DEMONavigationController *)self.navigationController action:@selector(showMenu)];
//        
//    }
    
   flag=1;
    
//    if ([[prefrence valueForKey:@"pref_user_type"]isEqualToString:@"user"])
//    {
//        btn_cancel.hidden=YES;
//        btn_detail.hidden=YES;
//    }
    
 [self TogetFriendlistFunction];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)Back_Action
{
    [self.navigationController popViewControllerAnimated:NO];
}
///---------network check------------////

-(BOOL)CheckNetwork
{
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.google.com"];
    NetworkStatus NetworkStatus = [reachability currentReachabilityStatus];
    return NetworkStatus;
}

///---------web service get all job by user id---------////

-(void)TogetFriendlistFunction
{
    if ([self CheckNetwork] == NotReachable)
    {
        NSLog(@"Not Reachable");
        
        alert=[[UIAlertView alloc]initWithTitle:@"Info" message:@"No internet connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //http://youngdecadeprojects.biz/blog_app/webservice/get_all_blog.php
    prefrence=[NSUserDefaults standardUserDefaults];
    NSString *str1=[NSString stringWithFormat:@"get_all_blog.php?user_id=%@&cat_id=%@" ,[prefrence valueForKey:@"pref_User_Id"],[prefrence valueForKey:@"pref_str_cat_id"]];
    
    
    jsr1=[[JSONRequestHelper alloc]init];
    
    jsr1.delegate=self;
    
    [jsr1 RecieveRequestWithURL:str1];
}
}
-(void)DidRecieveRequest:(NSDictionary *)Dictionary
{
     NSLog(@"dictonary ---- %@",Dictionary);
   
        
        if ([[Dictionary objectForKey:@"success"] isEqualToString:@"true"])
        {
            if (flag==1)
            {
                
           
              btn_Msg.hidden=NO;
            for (UIView *subview in scr_view.subviews)
            {
                [subview removeFromSuperview];
            }

            arrdata =[[NSMutableArray alloc]init];
            
            arrdata=[Dictionary objectForKey:@"blog_detail"];
            
            
            int var = 0;
            for (int i=0; i<arrdata.count; i++)
            {
                
                NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"Custumer_orders_Staff" owner:self options:nil];
                        UIView *mainView = [subviewArray objectAtIndex:0];
                
                        stock_hold.frame=CGRectMake(0, var, 320, 98);
                
                        [scr_view addSubview:mainView];
                
                
//                btn_cancel.layer.cornerRadius = 5.0; // this value vary as per your desire
//                btn_cancel.layer.borderColor=[UIColor orangeColor].CGColor;
//                btn_cancel.layer.borderWidth=1.0f;
//                btn_cancel.clipsToBounds = YES;
//                
//                btn_detail.layer.cornerRadius =5.0; // this value vary as per your desire
//                
//                
//                btn_detail.layer.borderColor=[UIColor orangeColor].CGColor;
//                btn_detail.layer.borderWidth=1.0f;

                 btn_dedit.tag=10000+i;
               btn_detail.tag=100+i;
             btn_cancel.tag=1000+i;
                if ([[prefrence valueForKey:@"pref_user_type"]isEqualToString:@"user"])
                {
                    btn_cancel.hidden=YES;
                    btn_detail.hidden=YES;
                }
                NSURL *myurl1 = [NSURL URLWithString:[[arrdata valueForKey:@"image"] objectAtIndex:i]];
                NSLog(@"url---%@",myurl1);
                
                [img_profile setImageWithURL:myurl1 placeholderImage:[UIImage imageNamed:@"noimageavailable123.png"] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
               // img_profile.contentMode = UIViewContentModeScaleAspectFit;
                 img_profile.layer.cornerRadius =img_profile.frame.size.width/2;
                
                img_profile.layer.borderColor=[UIColor colorWithRed:86.0/255 green:82.0/255 blue:100.0/255 alpha:.50].CGColor;
                img_profile.layer.borderWidth=1.0f;
                img_profile.clipsToBounds=YES;
                UITapGestureRecognizer * tapimage=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showAvatar:)];
                
                [img_profile addGestureRecognizer:tapimage];
                
                img_profile.userInteractionEnabled=YES;
                
                str_friend_id=[[arrdata valueForKey:@"user_id"] objectAtIndex:i];
                
                lbl_name.text = [[NSString stringWithFormat:@"%@",[[arrdata objectAtIndex:i]valueForKey:@"title"]]uppercaseString];

            //  lbl_sub_category.text=[[arrdata objectAtIndex:i]valueForKey:@"subcat_name"];
             //  lbl_PRICE.text=[NSString stringWithFormat:@"%@",[[arrdata objectAtIndex:i]valueForKey:@"cat_name"]];
                
            //  tv_description.text=[[arrdata objectAtIndex:i]valueForKey:@"description"];

                
                 //    [ btn_cancel addTarget:self action:@selector(can_function:) forControlEvents:UIControlEventTouchUpInside];

                   [btn_detail addTarget:self action:@selector(detail_function:) forControlEvents:UIControlEventTouchUpInside];
                
                 [btn_dedit addTarget:self action:@selector(can_function5:) forControlEvents:UIControlEventTouchUpInside];
                
                 var=var+100;
            }
            
          scr_view.contentSize=CGSizeMake(320,var+100);
            }
            
            if (flag==2)
            {
                
                for (UIView *subview in scr_view.subviews)
                {
                    [subview removeFromSuperview];
                }
                NSLog(@"Dictionary==%@",Dictionary);
                
               
                    
                    NSLog(@"sushil");
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    
                    alert =[[UIAlertView alloc]initWithTitle:@"Info!" message:[Dictionary objectForKey:@"msg"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                    [alert show];
                    
                    
                    [self viewWillAppear:YES];
                    
                    
                    
                    
               
            }

      }
    
    else
    {

       [MBProgressHUD hideHUDForView:self.view animated:YES];
        lbl_message.text=@"No blog found";
        btn_Msg.hidden=YES;
//        alert =[[UIAlertView alloc]initWithTitle:nil message:[Dictionary objectForKey:@"msg"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//        [alert show];
       // }
        
    }
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    }

///---------cancel button-----------///

- (IBAction)can_function:(UIButton *)sender
{
    temp=(int)sender.tag;
 // SAD
    NSLog(@"cancel_tag==%ld",(long)sender.tag);
    
    Edit_Create_Post_ViewController1 *ADD1=[[Edit_Create_Post_ViewController1 alloc]initWithNibName:@"Edit_Create_Post_ViewController1" bundle:nil];
  
    ADD1.str_dec=[[arrdata objectAtIndex:sender.tag-1000]valueForKey:@"description"];
   
    ADD1.str_dure=[[arrdata objectAtIndex:sender.tag-1000]valueForKey:@"title"];
    ADD1.str_service_id=[[arrdata objectAtIndex:sender.tag-1000]valueForKey:@"blog_id"];
    ADD1.str_update_image=[[arrdata objectAtIndex:sender.tag-1000]valueForKey:@"image"];
    [self.navigationController pushViewController:ADD1 animated:NO];
    
  //  str_user_id=[prefrence valueForKey:@"pref_user_id"];
    
    str_order_id=[[arrdata objectAtIndex:sender.tag-1000] valueForKey:@"blog_id"];
    NSLog(@"str_order_id==%@",str_order_id);
    ///[self Cancel_Function];
    
}
- (IBAction)can_function5:(UIButton *)sender
{
    temp=(int)sender.tag;
    
    NSLog(@"cancel_tag==%ld",(long)sender.tag);
    
    Deatils_ViewController1 *ADD1=[[Deatils_ViewController1 alloc]initWithNibName:@"Deatils_ViewController1" bundle:nil];
    
    ADD1.str_dec=[[arrdata objectAtIndex:sender.tag-10000]valueForKey:@"description"];
    
    ADD1.str_dure=[[arrdata objectAtIndex:sender.tag-10000]valueForKey:@"title"];
    ADD1.str_service_id=[[arrdata objectAtIndex:sender.tag-10000]valueForKey:@"blog_id"];
    
    [self.navigationController pushViewController:ADD1 animated:NO];
    
    //  str_user_id=[prefrence valueForKey:@"pref_user_id"];
    
    str_order_id=[[arrdata objectAtIndex:sender.tag-10000] valueForKey:@"blog_id"];
    NSLog(@"str_order_id==%@",str_order_id);
    ///[self Cancel_Function];
    
}





///-------detail button----------///

- (IBAction)detail_function:(UIButton *)sender
{
      flag=2;
    temp=(int)sender.tag;
    my_alert_view.hidden=NO;
    
    NSLog(@"details_tag==%ld",(long)sender.tag);
   // [btn_detail setTitle:@"DEACTIVE" forState:UIControlStateNormal];
    
//    str_user_id=[prefrence valueForKey:@"pref_user_id"];
//    
   str_order_id=[[arrdata objectAtIndex:sender.tag-100] valueForKey:@"blog_id"];
    
    alert =[[UIAlertView alloc]initWithTitle:@"Delete Confirmation!!" message:@"Do You Want To Delete This blog?" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Cancel", nil];
    [alert show];

    // }
    
}
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0)
    {
        
       [self Cancel_Function];
    }
    
}
//////-------------web service cancel job-----////


-(void)Cancel_Function
{
    if ([self CheckNetwork] == NotReachable)
    {
        NSLog(@"Not Reachable");
        
        alert=[[UIAlertView alloc]initWithTitle:@"Info" message:@"No internet connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        flag=2;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSLog(@"prefrence ==%@",[prefrence valueForKey:@"pref_user_id"]);
    
    NSString *str1=[NSString stringWithFormat:@"delete_blog.php?user_id=%@&blog_id=%@",[prefrence valueForKey:@"pref_User_Id"],str_order_id];
    
    
    jsr1=[[JSONRequestHelper alloc]init];
    
    jsr1.delegate=self;
    
    [jsr1 RecieveRequestWithURL:str1];
}
}
-(void)scrollFunction
{
    int myvar;
    myvar=0;
    for (int i = 0; i<10; i++)
    {
        NSLog(@"i value---%d",i);
        
        
        
        NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"Custumer_orders_cate" owner:self options:nil];
        UIView *mainView = [subviewArray objectAtIndex:0];
        
        stock_hold.frame=CGRectMake(0, myvar, 320, 123);
        
        [scr_view addSubview:mainView];
        
        
        btn_detail.tag=100+i;
        btn_cancel.tag=1000+i;
        btn_cancel.layer.cornerRadius = 5.0; // this value vary as per your desire
        btn_cancel.layer.borderColor=[UIColor orangeColor].CGColor;
        btn_cancel.layer.borderWidth=1.0f;
        btn_cancel.clipsToBounds = YES;
        
        btn_detail.layer.cornerRadius =5.0; // this value vary as per your desire
        
        
        btn_detail.layer.borderColor=[UIColor orangeColor].CGColor;
        btn_detail.layer.borderWidth=1.0f;
[btn_detail setTitle:@"ACTIVE" forState:UIControlStateNormal];
         [ btn_detail addTarget:self action:@selector(detail_function:) forControlEvents:UIControlEventTouchUpInside];
        
         [ btn_cancel addTarget:self action:@selector(can_function:) forControlEvents:UIControlEventTouchUpInside];
        
        myvar = myvar + 125;
    }
    scr_view.contentSize = CGSizeMake(320, myvar+100);
    
}

-(IBAction)Cancel_Action:(id)sender
{
    my_alert_view.hidden=YES;
}
-(IBAction)Ok_Action:(id)sender
{
    my_alert_view.hidden=YES;
}

-(IBAction)NewPost_Action:(id)sender
{
    Create_Post_ViewController1 *creat=[[Create_Post_ViewController1 alloc]initWithNibName:@"Create_Post_ViewController1" bundle:nil];
   
    [self.navigationController pushViewController:creat animated:NO];
}
-(IBAction)message_Action:(id)sender
{
    if ([[prefrence valueForKey:@"pref_user_type"]isEqualToString:@"user"])
    {
        MY_AllChat2_ViewController *my=[[MY_AllChat2_ViewController alloc]initWithNibName:@"MY_AllChat2_ViewController" bundle:nil];
        my.STR_USER_ID1=str_friend_id;
        my.str_Showreview=@"no";
        [self.navigationController pushViewController:my animated:NO];
    }
    else
    {
    MY_AllChat_ViewController *my=[[MY_AllChat_ViewController alloc]initWithNibName:@"MY_AllChat_ViewController" bundle:nil];
    [self.navigationController pushViewController:my animated:NO];
    }
}

@end
