//
//  HomeVC.m
//  myport
//
//  Created by mac on 6/6/16.
//  Copyright © 2016 mac. All rights reserved.
//

#import "View_Attachments_VC.h"

#import "Reachability.h"
#import "KIImagePager.h"
#import "EXPhotoViewer.h"
//#import "Direction_ViewController.h"
@interface View_Attachments_VC ()<UIGestureRecognizerDelegate>
{
    UISwipeGestureRecognizer *leftSwipe, *rightSwipe;
    int img_count;
    NSArray *img_array;
    NSTimer *timer;
    IBOutlet KIImagePager *_imagePager2;
}
@end

@implementation View_Attachments_VC
@synthesize imgBanner;
//@synthesize viewIMAGE;
@synthesize view_top,lbl_call_coast,lbl_call_port;
@synthesize lbl_address,lbl_phone,lbl_map_port,lbl_services,lbl_weather,btn_map_port,btn_services,btn_weather;
@synthesize scrView,lbl_msg,lbl_title,str_address,str_lat,str_long,str_phone,arr_images,arr_names;

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    
 
   // img_array=[[NSArray alloc]initWithObjects:@"1.png",@"2.png",@"3.png",@"4.png",@"5.png", nil];
    
    lbl_phone.text=str_phone;
    lbl_address.text=str_address;
    
   view_top.layer.borderColor=[[UIColor colorWithRed:86.0/255.0 green:127.0/255.0 blue:192.0/255.0 alpha:1.0]CGColor];
    
    
    
    
    view_top.layer.borderWidth=lbl_call_coast.layer.borderWidth=lbl_call_port.layer.borderWidth=1;
    
    imgBanner.image=[UIImage imageNamed:[img_array objectAtIndex:img_count]];
    arr_IMG=[[NSMutableArray alloc]init];
    
    NSString *str_msg;
    
    NSString *str_title;
    if (arr_images.count>0)
    {
        for (int i=0; i<arr_images.count; i++)
        {
           [arr_IMG addObject:[[arr_images objectAtIndex:i]valueForKey:@"attach_image"]];
        }
        arr_IMAGE =[NSArray arrayWithArray:arr_IMG];
        _imagePager2 = [[KIImagePager alloc]initWithFrame:CGRectMake(0, 0, _scrViewImage.frame.size.width, _scrViewImage.frame.size.height)];
        
                _imagePager2.pageControl.currentPageIndicatorTintColor = [UIColor lightGrayColor];
                _imagePager2.pageControl.pageIndicatorTintColor = [UIColor blackColor];
                _imagePager2.slideshowTimeInterval = 4.5f;
                _imagePager2.slideshowShouldCallScrollToDelegate = YES;
                _imagePager2.imageCounterDisabled = YES;
        
               // _imagePager2.layer.borderWidth=2;
                _imagePager2.clipsToBounds=YES;
                //[img.layer setCornerRadius:img.frame.size.height/2];
                //[_imagePager.layer setCornerRadius:40.0];
                _imagePager2.layer.borderColor=[[UIColor colorWithRed:50.0/255.0 green:73.0/255.0 blue:109.0/255.0 alpha:1.0]CGColor];
        
        
                _imagePager2.delegate = self;
                _imagePager2.dataSource = self;
        
        
      
        
                [_scrViewImage addSubview:_imagePager2];
        
              //  [self.indicatorView stopAnimating];
               // _indicatorView.hidden=YES;
                self.view.userInteractionEnabled=YES;
    }
    

    
   _scrViewImage.minimumZoomScale=1.0;
    _scrViewImage.maximumZoomScale=6.0;
    _scrViewImage.contentSize=CGSizeMake(1280, 960);
    _scrViewImage.delegate=self;
}

-(void)viewWillAppear:(BOOL)animated
{
    
    //// -----  IMAGE CHANGE  ------ ////
    imgBanner.userInteractionEnabled=YES;
    self.navigationController.navigationBarHidden=YES;
    leftSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeLeftAction:)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    
    rightSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeRightAction)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    
     [imgBanner addGestureRecognizer:leftSwipe];
      [imgBanner addGestureRecognizer:rightSwipe];
     imgBanner.contentMode =  UIViewContentModeScaleToFill;
//    twoFingerPinch = [[UIPinchGestureRecognizer alloc]
//                      initWithTarget:self
//                      action:@selector(twoFingerPinch:)];
//    [_scrViewImage addGestureRecognizer:twoFingerPinch];
    
