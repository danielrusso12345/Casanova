//
//  termsAndConditionsViewController.m
//  TennisWalesLeaders
//
//  Created by mac on 11/2/15.
//  Copyright (c) 2015 youngdecade. All rights reserved.
//

#import "termsAndConditionsViewController.h"
//#import "DEMONavigationController.h"

@interface termsAndConditionsViewController ()

@end

@implementation termsAndConditionsViewController
@synthesize str_terms,lbl_back;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    
    lbl_back.layer.masksToBounds = true;
    lbl_back.layer.cornerRadius =lbl_back.frame.size.width/2;// 12.0;
    lbl_back.layer.borderColor = [UIColor grayColor].CGColor;
    lbl_back.layer.borderWidth = 1.0;
    //self.title = @"Terms And Conditions";
    
//    if([str_terms isEqualToString:@"1"])
//    {
//        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
//                                                      initWithImage:[UIImage imageNamed:@"back.png"] style:UIBarButtonItemStylePlain target:self action:@selector(Back_Button:)];
//    }
//    else
//    {
//        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
//                                                 initWithImage:[UIImage imageNamed:@"menu55.png"] style:UIBarButtonItemStylePlain target:(DEMONavigationController *)self.navigationController action:@selector(showMenu)];
//    }
    
   
    
    //////////-----------swipe Gesture-----------------////////////
//    
//    
//    UISwipeGestureRecognizer *gestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandler:)];
//    [gestureRecognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
//    
//    [self.view addGestureRecognizer:gestureRecognizer];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)swipeHandler:(UISwipeGestureRecognizer *)recognizer {
//    NSLog(@"Swipe received.");
//    
//    [self.navigationController popViewControllerAnimated:YES];
//}

- (IBAction)Back_Button:(id)sender
{
    [self.navigationController popViewControllerAnimated:NO];
}


@end
