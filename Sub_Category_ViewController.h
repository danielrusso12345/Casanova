//
//  stock_holmViewController.h
//  Faith
//
//  Created by mac on 10/29/15.
//  Copyright (c) 2015 YoungDecade. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSONRequestHelper.h"
@interface Sub_Category_ViewController : UIViewController<WebserviceDelegate,UIAlertViewDelegate>
{
    NSUserDefaults *prefrence;
    UIAlertView *alert;
    JSONRequestHelper *jsr1;
    NSMutableArray *arrdata;
    NSString *str_friend_id,*str_user_id,*str_order_id,*str_Details_id;
    int flag,temp;
}

@property (strong, nonatomic) IBOutlet UILabel *lbl_address;
@property (strong, nonatomic) IBOutlet UIView *stock_hold,*my_alert_view;
@property (strong, nonatomic) IBOutlet UIScrollView *scr_view;


@property (strong, nonatomic) IBOutlet UIButton *btn_detail,*btn_ok,*btn_Msg;

@property (strong, nonatomic) IBOutlet UIButton *btn_cancel,*btn_cancel1,*btn_newpost,*btn_dedit;

@property (strong, nonatomic) IBOutlet UIImageView *img_profile;
@property (strong, nonatomic) IBOutlet UITextView *tv_description;
@property (weak, nonatomic) IBOutlet UILabel *lbl_category;

@property (strong, nonatomic) IBOutlet UILabel *lbl_time;


@property (strong, nonatomic) IBOutlet UILabel *lbl_PRICE;
@property (strong, nonatomic) IBOutlet UILabel *lbl_message;
@property (strong, nonatomic) IBOutlet UILabel *lbl_name;
@property (weak, nonatomic) IBOutlet UILabel *lbl_sub_category;

@property (weak, nonatomic) IBOutlet NSString * str_page_flag,*str_cat_id,*str_cat_name;

@property (strong, nonatomic) IBOutlet UILabel *lbl_color,*lbl_blank;

@end
