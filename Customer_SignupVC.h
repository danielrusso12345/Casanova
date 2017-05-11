//
//  SignupVC.h
//  Dalal
//
//  Created by mac on 4/6/16.
//  Copyright © 2016 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostFunctionHelper.h"
#import "PhotoTweaksViewController.h"
//#import "JSONRequestHelper.h"
@interface Customer_SignupVC : UIViewController<PostFunctionDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate,UINavigationControllerDelegate,UIPickerViewDataSource,UIPickerViewDelegate,PhotoTweaksViewControllerDelegate>
{
     PostFunctionHelper *post;
     NSMutableArray *Ary_Parameter,*Ary_Value,*Ary_Image;
    // JSONRequestHelper *jsr;
     NSMutableArray *Ary_ParameterGet,*Ary_ValueGet,*Ary_ImageGet,*Arr_provinace,*Arr_provinace_id,*Arr_city,*Arr_city_id,*Arr_lat,*Arr_log;
     NSUserDefaults *PREF;
     UITapGestureRecognizer *singleTap1;
     UIToolbar * pickerToolbar;
    NSUserDefaults *pref;
    long senderTag;
    UIPickerView *picker1;
    NSString *str_All,*str_picker,*str_CatId,*str_delivery_price,*str_city_id,*str_provinace_id,*str_StripeToken;
    UIView *view1;
    UIToolbar *keyboardToolbar;
    NSMutableArray *arr_Type,*arr_picker,*arr_category,*arr_Id;
    int flag;
    UIImagePickerController *ipc;
    UIPopoverController *popover;
    UIImageView *img;
}
@property (weak, nonatomic) IBOutlet UIImageView *img_profile;
@property (weak, nonatomic) IBOutlet UITextField *txt_name;
@property (weak, nonatomic) IBOutlet UITextField *txt_password,*txt_confirm_password;
@property (weak, nonatomic) IBOutlet UITextField *txt_email,*TF_country,*TF_city;
@property (weak, nonatomic) IBOutlet UITextField *txt_phone;
@property (weak, nonatomic) IBOutlet UIButton *btn_remember,*btn_sign_up;
@property (strong, nonatomic) IBOutlet UILabel *lbl_bg,*lbl_blank;
@property (weak, nonatomic) IBOutlet UIButton *signup;
@property (weak, nonatomic) IBOutlet UIImageView *img_view;
@end
