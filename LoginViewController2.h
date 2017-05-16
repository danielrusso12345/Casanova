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

@interface LoginViewController2 : UIViewController<PostFunctionDelegate,UITextFieldDelegate> {
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




@end
