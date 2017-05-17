//
//  ShowroomCategoriesViewController.m
//  FreelancerPro
//
//  Created by Mac on 9/6/16.
//  Copyright (c) 2016 YoungDecade. All rights reserved.
//

#import "CategoriesViewController.h"
//#import "ProfileViewController.h"
//#import "Search_ViewController.h"
//#import "Favourites_ViewController.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
//#import "InfoViewController.h"
#import "LoginViewController.h"
//#import "ShowCase_ViewController.h"
#import "MBProgressHUD.h"
#import "Update_SignupVC.h"
//#import "Setting_ViewController.h"
//#import "Profile_BuyerVC.h"
#import "AppDelegate.h"
#import "Reachability.h"
#import "Sub_Category_ViewController.h"
#import "MY_AllChat_Start_ViewController.h"
#import "MY_AllChat2_ViewController.h"
@interface CategoriesViewController ()

@end

@implementation CategoriesViewController
@synthesize lbl_prog,lbl_skill,lbl_work,btn_next,img_view,scroll_view1,home,myAudioPlayer,lbl_blank,lbl_color;
@synthesize BTN_NewStu,BTN_Seduction,BTN_Sex,BTN_Wadroble,BTN_Parties,BTN_Relation,BTN_Food,BTN_drugs,BTN_Pot,Str_Push;

