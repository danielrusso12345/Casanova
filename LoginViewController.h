//
//  LoginViewController.h
//  TennisWalesLeaders
//
//  Created by mac on 10/30/15.
//  Copyright (c) 2015 youngdecade. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostFunctionHelper.h"
#import "JSONRequestHelper.h"
//#import "BLMultiColorLoader.h"
//#import "HHAlertView.h"
//#import <GooglePlus/GooglePlus.h>
//#import <GoogleOpenSource/GoogleOpenSource.h>
//#import <FacebookSDK/FacebookSDK.h>


@interface LoginViewController : UIViewController<PostFunctionDelegate>//<UIAlertViewDelegate,PostFunctionDelegate,WebserviceDelegate,GPPSignInDelegate,UITextFieldDelegate>
{
    PostFunctionHelper *post;
    NSMutableArray *Ary_Parameter,*Ary_Value,*Ary_Image;
    UIAlertView *alert;
    int flag_checkBox,flag;
     JSONRequestHelper *jsr1;
    NSUserDefaults *pref;
    NSString *str12,*str_loginflag,*str_fbEmail,*str_fbName,*str_fbimg;
    NSArray *arr;
    UIToolbar * pickerToolbar;
    UIPickerView *picker1;
    long senderTag;
   NSString *str_provinace_id,*str_city_id,*str_picker;
    //-----instagram------//
    NSMutableArray *array_data;
    NSMutableArray *arr_Instafriend_id, *arr_Instafriend_name, *arr_Instafriend_picURL;
     NSString *str_InstaName,*str_InstaImg,*str_StripeToken;
    
    NSMutableArray *arr_Type,*arr_picker,*arr_category,*arr_Id,*Arr_provinace_id,*Arr_city_id,*Arr_lat,*Arr_log,*Arr_city,*Arr_provinace;

}


@property (weak, nonatomic) IBOutlet UITextField *txt_Username,*txt_Username1;
@property (weak, nonatomic) IBOutlet UITextField *txt_password,*TF_country,*TF_city;;
@property (weak, nonatomic) IBOutlet UIButton *btn_loging,*btn_check;
@property(strong,nonatomic)UIActivityViewController *activityViewController;
//@property (weak,nonatomic) NSString *str_instagram,*str_InstaName,*str_InstaImg;
//@property (retain, nonatomic) IBOutlet GPPSignInButton *signInButton;
@property (weak, nonatomic) IBOutlet UIView *my_view;
- (IBAction)Forgot_Button:(id)sender;
- (IBAction)login_button:(id)sender;
- (IBAction)FaceBook:(id)sender;
//- (IBAction)FacebookLogin_Action:(id)sender;
//-(IBAction)instagram_Action:(id)sender;

@end
