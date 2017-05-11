//
//  ShowroomCategoriesViewController.h
//  FreelancerPro
//
//  Created by Mac on 9/6/16.
//  Copyright (c) 2016 YoungDecade. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
@interface CategoriesViewController : UIViewController
{
    NSUserDefaults *pref;
    NSMutableArray *Arr_skill_name,*Arr_image_skill,*Arr_works,*Arr_program;
    NSString *str_skil_id,*str_skills_name;
    int FlagFirst;
    NSString *str_skill_id;
    NSString *str_skill_name;
}
@property (nonatomic ,retain)IBOutlet UIView *home;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll_view1;
@property (nonatomic ,retain)IBOutlet UILabel *lbl_skill,*lbl_prog,*lbl_work;
@property (nonatomic ,retain)IBOutlet UIImageView *img_view;
@property (nonatomic ,retain)IBOutlet UIButton *btn_next;
@property (nonatomic, retain) AVAudioPlayer *myAudioPlayer;
@property (strong, nonatomic) IBOutlet UILabel *lbl_color,*lbl_blank;

@property (nonatomic ,retain)IBOutlet UIButton *BTN_NewStu,*BTN_Seduction,*BTN_Sex,*BTN_Wadroble,*BTN_Parties,*BTN_Relation,*BTN_Food,*BTN_drugs,*BTN_Pot;
@property (strong, nonatomic) NSString*Str_Push;
@end