- (void)viewDidLoad
{
    [super viewDidLoad];
     self.navigationController.navigationBarHidden=YES;
 //   NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"Facebook_Pop" ofType: @"mp3"];
    FlagFirst=1;
   // NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath ];
   // myAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
    // myAudioPlayer.numberOfLoops = INFINITY; //  -1  //infinite loop
   // [myAudioPlayer play];

    pref=[NSUserDefaults standardUserDefaults];
    // self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"grediant-bg.png"]];
    
    Arr_image_skill=[[NSMutableArray alloc]init];
     Arr_program=[[NSMutableArray alloc]init];
     Arr_works=[[NSMutableArray alloc]init];
     Arr_skill_name=[[NSMutableArray alloc]init];
    
    lbl_color.layer.masksToBounds = true;
    lbl_color.layer.cornerRadius = lbl_color.frame.size.width/2;
    
    lbl_blank.layer.masksToBounds = true;
    lbl_blank.layer.cornerRadius = lbl_blank.frame.size.width/2;
    lbl_blank.layer.borderColor = [UIColor grayColor].CGColor;
    lbl_blank.layer.borderWidth = 1.0;
}
-(void)viewWillAppear:(BOOL)animated
{
   // [self getAlltype];
//    if ([Str_Push isEqualToString:@"yes"])
//    {
//        
//        if ([[pref objectForKey:@"pref_str_cat_id"] isEqualToString:@"1"])
//        {
//            [self.view bringSubviewToFront:BTN_NewStu];
//            [UIView animateWithDuration:1 animations:^ {
//                BTN_NewStu.frame=CGRectMake(BTN_NewStu.frame.origin.x, BTN_NewStu.frame.origin.y+50, BTN_NewStu.frame.size.width, BTN_NewStu.frame.size.height);
//            } completion:^(BOOL finished) {
//            }];
//            
//            [UIView animateWithDuration:2 animations:^ {
//                BTN_NewStu.frame=CGRectMake(BTN_NewStu.frame.origin.x, BTN_NewStu.frame.origin.y-50, BTN_NewStu.frame.size.width, BTN_NewStu.frame.size.height);
//            } completion:^(BOOL finished) {
//            }];
//           
//        }
//        else if ([[pref objectForKey:@"pref_str_cat_id"] isEqualToString:@"2"])
//        {
//            [self.view bringSubviewToFront:BTN_Seduction];
//            [UIView animateWithDuration:1 animations:^ {
//                  BTN_Seduction.frame=CGRectMake(BTN_Seduction.frame.origin.x, BTN_Seduction.frame.origin.y+50, BTN_Seduction.frame.size.width, BTN_Seduction.frame.size.height);
//            } completion:^(BOOL finished) {
//            }];
//            
//            [UIView animateWithDuration:2 animations:^ {
//                BTN_Seduction.frame=CGRectMake(BTN_Seduction.frame.origin.x, BTN_Seduction.frame.origin.y-50, BTN_Seduction.frame.size.width, BTN_Seduction.frame.size.height);
//            } completion:^(BOOL finished) {
//            }];
//
//         
//            
//        }
//        else if ([[pref objectForKey:@"pref_str_cat_id"] isEqualToString:@"3"])
//        {
//            [self.view bringSubviewToFront:BTN_Sex];
//            [UIView animateWithDuration:1 animations:^ {
//              BTN_Sex.frame=CGRectMake(BTN_Sex.frame.origin.x, BTN_Sex.frame.origin.y+50, BTN_Sex.frame.size.width, BTN_Sex.frame.size.height);
//            } completion:^(BOOL finished) {
//            }];
//            [UIView animateWithDuration:2 animations:^ {
//                BTN_Sex.frame=CGRectMake(BTN_Sex.frame.origin.x, BTN_Sex.frame.origin.y-50, BTN_Sex.frame.size.width, BTN_Sex.frame.size.height);
//            } completion:^(BOOL finished) {
//            }];
//           
//            
//        }
//        else if ([[pref objectForKey:@"pref_str_cat_id"] isEqualToString:@"4"])
//        {
//            [self.view bringSubviewToFront:BTN_Wadroble];
//            [UIView animateWithDuration:1 animations:^ {
//                 BTN_Wadroble.frame=CGRectMake(BTN_Wadroble.frame.origin.x, BTN_Wadroble.frame.origin.y+50, BTN_Wadroble.frame.size.width, BTN_Wadroble.frame.size.height);
//            } completion:^(BOOL finished) {
//            }];
//           
//            [UIView animateWithDuration:2 animations:^ {
//                BTN_Wadroble.frame=CGRectMake(BTN_Wadroble.frame.origin.x, BTN_Wadroble.frame.origin.y-50, BTN_Wadroble.frame.size.width, BTN_Wadroble.frame.size.height);
//            } completion:^(BOOL finished) {
//            }];
//            
//        }
//        else if ([[pref objectForKey:@"pref_str_cat_id"] isEqualToString:@"5"])
//        {
//            [self.view bringSubviewToFront:BTN_Parties];
//            [UIView animateWithDuration:1 animations:^ {
//                 BTN_Parties.frame=CGRectMake(BTN_Parties.frame.origin.x, BTN_Parties.frame.origin.y+50, BTN_Parties.frame.size.width, BTN_Parties.frame.size.height);
//            } completion:^(BOOL finished) {
//            }];
//            
//            [UIView animateWithDuration:2 animations:^ {
//                BTN_Parties.frame=CGRectMake(BTN_Parties.frame.origin.x, BTN_Parties.frame.origin.y-50, BTN_Parties.frame.size.width, BTN_Parties.frame.size.height);
//            } completion:^(BOOL finished) {
//            }];
//           
//            
//        }
//        else if ([[pref objectForKey:@"pref_str_cat_id"] isEqualToString:@"6"])
//        {
//            [self.view bringSubviewToFront:BTN_Relation];
//            [UIView animateWithDuration:1 animations:^ {
//                  BTN_Relation.frame=CGRectMake(BTN_Relation.frame.origin.x, BTN_Relation.frame.origin.y+50, BTN_Relation.frame.size.width, BTN_Relation.frame.size.height);            } completion:^(BOOL finished) {
//            }];
//            
//            [UIView animateWithDuration:2 animations:^ {
//                BTN_Relation.frame=CGRectMake(BTN_Relation.frame.origin.x, BTN_Relation.frame.origin.y-50, BTN_Relation.frame.size.width, BTN_Relation.frame.size.height);            } completion:^(BOOL finished) {
//                }];
//        
//            
//        }
//        else if ([[pref objectForKey:@"pref_str_cat_id"] isEqualToString:@"7"])
//        {
//            [self.view bringSubviewToFront:BTN_Food];
//            [UIView animateWithDuration:1 animations:^ {
//                BTN_Food.frame=CGRectMake(BTN_Food.frame.origin.x, BTN_Food.frame.origin.y+50, BTN_Food.frame.size.width, BTN_Food.frame.size.height);
//            } completion:^(BOOL finished) {
//            }];
//            
//            [UIView animateWithDuration:2 animations:^ {
//                BTN_Food.frame=CGRectMake(BTN_Food.frame.origin.x, BTN_Food.frame.origin.y-50, BTN_Food.frame.size.width, BTN_Food.frame.size.height);
//            } completion:^(BOOL finished) {
//            }];
//
//           
//            
//        }
//        else if ([[pref objectForKey:@"pref_str_cat_id"] isEqualToString:@"8"])
//        {
//            [self.view bringSubviewToFront:BTN_drugs];
//            [UIView animateWithDuration:1 animations:^ {
//                BTN_drugs.frame=CGRectMake(BTN_drugs.frame.origin.x, BTN_drugs.frame.origin.y+50, BTN_drugs.frame.size.width, BTN_drugs.frame.size.height);
//            } completion:^(BOOL finished) {
//            }];
//            
//            [UIView animateWithDuration:2 animations:^ {
//                BTN_drugs.frame=CGRectMake(BTN_drugs.frame.origin.x, BTN_drugs.frame.origin.y-50, BTN_drugs.frame.size.width, BTN_drugs.frame.size.height);
//            } completion:^(BOOL finished) {
//            }];
//           
//            
//        }
//        else if ([[pref objectForKey:@"pref_str_cat_id"] isEqualToString:@"9"])
//        {
//            [self.view bringSubviewToFront:BTN_Pot];
//            [UIView animateWithDuration:1 animations:^ {
//                BTN_Pot.frame=CGRectMake(BTN_Pot.frame.origin.x, BTN_Pot.frame.origin.y+50, BTN_Pot.frame.size.width, BTN_Pot.frame.size.height);
//
//            } completion:^(BOOL finished) {
//            }];
//            [UIView animateWithDuration:2 animations:^ {
//                BTN_Pot.frame=CGRectMake(BTN_Pot.frame.origin.x, BTN_Pot.frame.origin.y-50, BTN_Pot.frame.size.width, BTN_Pot.frame.size.height);
//                
//            } completion:^(BOOL finished) {
//            }];
//            
//        }
//    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(BOOL)CheckNetwork
{
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.google.com"];
    NetworkStatus NetworkStatus = [reachability currentReachabilityStatus];
    return NetworkStatus;
}

-(void)getAlltype
{
    
    [MBProgressHUD showHUDAddedTo:self.view animated:NO];
    
        if ([self CheckNetwork] == NotReachable)
        {
            [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
            NSLog(@"Not Reachable");
    
    
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Info!" message:@"No internet connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
        }
        else
        {
    NSLog(@"Reachable");
    
    NSString *str123=[NSString stringWithFormat:@"http://danielrusso.xyz/APP/get_all_categories.php?user_id=%@",[pref valueForKey:@"pref_User_Id"]];
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:str123]];
    
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"content-type"];
    NSError *error;
    NSURLResponse *response;
    NSData *responseData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSDictionary *jsonDist=[NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
    
    NSLog(@"jsonDist = %@",jsonDist);
    
    Arr_skill_name=[jsonDist objectForKey:@"all_category"];
    
    
   int myvar=0;
    for (int i = 0; i<Arr_skill_name.count; i++)
    {
        NSLog(@"i value---%d",i);
        
        
        NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"Home1155" owner:self options:nil];
        
        UIView *mainView = [subviewArray objectAtIndex:0];
        
        home.frame=CGRectMake(0, myvar, 320, 54);
       
        
        [scroll_view1 addSubview:mainView];
        
       // lbl_work.text=[NSString stringWithFormat:@"%@ Work",[[Arr_skill_name objectAtIndex:i]valueForKey:@"work"]];
     //  lbl_prog.text=[NSString stringWithFormat:@"%@ %@",[[Arr_skill_name objectAtIndex:i]valueForKey:@"skill"],[[Arr_skill_name objectAtIndex:i]valueForKey:@"name"]];
       
       lbl_skill.text=[[Arr_skill_name objectAtIndex:i]valueForKey:@"cat_name"];
         btn_next.tag=100+i;
         [btn_next addTarget:self action:@selector(next_function:) forControlEvents:UIControlEventTouchUpInside];
        myvar = myvar + 56;
    }
    scroll_view1.contentSize = CGSizeMake(320, myvar);
    }
 [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
   // Arr_image_skill=[[jsonDist objectForKey:@"data"]valueForKey:@"skill_image"];
    
   // [self getAllSize];
    
    // }
}

