//
//  EditProfileViewController.m
//  UserSetting
//
//  Created by mac on 2/16/16.
//  Copyright (c) 2016 youngdecade. All rights reserved.
//

#import "EditProfileViewController.h"
//#import "UserSettingVC.h"

#import "Reachability.h"
#import "MBProgressHUD.h"

@interface EditProfileViewController ()<UIGestureRecognizerDelegate>
@property (nonatomic) CGFloat circleRadius;
@property (nonatomic) CGPoint circleCenter;

@property (nonatomic, weak) CAShapeLayer *maskLayer;
@property (nonatomic, weak) CAShapeLayer *circleLayer;

@property (nonatomic, weak) UIPinchGestureRecognizer *pinch;
@property (nonatomic, weak) UIPanGestureRecognizer   *pan;
@end

@implementation EditProfileViewController
{
    NSString *path;
}
@synthesize btn_glob,scrollView, btn_DONE,img_TEMP,imgData;


-(void)ConnectionNotEstablish
{
    [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
}
- (void)viewDidLoad
{
    
    [super viewDidLoad];
    scrollView.hidden = true;
    
    flag_glob=0;
    btn_DONE.hidden = true;
    pref = [NSUserDefaults standardUserDefaults];
    [self.btn_glob setBackgroundImage:[UIImage imageNamed: @"globe_blue.png"] forState:UIControlStateNormal];
    [img_TEMP setImage:[UIImage imageWithData:imgData]];
    
    //------------------
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    
    self.img_profile.layer.mask = maskLayer;
    self.maskLayer = maskLayer;
    
    // create shape layer for circle we'll draw on top of image (the boundary of the circle)
    
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    circleLayer.lineWidth = 2.0;
    circleLayer.fillColor = [[UIColor clearColor] CGColor];
    circleLayer.strokeColor = [[UIColor blackColor] CGColor];
    [self.img_profile.layer addSublayer:circleLayer];
    self.circleLayer = circleLayer;
    
    // create circle path
    
    [self updateCirclePathAtLocation:CGPointMake(self.view.bounds.size.width / 2.0, 150.0) radius:self.view.bounds.size.width * 0.30];
    
    // create pan gesture
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    pan.delegate = self;
    [self.img_profile addGestureRecognizer:pan];
    self.img_profile.userInteractionEnabled = YES;
    self.pan = pan;
    
    // create pan gesture
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    pinch.delegate = self;
    [self.view addGestureRecognizer:pinch];
    self.pinch = pinch;
    //-------------------
    self.scrollView.contentSize = self.img_profile.image.size;
    self.img_profile.frame = CGRectMake(0, 0, scrollView.frame.size.width, scrollView.frame.size.height);//self.img_profile.image.size.width, self.img_profile.image.size.height
    
    self.scrollView.delegate = self;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Import image from...?" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Camera",@"Gellary", nil];
    [alert show];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}-(UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    // return which subview we want to zoom
    return self.img_profile;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex ==0)
    {
        
    }
    else if (buttonIndex==1)
    {
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                  message:@"Device has no camera"
                                                                 delegate:nil
                                                        cancelButtonTitle:@"OK"
                                                        otherButtonTitles: nil];
            
            [myAlertView show];
            
        }
        else
        {
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            picker.allowsEditing = YES;
            
            
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            
            [self presentViewController:picker animated:YES completion:NULL];
        }
    }
    else if (buttonIndex ==2)
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        
        
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self presentViewController:picker animated:YES completion:NULL];
    }
}
-(IBAction)uploadPhoto_action:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Import image from...?" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Camera",@"Gellary", nil];
    [alert show];

}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    btn_DONE.hidden = false;
    scrollView.hidden = false;
    img_TEMP.hidden = true;
    //UIImagePickerControllerEditedImage
    //UIImagePickerControllerOriginalImage
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    
    self.img_profile.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
}
//-(IBAction)gotoNext
//{
//    UserSettingVC *vc = [[UserSettingVC alloc] initWithNibName:@"UserSettingVC" bundle:nil];
//    [self.navigationController pushViewController:vc animated:NO];
//    
//}