//    UITapGestureRecognizer * tapimage=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeftAction123:)];
//    tapimage.numberOfTouchesRequired=2;
//    [imgBanner addGestureRecognizer:tapimage];
  
    //imgBanner.userInteractionEnabled=YES;
//    UITapGestureRecognizer * tapimage=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeftAction123:)];
//    
//    [imgBanner addGestureRecognizer:tapimage];
////    
//    imgBanner.userInteractionEnabled=YES;
    
     img_count=0;
   // [timer isValid];
   // [self starTimer];
    

    
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    _imagePager2.pageControl.currentPageIndicatorTintColor = [UIColor orangeColor]; _imagePager2.pageControl.pageIndicatorTintColor = [UIColor blackColor];
    
   // _imagePager2.pageControlCenter = CGPointMake(CGRectGetWidth(_imagePager2.frame) / 2, CGRectGetHeight(_imagePager2.frame) - 42);
}


- (IBAction)map_port_action:(id)sender
{
//    Direction_ViewController *map=[[Direction_ViewController alloc]initWithNibName:@"Direction_ViewController" bundle:nil];
//    map.str_lat=str_lat;
//    map.str_long=str_long;
//    [self.navigationController pushViewController:map animated:YES];
}

-(void)starTimer
{
    
  //  timer = [NSTimer scheduledTimerWithTimeInterval:5.0f
                                       //      target:self
                                    //       selector:@selector(updateImage)
                                     //      userInfo:nil
                                     //       repeats:YES];
}
//-(void)updateImage
//{
//    
//    if (img_count>=4)
//    {
//       img_count=0;
//        
//        
//        imgBanner.image=[UIImage imageNamed:[img_array objectAtIndex:img_count ]];
//        CATransition *transition = [CATransition animation];
//        transition.duration = 1.0f;
//        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//        transition.type = kCATransitionFade;
//        [imgBanner.layer addAnimation:transition forKey:nil];
//        imgBanner.contentMode = UIViewContentModeScaleAspectFit;
//        
//        if ([timer isValid])
//        {
//            [timer invalidate];
//            timer = nil;
//           // [self starTimer];
//        }
//        
//        
//    }

//   else if (img_count<4)
//    {
//        img_count++;
//        imgBanner.image=[UIImage imageNamed:[img_array objectAtIndex:img_count ]];
//        CATransition *transition = [CATransition animation];
//        transition.duration = 1.0f;
//        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//        transition.type = kCATransitionFade;
//        [imgBanner.layer addAnimation:transition forKey:nil];
//         imgBanner.contentMode = UIViewContentModeScaleAspectFit;
//    }
//    else
//    {
//
//    }
//}

- (void) swipeLeftAction:(UISwipeGestureRecognizer *)sender
{
    
        
    if (img_count<4) {
        img_count++;
        imgBanner.image=[UIImage imageNamed:[img_array objectAtIndex:img_count ]];
        CATransition *transition = [CATransition animation];
        transition.duration = 1.0f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition.type = kCATransitionFade;
        [imgBanner.layer addAnimation:transition forKey:nil];
        // imgBanner.contentMode = UIViewContentModeScaleAspectFit;
        
        
    }
    else
    {
    
    }

   
}

- (void) swipeRightAction
{
    if (img_count>0)
    {
        img_count--;

        imgBanner.image=[UIImage imageNamed:[img_array objectAtIndex:img_count ]];
        CATransition *transition = [CATransition animation];
        transition.duration = 1.0f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition.type = kCATransitionFade;
        [imgBanner.layer addAnimation:transition forKey:nil];
        // imgBanner.contentMode = UIViewContentModeScaleAspectFit;
        UITapGestureRecognizer * tapimage=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showAvatar:)];
        
        [imgBanner addGestureRecognizer:tapimage];
        
        imgBanner.userInteractionEnabled=YES;
    }
    else
    {
        
    }
    //Code to handle the gesture
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL)CheckNetwork
{
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.google.com"];
    NetworkStatus NetworkStatus = [reachability currentReachabilityStatus];
    return NetworkStatus;
}



- (UIViewContentMode) contentModeForImage:(NSUInteger)image inPager:(KIImagePager *)pager
{
    return UIViewContentModeScaleAspectFit;
}

- (NSString *) captionForImageAtIndex:(NSUInteger)index inPager:(KIImagePager *)pager
{
    return @[
             @"",
             @"",
             @"",
             @"",
             @"",
             @""
             ][index];
}

