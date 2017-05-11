//
//  HomeViewController.h
//  TennisWalesLeaders
//
//  Created by mac on 10/30/15.
//  Copyright (c) 2015 youngdecade. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "BLMultiColorLoader.h"
#import "JSONRequestHelper.h"

//#import "HHAlertView.h"

@interface MY_AllChat_Start_ViewController : UIViewController<WebserviceDelegate,UITextViewDelegate>
{
    NSUserDefaults *pref;
    JSONRequestHelper *jsr;
    int flag,myvar,xyz;
    NSString *like_Tag,*str_user_id1;
    long ak;
    NSMutableArray *Arr_data;
    NSURL *url_share;
   // UIImageView *img;
    UITextView *txtView1;
      NSString *str;
     NSTimer * timer;
}

@property (weak, nonatomic) IBOutlet UIScrollView *scroll_view1;

@property (nonatomic ,retain)IBOutlet UIView *home;
@property (nonatomic ,retain)IBOutlet UITextView *tv_message;

@property (nonatomic ,retain)IBOutlet UILabel *Lbl_Name,*lbl_date,*lbl_time,*lbl_message,*lbl_category,*LBL_MSG;

@property (strong,nonatomic)NSMutableArray *arr_showReview;

//@property (weak, nonatomic) IBOutlet BLMultiColorLoader *multiColorLoader;

@property (strong,nonatomic)NSString *str_Showreview;

//- (IBAction)Activity_ShareOnFB:(UIButton*)sender;

@property (strong, nonatomic) IBOutlet UIImageView *img1,*img_category;
@property(strong,nonatomic)IBOutlet UIButton *Btn_details;
@property (strong, nonatomic) IBOutlet UILabel *lbl_color,*lbl_blank;

@end
