//
//  HomeVC.h
//  myport
//
//  Created by mac on 6/6/16.
//  Copyright © 2016 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KIImagePager.h"
//#import "DotActivityIndicatorView.h"
#import "JSONRequestHelper.h"
@interface View_Attachments_VC : UIViewController<WebserviceDelegate,KIImagePagerDelegate,KIImagePagerDataSource,UIScrollViewDelegate>
{
    JSONRequestHelper *jsr;
    NSArray *arr_IMAGE;
    NSMutableArray *arr_IMG;
    
     UIPinchGestureRecognizer *twoFingerPinch;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrViewImage;
//@property (weak, nonatomic) IBOutlet KIImagePager *viewIMAGE;
@property (weak, nonatomic) IBOutlet UIScrollView *scrView;
@property (weak, nonatomic) IBOutlet UILabel *lbl_msg;
@property (strong, nonatomic) IBOutlet UILabel *lbl_title;

@property (weak, nonatomic) IBOutlet UIView *view_top;
@property (strong, nonatomic) IBOutlet UILabel *lbl_call_coast;
@property (strong, nonatomic) IBOutlet UILabel *lbl_call_port;
@property (strong, nonatomic) IBOutlet UIImageView *imgBanner;
@property (strong, nonatomic) IBOutlet UILabel *lbl_phone;

@property (strong, nonatomic) IBOutlet UILabel *lbl_address;
@property (weak, nonatomic) IBOutlet UILabel *lbl_services;
@property (weak, nonatomic) IBOutlet UIButton *btn_services;
@property (weak, nonatomic) IBOutlet UILabel *lbl_map_port;
@property (weak, nonatomic) IBOutlet UIButton *btn_map_port;
@property (weak, nonatomic) IBOutlet UILabel *lbl_weather;
@property (weak, nonatomic) IBOutlet UIButton *btn_weather;
@property (weak, nonatomic) IBOutlet UIButton *btn_call1;
@property (weak, nonatomic) IBOutlet UIButton *btn_call2;

@property (strong, nonatomic) NSString *str_lat,*str_long,*str_address,*str_phone;
@property (strong, nonatomic) NSMutableArray *arr_images,*arr_names;
@end
