//
//  EditProfileViewController.h
//  UserSetting
//
//  Created by mac on 2/16/16.
//  Copyright (c) 2016 youngdecade. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostFunctionHelper.h"

@interface EditProfileViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate,UIScrollViewDelegate,UIAlertViewDelegate,PostFunctionDelegate>
{
    int flag_glob;
    NSUserDefaults *pref;
    NSMutableArray *Ary_Parameter, *Ary_Value, *Ary_Image;
}
@property (nonatomic,strong)IBOutlet UIImageView *img_profile, *img_TEMP;
@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
-(IBAction)uploadPhoto_action:(id)sender;
@property(nonatomic,strong) IBOutlet UIButton *btn_glob, *btn_DONE;
@property(weak,nonatomic) NSData *imgData;

@end
