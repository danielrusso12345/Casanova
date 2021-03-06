

#import "My_Message_ViewController.h"
//#import "DEMONavigationController.h"
#import "MBProgressHUD.h"
//#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
//#import "Home_ViewController.h"
//#import "ChatViewController.h"
#import "Reachability.h"
#import "View_Attachments_VC.h"
@interface My_Message_ViewController ()

@end

@implementation My_Message_ViewController
@synthesize scr_view,stock_hold,btn_cancel,btn_detail;
@synthesize lbl_address,lbl_time,lbl_date,lbl_sub_category,lbl_name,lbl_category,lbl_message,str_page_flag,btn_cancel1,btn_ok,my_alert_view,lbl_phone,lbl_appointment,TV_terms,lbl_color,lbl_blank,str_cat_id,str_user_id2;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    lbl_color.layer.masksToBounds = true;
    lbl_color.layer.cornerRadius = lbl_color.frame.size.width/2;//12.0;
    lbl_color.layer.borderColor = [UIColor grayColor].CGColor;
    lbl_color.layer.borderWidth = 1.0;
    
    lbl_blank.layer.masksToBounds = true;
    lbl_blank.layer.cornerRadius = lbl_blank.frame.size.width/2;//12.0;
    lbl_blank.layer.borderColor = [UIColor grayColor].CGColor;
    lbl_blank.layer.borderWidth = 1.0;
//    if ([str_page_flag isEqualToString:@"yes"])
//    {
//        self.navigationController.navigationBarHidden=NO;
//        self.title = @"MY APPOINTMENT";
//        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
//                                                 initWithImage:[UIImage imageNamed:@"back32.png"] style:UIBarButtonItemStylePlain target:self action:@selector(Back_Action)];
//    
//    }
//    else
//    {
//      self.navigationController.navigationBarHidden=NO;
//    self.title = @"MY APPOINTMENT";
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
//                                             initWithImage:[UIImage imageNamed:@"dot32.png"] style:UIBarButtonItemStylePlain target:(DEMONavigationController *)self.navigationController action:@selector(showMenu)];
//        
//    }
    
    my_alert_view.hidden=YES;
//
    prefrence=[NSUserDefaults standardUserDefaults];
 
    btn_cancel1.layer.cornerRadius = 3.0; // this value vary as per your desire
    btn_cancel1.layer.borderColor=[UIColor grayColor].CGColor;
    btn_cancel1.layer.borderWidth=1.0f;
    btn_cancel1.clipsToBounds = YES;
    
    btn_ok.layer.cornerRadius =3.0; // this value vary as per your desire
    
    
    btn_ok.layer.borderColor=[UIColor orangeColor].CGColor;
    btn_ok.layer.borderWidth=1.0f;
    btn_ok.clipsToBounds = YES;
    
    [self.view bringSubviewToFront:my_alert_view ];
    
   // [self TogetFriendlistFunction];
    
}
-(IBAction)backclick:(id)sender
{
    [self.navigationController popViewControllerAnimated:NO];
   
}

