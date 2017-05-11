//
//  stock_holmViewController.h
//  Faith
//
//  Created by mac on 10/29/15.
//  Copyright (c) 2015 YoungDecade. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSONRequestHelper.h"
@interface Responds_ViewController : UIViewController<WebserviceDelegate,UIAlertViewDelegate>
{
    NSUserDefaults *prefrence;
    UIAlertView *alert;
    JSONRequestHelper *jsr1;
    NSMutableArray *arrdata;
    NSString *str_friend_id,*str_user_id,*str_order_id,*str_Details_id,*str_status,*str_time,*str_date;
    int flag,temp;
      NSTimer * timer;
}

@property (strong, nonatomic) IBOutlet UILabel *lbl_address;
@property (strong, nonatomic) IBOutlet UIView *stock_hold,*my_alert_view,*my_btn_view;
@property (strong, nonatomic) IBOutlet UIScrollView *scr_view;


@property (strong, nonatomic) IBOutlet UIButton *btn_detail,*btn_ok;

@property (strong, nonatomic) IBOutlet UIButton *btn_cancel,*btn_cancel1;


@property (weak, nonatomic) IBOutlet UILabel *lbl_time;

@property (strong, nonatomic) IBOutlet UILabel *lbl_category;
@property (strong, nonatomic) IBOutlet UILabel *TV_terms;

@property (strong, nonatomic) IBOutlet UILabel *lbl_date;
@property (strong, nonatomic) IBOutlet UILabel *lbl_message;
@property (strong, nonatomic) IBOutlet UILabel *lbl_name;
@property (weak, nonatomic) IBOutlet UILabel *lbl_sub_category,*lbl_phone,*lbl_appointment;

@property (weak, nonatomic) IBOutlet NSString * str_page_flag,*str_cat_id,*str_user_id2,*str_category_id,*Str_flag_update_message,*str_message_id;


@property (strong, nonatomic) IBOutlet UILabel *lbl_color,*lbl_blank;
@end
