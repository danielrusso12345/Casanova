//
//  After_sign_in _provider_ViewController.h
//  Yubna
//
//  Created by Mac on 4/6/16.
//  Copyright (c) 2016 Young Decade. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostFunctionHelper.h"
#import "PhotoTweaksViewController.h"
@interface Edit_Create_Post_ViewController1: UIViewController<PostFunctionDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate,UINavigationControllerDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UITextViewDelegate,PhotoTweaksViewControllerDelegate>
{
    PostFunctionHelper *post;
    NSMutableArray *Ary_Parameter,*Ary_Value,*Ary_Image,*Ary_Video;
    NSUserDefaults *pref;
    
    UIImageView *img;
    int flag_checkBox;
    UIImagePickerController *ipc;
    UIPopoverController *popover;
    NSString *currentTime,*currentTime1,*dateforchecktime;
    int flag;
    
    NSMutableArray *arr_cat_name,*arr_picker,*arr_cat_id,*arr_url,*arr_subcat_name,*arr_subcat_id,*arr_time_data,*arr_duration_time;
    long senderTag;
    
    UIPickerView *picker1;
    UIToolbar *pickerToolbar;
    NSString *str_All,*str_picker,*str_Country_Id,*str_city_id,*str_category_id,*str_TempDATE,*str_jewelry,*str_url,*str_Subcategory_id,*str_Staff_name,*str_duration_time,*str_time_due;
    UIView *view1;
    
    UIDatePicker *datePicker;
    UIToolbar *keyboardToolbar1;
    int web_flag;
    UIView *view2;
}

@property(nonatomic,strong)IBOutlet UITextField *TF_price,*TF_category,*TF_sub_category;
@property(nonatomic,strong)IBOutlet UITextView *TV_terms;
@property(nonatomic,strong)IBOutlet NSString *str_project_id,*Str_flag_update,*str_update_cat_id,*str_service_id,*str_update_cat_name,*str_update_image,*str_start_price,*str_dec,*str_staff,*str_sub_cate,*Str_sub_category_name,*str_end_price,*str_dure;
@property(nonatomic,strong)IBOutlet UILabel *lbl_bg11;
@property(nonatomic,strong)IBOutlet UIImageView *img_view,*img11;

@property(nonatomic,strong)IBOutlet UITextField *Start_time1,*Start_time2,*Start_time3,*Start_time4;

@property(nonatomic,strong)IBOutlet UITextField *End_time1,*End_time2,*End_time3,*End_time4;
@property(nonatomic,strong)IBOutlet UIButton *btn_back,*btn_add,*btn_update,*btn_attach,*btn_next;
@property (weak, nonatomic) IBOutlet UILabel *lbl_heading;
@property (strong, nonatomic) IBOutlet UILabel *lbl_color,*lbl_blank;
@property (strong, nonatomic) IBOutlet UIImage *img_edit;
@end
