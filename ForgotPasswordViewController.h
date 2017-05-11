//
//  ForgotPasswordViewController.h
//  TennisWalesLeaders
//
//  Created by mac on 10/30/15.
//  Copyright (c) 2015 youngdecade. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSONRequestHelper.h"
//#import "BLMultiColorLoader.h"
//#import "HHAlertView.h"

@interface ForgotPasswordViewController : UIViewController<WebserviceDelegate,UITextFieldDelegate>
{
     JSONRequestHelper *jsr1;
}
//@property (weak, nonatomic) IBOutlet BLMultiColorLoader *multiColorLoader;

@property (weak, nonatomic) IBOutlet UITextField *txt_email;
- (IBAction)Submit_Button:(id)sender;
- (IBAction)Back_Button:(id)sender;

@property(weak,nonatomic)IBOutlet UILabel *lbl_bg,*lbl_back;
@property(strong,nonatomic)IBOutlet UIButton *btn_submit;
@end