-(void)function
{
    [self.navigationController popViewControllerAnimated:NO];
}
-(void)viewWillAppear:(BOOL)animated
{
    
     prefrence=[NSUserDefaults standardUserDefaults];
    
    
        self.navigationController.navigationBarHidden=YES;
    
    
   flag=1;
   
   [self TogetFriendlistFunction];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)Back_Action
{
//    Home_ViewController *homee=[[Home_ViewController alloc]initWithNibName:@"Home_ViewController" bundle:nil];
//    [self.navigationController pushViewController:homee animated:NO];
    
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
   
    prefrence=[NSUserDefaults standardUserDefaults];
    NSString *str1=[NSString stringWithFormat:@"get_all_messageBYid.php?user_id=%@&user_id1=%@&cat_id=%@" ,[prefrence valueForKey:@"pref_User_Id"],str_user_id2,str_cat_id];
    
    
    jsr1=[[JSONRequestHelper alloc]init];
    
    jsr1.delegate=self;
    
    [jsr1 RecieveRequestWithURL:str1];
}
}
-(void)DidRecieveRequest:(NSDictionary *)Dictionary
{
     NSLog(@"dictonary ---- %@",Dictionary);
   
    if (flag==1)
    {
        
    
        if ([[Dictionary objectForKey:@"success"] isEqualToString:@"true"])
        {
            arrdata =[[NSMutableArray alloc]init];
            
            arrdata=[Dictionary objectForKey:@"msg_data"];
            
          // scr_view.contentOffset = CGPointMake(0,0);
            
            
            
            int var = 0;
            for (int i=0; i<arrdata.count; i++)
            {
                
                NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"Custumer_orders" owner:self options:nil];
                        UIView *mainView = [subviewArray objectAtIndex:0];
                
                        stock_hold.frame=CGRectMake(0, var, 320, 168);
                
                btn_cancel.layer.cornerRadius = 5.0; // this value vary as per your desire
                btn_cancel.layer.borderColor=[UIColor grayColor].CGColor;
                btn_cancel.layer.borderWidth=1.0f;
                btn_cancel.clipsToBounds = YES;
                
                btn_detail.layer.cornerRadius =5.0; // this value vary as per your desire
                
                
                btn_detail.layer.borderColor=[UIColor orangeColor].CGColor;
                btn_detail.layer.borderWidth=1.0f;
                
                        [scr_view addSubview:mainView];
                
               btn_detail.tag=100+i;
             btn_cancel.tag=10000+i;
                NSString *str_data=[[arrdata objectAtIndex:i] valueForKey:@"flag"];
                if ([str_data integerValue] ==1)
                {
                    lbl_name.backgroundColor=[UIColor colorWithRed:148.0/255 green:110.0/255 blue:131.0/255 alpha:1.0];
                      lbl_name.text=[[[arrdata objectAtIndex:i] valueForKey:@"from_user_name"] uppercaseString];
                }
                else
                {
                    lbl_name.backgroundColor=[UIColor colorWithRed:227.0/255 green:128.0/255 blue:139.0/255 alpha:1.0];
                    lbl_name.text=[[[arrdata objectAtIndex:i] valueForKey:@"from_user_name"] uppercaseString];
                }
      
//                TV_terms.layer.cornerRadius = 5.0; // this value vary as per your desire
//                TV_terms.layer.borderColor=[UIColor grayColor].CGColor;
//                TV_terms.layer.borderWidth=1.0f;
//                TV_terms.clipsToBounds = YES;
                
                NSString * str_att=[NSString stringWithFormat:@"%@",[[arrdata objectAtIndex:i] valueForKey:@"message_attachment"]];
                if ([str_att isEqualToString:@"NA"])
                {
                    btn_cancel.hidden=YES;
                }
                else
                {
                    btn_cancel.hidden=NO;
                    [ btn_cancel addTarget:self action:@selector(can_function:) forControlEvents:UIControlEventTouchUpInside];
                }
                
                TV_terms.text=[[arrdata objectAtIndex:i] valueForKey:@"message"];
                
               
               
                CGSize tempSize1 = [self  heigtForLblwithString:TV_terms.text withFont:[UIFont fontWithName:@"Palatino" size:15.0]];
                //NSLog(@"new about size===%f",tempSize2.width);
                
                  TV_terms.frame=CGRectMake(TV_terms.frame.origin.x,TV_terms.frame.origin.y,TV_terms.frame.size.width,tempSize1.height);
                
               // TV_terms.text=[[arrdata objectAtIndex:i] valueForKey:@"message"];
                 btn_cancel.frame=CGRectMake(btn_cancel.frame.origin.x,TV_terms.frame.origin.y+tempSize1.height+10,btn_cancel.frame.size.width,btn_cancel.frame.size.height);
                
             
//                
//             NSString *str_date1 = [NSString stringWithFormat:@"%@",[[arrdata objectAtIndex:i] valueForKey:@"date"]];
//                
//               NSString *str_time1  = [NSString stringWithFormat:@"%@",[[arrdata objectAtIndex:i] valueForKey:@"time"]];
//                
//                lbl_time.text = [NSString stringWithFormat:@"%@/%@",str_date1,str_time1];
//                //appointment_id
//                lbl_appointment.text=[[arrdata objectAtIndex:i]valueForKey:@"appointment_id"];
//               lbl_phone.text=[[arrdata objectAtIndex:i]valueForKey:@"phone"];
//              lbl_category.text=[[arrdata objectAtIndex:i]valueForKey:@"cat_name"];
//                lbl_sub_category.text=[[arrdata objectAtIndex:i]valueForKey:@"subcat_name"];
//                
//                [ btn_detail addTarget:self action:@selector(detail_function:) forControlEvents:UIControlEventTouchUpInside];
//             
//                
//                
//
//                
//                if (![[[arrdata objectAtIndex:i] valueForKey:@"status"] isEqualToString:@"Pending"])
//                {
//                    if ([[[arrdata objectAtIndex:i] valueForKey:@"through"] isEqualToString:@"app"])
//                    {
//                        
//                   
//                    btn_detail.enabled=NO;
//                    btn_cancel.enabled=NO;
//                    if ([[[arrdata objectAtIndex:i] valueForKey:@"status"] isEqualToString:@"Accepted"])
//                    {
//                        
//                        [btn_detail setTitle:@"ACCEPTED" forState:UIControlStateNormal];
//                    }
//                    else  if ([[[arrdata objectAtIndex:i] valueForKey:@"status"] isEqualToString:@"Rejected"])
//                    {
//                        
//                        [btn_cancel setTitle:@"REJECTED" forState:UIControlStateNormal];
//                        
//                    }
//                    }
//                    else
//                    {
//                        btn_detail.hidden=YES;
//                        btn_cancel.enabled=NO;
//                        [btn_cancel setTitle:@"WALK-IN" forState:UIControlStateNormal];
//                    }
//                    
//                }
//                if ([[[arrdata objectAtIndex:i] valueForKey:@"cancel_user"] isEqualToString:@"yes"])
//                {
//                    btn_detail.enabled=NO;
//                    btn_detail.hidden=YES;
//                    btn_cancel.enabled=NO;
//                    [btn_cancel setTitle:@"CANCELLED" forState:UIControlStateNormal];
//                }
                // var=var+311;
                
                 var = var + btn_cancel.frame.origin.y+btn_cancel.frame.size.height+10;
            }
           
          scr_view.contentSize=CGSizeMake(320,var+100);
            
             scr_view.contentOffset=CGPointMake(0, var+100-[UIScreen mainScreen].bounds.size.height);
          
      }
        else
        {
            alert =[[UIAlertView alloc]initWithTitle:@"Info!" message:[Dictionary objectForKey:@"msg"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
        }

    }
   
    
       [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    }

///---------cancel button-----------///

- (IBAction)can_function:(UIButton *)sender
{
    temp=(int)sender.tag;
    flag=2;
    NSLog(@"cancel_tag==%ld",(long)sender.tag);
    
   // str_user_id=[prefrence valueForKey:@"pref_user_id"];
    //[arr_subcat_name1 objectForKey:@"message_attachment"]
   // str_status=@"Rejected";
    str_Details_id=[NSString stringWithFormat:@"%@",[[arrdata objectAtIndex:sender.tag-10000] valueForKey:@"message_attachment"]];
   // str_time=[[arrdata objectAtIndex:sender.tag-10000] valueForKey:@"time"];
   // str_date=[[arrdata objectAtIndex:sender.tag-10000] valueForKey:@"date"];
   // [prefrence setObject:str_Details_id forKey:@"pref_details"];
    NSLog(@"str_Details_id==%@",str_Details_id);
    
    if ([str_Details_id isEqualToString:@"NA"])
    {
        UIAlertView   *MyAlert = [[UIAlertView alloc] initWithTitle:@"Info!" message:@"No attachment found" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [MyAlert show];
    }
    else
    {
        
        NSMutableArray *ARR=[[NSMutableArray alloc]init];
        ARR=[[arrdata objectAtIndex:sender.tag-10000] valueForKey:@"message_attachment"];
        View_Attachments_VC *send=[[View_Attachments_VC alloc]initWithNibName:@"View_Attachments_VC" bundle:nil];
        // send.str_service_id=str_message_id;
        send.arr_images=ARR;
        [self.navigationController pushViewController:send animated:NO];
    }
    
    
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0)
    {
        if ([self CheckNetwork] == NotReachable)
        {
            NSLog(@"Not Reachable");
            
             alert=[[UIAlertView alloc]initWithTitle:@"info" message:@"NO Internet Connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            
            [MBProgressHUD hideHUDForView:self.view animated:NO];
        }
        else
        {
            
           // [self Cancel_Function];
           
        }
    }
    else if (buttonIndex==1)
    {
        NSLog(@"cancel");
    }
}

///-------detail button----------///

- (IBAction)detail_function:(UIButton *)sender
{
    temp=(int)sender.tag;
   
    NSLog(@"details_tag==%ld",(long)sender.tag);
    flag=2;
   str_status=@"Accepted";
   // cxv
    str_Details_id=[[arrdata objectAtIndex:sender.tag-100] valueForKey:@"appointment_id"];
    str_time=[[arrdata objectAtIndex:sender.tag-100] valueForKey:@"time"];
    str_date=[[arrdata objectAtIndex:sender.tag-100] valueForKey:@"date"];
    
    [prefrence setObject:str_time forKey:@"pref_time"];
    [prefrence setObject:str_date forKey:@"pref_date"];
    [prefrence setObject:str_Details_id forKey:@"pref_details"];
    
  
     NSLog(@"str_Details_id==%@",str_Details_id);
    
    alert=[[UIAlertView alloc]initWithTitle:@"Confirmation" message:@"Do you want to accept this order...?" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Yes",@"No", nil];
    alert.tag=2;//Accepted alert Tag
    [alert show];
    
    //[self Cancel_Function];

    
}

//////-------------web service cancel job-----////
//
//-(void)Check_Function
//{
//    if ([self CheckNetwork] == NotReachable)
//    {
//        NSLog(@"Not Reachable");
//        
//        alert=[[UIAlertView alloc]initWithTitle:@"Info" message:@"No internet connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//        [alert show];
//    }
//    else
//    {
//        flag=5;
//        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//        
//        NSLog(@"prefrence ==%@",[prefrence valueForKey:@"pref_User_Id"]);
//        
//        
//        NSArray *array = [str_time componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
//        // NSString *str1=[NSString stringWithFormat:@"accept_reject.php?service_provider_id=%@",[prefrence valueForKey:@"pref_User_Id"]];
//        NSString *str2=[NSString stringWithFormat:@"check_existtime_appointment.php?service_provider_id=%@&appointment_id=%@&status=%@&date=%@&time=%@%@",[prefrence valueForKey:@"pref_User_Id"],str_Details_id,str_status,str_date,[array objectAtIndex:0],[array objectAtIndex:1]];
//        //NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@" "];
//        //str2 = [[str2 componentsSeparatedByCharactersInSet: doNotWant] componentsJoinedByString: @"%20"];
//        NSLog(@".....%@", str2); // => foobarbazfoo
//        
//        jsr1=[[JSONRequestHelper alloc]init];
//        
//        jsr1.delegate=self;
//        
//        [jsr1 RecieveRequestWithURL:str2];
//    }
//}
//

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
        
        NSLog(@"prefrence ==%@",[prefrence valueForKey:@"pref_User_Id"]);
        
        // NSString *str1=[NSString stringWithFormat:@"accept_reject.php?service_provider_id=%@",[prefrence valueForKey:@"pref_User_Id"]];
        NSString *str1=[NSString stringWithFormat:@"accept_reject.php?service_provider_id=%@&appointment_id=%@&status=%@",[prefrence valueForKey:@"pref_User_Id"],[prefrence valueForKey:@"pref_details"],str_status];
        
        jsr1=[[JSONRequestHelper alloc]init];
        
        jsr1.delegate=self;
        
        [jsr1 RecieveRequestWithURL:str1];
    }
}
//-(void)scrollFunction
//{
//    int myvar;
//    myvar=0;
//    for (int i = 0; i<10; i++)
//    {
//        NSLog(@"i value---%d",i);
//        
//        
//        
//        NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"Custumer_orders" owner:self options:nil];
//        UIView *mainView = [subviewArray objectAtIndex:0];
//        
//        stock_hold.frame=CGRectMake(0, myvar, 320, 182);
//        
//        [scr_view addSubview:mainView];
//        
//        
//        btn_cancel.layer.cornerRadius = 5.0; // this value vary as per your desire
//        btn_cancel.layer.borderColor=[UIColor orangeColor].CGColor;
//        btn_cancel.layer.borderWidth=1.0f;
//        btn_cancel.clipsToBounds = YES;
//        
//        btn_detail.layer.cornerRadius =5.0; // this value vary as per your desire
//        
//        
//        btn_detail.layer.borderColor=[UIColor orangeColor].CGColor;
//        btn_detail.layer.borderWidth=1.0f;
//
//      [ btn_detail addTarget:self action:@selector(detail_function:) forControlEvents:UIControlEventTouchUpInside];
//        
//        
//        myvar = myvar + 184;
//    }
//    scr_view.contentSize = CGSizeMake(320, myvar+100);
//    
//}

-(IBAction)Cancel_Action:(id)sender
{
    my_alert_view.hidden=YES;
}
-(IBAction)Ok_Action:(id)sender
{
    my_alert_view.hidden=YES;
     flag=2;
    [self Cancel_Function];
   
}
//-(CGSize)heigtForLblwithString:(NSString *)stringValue withFont:(UIFont*)font :(CGSize)SenderFrame
//{
//    CGSize constraint = CGSizeMake(SenderFrame.width+30,1000);
//    NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:@"Palatino" size:15.0]};
//    
//    CGRect rect = [stringValue boundingRectWithSize:constraint options:         (NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:attributes context:nil];
//    
//    return rect.size;
//    
//}

-(CGSize)heigtForLblwithString:(NSString *)stringValue withFont:(UIFont*)font{
    CGSize constraint = CGSizeMake(300,9999); // Replace 300 with your label width
    NSDictionary *attributes = @{NSFontAttributeName: font};
    CGRect rect = [stringValue boundingRectWithSize:constraint options:         (NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:attributes context:nil];
    return rect.size;
    
}


@end