#pragma mark - KIImagePager Delegate
- (void) imagePager:(KIImagePager *)imagePager didScrollToIndex:(NSUInteger)index
{
    NSLog(@"%s %lu", __PRETTY_FUNCTION__, (unsigned long)index);
}

- (void) imagePager:(KIImagePager *)imagePager didSelectImageAtIndex:(NSUInteger)index
{
    NSLog(@"%s %lu", __PRETTY_FUNCTION__, (unsigned long)index);
   
}

#pragma mark - KIImagePager DataSource
- (NSArray *) arrayWithImages:(KIImagePager*)pager
{
//        return @[
//                 @"http://youngdecade.in/Project/port/admin/images/J2lcbJEohe8655797531.png",
//                 @"http://youngdecade.in/Project/port/admin/images/n0l1xLFYAM4354585732.png",
//                 @"http://youngdecade.in/Project/port/admin/images/wPRbvRApbb405944033.png",
//                 @"http://youngdecade.in/Project/port/admin/images/PJEYAwzhOW6018431804.png",
//                 @"http://youngdecade.in/Project/port/admin/images/EMwqZ2gQdL15465316805.png"
//                 ];
//    return @[
//             @"1.png",
//             @"2.png",
//             @"3.png",
//             @"4.png",
//             @"5.png"
//             ];
    
  
   return arr_IMAGE  ;
}

-(IBAction)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:NO];
    [timer invalidate];
   
    //    Business_nameViewController *name=[[Business_nameViewController alloc]initWithNibName:@"Business_nameViewController" bundle:nil];
    //    [self.navigationController pushViewController:name animated:NO];
}

-(IBAction)Call_Action:(id)sender
{
    NSLog(@"");
    NSString *phoneNumber = lbl_phone.text;
    NSLog(@"phoneNumber==%@",phoneNumber);
    NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",phoneNumber]];
    
    if ([[UIApplication sharedApplication] canOpenURL:phoneUrl])
    {
        [[UIApplication sharedApplication] openURL:phoneUrl];
    }
    else
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"Info" message:@"Call facility is not available!!!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void) swipeLeftAction123:(UISwipeGestureRecognizer *)sender
{
    imgBanner.image=[UIImage imageNamed:[img_array objectAtIndex:img_count ]];
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [imgBanner.layer addAnimation:transition forKey:nil];
   // imgBanner.contentMode = UIViewContentModeScaleAspectFit;
    
   // UITapGestureRecognizer * tapimage=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showAvatar:)];
    
   // [imgBanner addGestureRecognizer:tapimage];
    
    //imgBanner.userInteractionEnabled=YES;
     [EXPhotoViewer showImageFrom:(UIImageView*)sender.view];
}
- (IBAction)showAvatar:(UITapGestureRecognizer*)sender

{
    [EXPhotoViewer showImageFrom:(UIImageView*)sender.view];
}


//- (void)twoFingerPinch:(UIPinchGestureRecognizer *)recognizer
//{
//    //    NSLog(@"Pinch scale: %f", recognizer.scale);
//    if (recognizer.scale >1.0f && recognizer.scale < 3.5f) {
//        CGAffineTransform transform = CGAffineTransformMakeScale(recognizer.scale, recognizer.scale);
//        _scrViewImage.transform = transform;
//        imgBanner.contentMode = UIViewContentModeScaleAspectFill;
//    }
//    
//    else if (recognizer.scale <=3.5f) {
//        CGAffineTransform transform = CGAffineTransformMakeScale(1.0f, 1.0f);
//        _scrViewImage.transform = transform;
//         imgBanner.contentMode = UIViewContentModeScaleAspectFill;
//    }
//}





- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imagePager2;
}

- (CGRect)zoomRectForScrollView:(UIScrollView *)scrollView withScale:(float)scale withCenter:(CGPoint)center {
    
    CGRect zoomRect;
    
    // The zoom rect is in the content view's coordinates.
    // At a zoom scale of 1.0, it would be the size of the
    // imageScrollView's bounds.
    // As the zoom scale decreases, so more content is visible,
    // the size of the rect grows.
    zoomRect.size.height = _imagePager2.frame.size.height / scale;
    zoomRect.size.width  = _imagePager2.frame.size.width  / scale;
    
    // choose an origin so as to get the right center.
    zoomRect.origin.x = center.x - (zoomRect.size.width  / 2.0);
    zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0);
    
    return zoomRect;
}

@end