- (IBAction)next_function:(UIButton *)sender
{
    FlagFirst=2;
    NSLog(@"details_tag==%ld",(long)sender.tag);
    pref=[NSUserDefaults standardUserDefaults];
    
    if (sender.tag==1)
    {
        str_skills_name=@"New Students";
        str_skil_id=@"1";
        [pref setObject:@"New Students" forKey:@"pref_str_cat_name"];
        [pref setObject:@"1" forKey:@"pref_str_cat_id"];
        
    }
    else if (sender.tag==2)
    {
        str_skills_name=@"Seduction";
        str_skil_id=@"2";
        [pref setObject:@"Seduction" forKey:@"pref_str_cat_name"];
        [pref setObject:@"2" forKey:@"pref_str_cat_id"];
    }
    else if (sender.tag==3)
    {
        str_skills_name=@"Sex";
        str_skil_id=@"3";
        [pref setObject:@"Sex" forKey:@"pref_str_cat_name"];
        [pref setObject:@"3" forKey:@"pref_str_cat_id"];
        
    }
    else if (sender.tag==4)
    {
        str_skills_name=@"Lifestyle";
        str_skil_id=@"4";
        [pref setObject:@"Lifestyle" forKey:@"pref_str_cat_name"];
        [pref setObject:@"4" forKey:@"pref_str_cat_id"];
    }
    else if (sender.tag==5)
    {
        str_skills_name=@"Philosophy";
        str_skil_id=@"5";
        [pref setObject:@"Philosophy" forKey:@"pref_str_cat_name"];
        [pref setObject:@"5" forKey:@"pref_str_cat_id"];
    }
    else if (sender.tag==6)
    {
        str_skills_name=@"Relationships";
        str_skil_id=@"6";
        [pref setObject:@"Relationships" forKey:@"pref_str_cat_name"];
        [pref setObject:@"6" forKey:@"pref_str_cat_id"];
    }
    else if (sender.tag==7)
    {
        str_skills_name=@"Journey to Yourself";
        str_skil_id=@"7";
        [pref setObject:@"Journey to Yourself" forKey:@"pref_str_cat_name"];
        [pref setObject:@"7" forKey:@"pref_str_cat_id"];
    }
    else if (sender.tag==8)
    {
        str_skills_name=@"Quotes & Life Lessons";
        str_skil_id=@"8";
        [pref setObject:@"Quotes & Life Lessons" forKey:@"pref_str_cat_name"];
        [pref setObject:@"8" forKey:@"pref_str_cat_id"];
    }
    else if (sender.tag==9)
    {
        str_skills_name=@"Potpourri";
        str_skil_id=@"9";
        [pref setObject:@"Potpourri" forKey:@"pref_str_cat_name"];
        [pref setObject:@"9" forKey:@"pref_str_cat_id"];
        
    }
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:NO];
    [self performSelector:@selector(next_function) withObject:self afterDelay:0.1];
    
}
-(void)next_function
{
    [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
    Sub_Category_ViewController *show=[[Sub_Category_ViewController alloc]initWithNibName:@"Sub_Category_ViewController" bundle:nil];
    show.str_cat_id=str_skil_id;
  show.str_cat_name=str_skills_name;
    
    [self.navigationController pushViewController:show animated:NO];
}
-(IBAction)Star_Action:(id)sender
{
    if ([[pref valueForKey:@"pref_user_type"]isEqualToString:@"user"])
    {
        MY_AllChat2_ViewController *show=[[MY_AllChat2_ViewController alloc]initWithNibName:@"MY_AllChat2_ViewController" bundle:nil];
        // show.str_cat_id=str_skil_id;
       show.str_Showreview=@"yes";
       
        [self.navigationController pushViewController:show animated:NO];
    }
    else
    {
    MY_AllChat_Start_ViewController *show=[[MY_AllChat_Start_ViewController alloc]initWithNibName:@"MY_AllChat_Start_ViewController" bundle:nil];
   // show.str_cat_id=str_skil_id;
 //  show.str_Showreview=@"yes";
    
    [self.navigationController pushViewController:show animated:NO];
    }
}
//-(IBAction)update_Action:(id)sender
//{
  
//    Update_SignupVC *show=[[Update_SignupVC alloc]initWithNibName:@"Update_SignupVC" bundle:nil];
    // show.str_cat_id=str_skil_id;
    //  show.str_Showreview=@"yes";
    
//    [self.navigationController pushViewController:show animated:NO];
//}
@end