-(IBAction)done_action:(id)sender
{
    NSString *documentsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    path = [documentsPath stringByAppendingPathComponent:@"image.png"];
    
    CGFloat scale  = [[self.img_profile.window screen] scale];
    CGFloat radius = 0.0;//self.circleRadius * scale;
    CGPoint center = CGPointMake(self.circleCenter.x * scale, self.circleCenter.y * scale);
    
    CGRect frame = CGRectMake(center.x - radius,
                              center.y - radius,
                              radius * 2.0,
                              radius * 2.0);
    
    // temporarily remove the circleLayer
    
    CALayer *circleLayer = self.circleLayer;
    [self.circleLayer removeFromSuperlayer];
    
    // render the clipped image
    
    UIGraphicsBeginImageContextWithOptions(self.img_profile.frame.size, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    if ([self.img_profile respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)])
    {
        // if iOS 7, just draw it
        
        [self.img_profile drawViewHierarchyInRect:self.img_profile.bounds afterScreenUpdates:YES];
    }
    else
    {
        // if pre iOS 7, manually clip it
        
        CGContextAddArc(context, self.circleCenter.x, self.circleCenter.y, self.circleRadius, 0, M_PI * 2.0, YES);
        CGContextClip(context);
        [self.img_profile.layer renderInContext:context];
    }
    
    // capture the image and close the context
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // add the circleLayer back
    
    [self.img_profile.layer addSublayer:circleLayer];
    
    // crop the image
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], frame);
    UIImage *croppedImage = [UIImage imageWithCGImage:imageRef];
    
    // save the image
    
    NSData *data = UIImagePNGRepresentation(croppedImage);
    
    [data writeToFile:path atomically:YES];
    
    // tell the user we're done
    
   

   

    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    /* updateprofilepic .php
     user_id     image     image_v*/
    NSString *str_ImageVisibility;
    if (flag_glob==1) { str_ImageVisibility = @"friend";    }
    else if (flag_glob==2) { str_ImageVisibility = @"private";    }
    else if (flag_glob==0) { str_ImageVisibility = @"public";    }
    
        
//    Ary_Image = [[NSMutableArray alloc]init];
//    [Ary_Image addObject:croppedImage];
//    
//    Ary_Parameter =[[NSMutableArray alloc]initWithObjects:@"user_id",@"image_v",nil];
//    
//    Ary_Value =[[NSMutableArray alloc]initWithObjects:[pref objectForKey:@"pref_myUSERid"],str_ImageVisibility,nil];
//
//        
//    NSLog(@"Array parameters : %@",Ary_Parameter);
//    NSLog(@"Array values : %@",Ary_Value);
//    
//        
//    if ([self CheckNetwork] == NotReachable)
//    {
//        NSLog(@"Not Reachable");
//        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
//            
//        UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Info" message:@"No internet connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//            [alert1 show];
//    }
//    else
//    {
//        PostFunctionHelper *post=[[PostFunctionHelper alloc]init];
//        post.delegate=self;
//        post.str_photo = @"1";
//        [post RequestWithURL:@"updateprofilepic.php" :Ary_Parameter :Ary_Value : Ary_Image] ;
//    }


    
}
-(BOOL)CheckNetwork
{
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.google.com"];
    NetworkStatus NetworkStatus = [reachability currentReachabilityStatus];
    return NetworkStatus;
}

//-(void)DidRecieveResponse:(NSDictionary *)Dictionary{
//    
//    NSLog(@"Updateprofilepic Dictionary - %@",Dictionary);
//    
//    if ([[Dictionary valueForKey:@"success"] isEqualToString:@"true"])
//    {
//        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
////        
////        UserSettingVC *vc = [[UserSettingVC alloc] initWithNibName:@"UserSettingVC" bundle:nil];
////        //vc.tempDATA = data;
////        
////        [self.navigationController pushViewController:vc animated:NO];
//    }
//    else{
//        
//        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
//        
//        //        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Info" message:[Dictionary valueForKey:@"msg"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//        //        [alert show];
//    }
//}
//


//--------
- (void)updateCirclePathAtLocation:(CGPoint)location radius:(CGFloat)radius
{
    self.circleCenter = location;
    self.circleRadius = radius;
    
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 addArcWithCenter:self.circleCenter
                    radius:self.circleRadius
                startAngle:0.0
                  endAngle:M_PI * 5.0
                 clockwise:YES];
    
    self.maskLayer.path = [path1 CGPath];
    self.circleLayer.path = [path1 CGPath];
}

- (void)handlePan:(UIPanGestureRecognizer *)gesture
{
    static CGPoint oldCenter;
    CGPoint tranlation = [gesture translationInView:gesture.view];
    
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        oldCenter = self.circleCenter;
    }
    
    CGPoint newCenter = CGPointMake(oldCenter.x + tranlation.x, oldCenter.y + tranlation.y);
    
    [self updateCirclePathAtLocation:newCenter radius:self.circleRadius];
}

- (void)handlePinch:(UIPinchGestureRecognizer *)gesture
{
    static CGFloat oldRadius;
    CGFloat scale = [gesture scale];
    
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        oldRadius = self.circleRadius;
    }
    
    CGFloat newRadius = oldRadius * scale;
    
    [self updateCirclePathAtLocation:self.circleCenter radius:newRadius];
}


#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if ((gestureRecognizer == self.pan   && otherGestureRecognizer == self.pinch) ||
        (gestureRecognizer == self.pinch && otherGestureRecognizer == self.pan))
    {
        return YES;
    }
    
    return NO;
}


-(IBAction)BacktoPreviousPage
{
    [self.navigationController popViewControllerAnimated:NO];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
