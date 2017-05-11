//
//  PostFunctionHelper.h
//  lesson_Webservice
//
//  Created by Mac on 4/16/15.
//  Copyright (c) 2015 youngdecade. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol PostFunctionDelegate<NSObject>

-(void)DidRecieveResponse:(NSDictionary *)Dictionary;

@end

@interface PostFunctionHelper : NSObject
{
    UIAlertView *  Myalert;
}

@property(nonatomic,retain)id<PostFunctionDelegate>delegate;
//@property (weak, nonatomic) UIImageView *imgView;

-(void)RequestWithURL:(NSString *)URL :(NSMutableArray *)ParameterArray :(NSMutableArray *)ValueArray : (NSMutableArray *)ImageArray;
-(void)RequestWithURL1:(NSString *)URL :(NSMutableArray *)ParameterArray :(NSMutableArray *)ValueArray :(NSMutableArray *)ImageArray :(NSMutableArray *)FRIEND_ARRAY :(NSString *) friendparametername;
 -(void)RequestWithURL2:(NSString *)URL :(NSMutableArray *)ParameterArray :(NSMutableArray *)ValueArray : (NSMutableArray *)ImageArray;
-(void)RequestWithURL:(NSString *)URL :(NSMutableArray *)ParameterArray :(NSMutableArray *)ValueArray : (NSMutableArray *)ImageArray :(NSMutableArray *)VideoArray;

-(void)RequestWithURL12345:(NSString *)URL :(NSMutableArray *)ParameterArray :(NSMutableArray *)ValueArray : (NSMutableArray *)ImageArray :(NSMutableArray *)VideoArray :(NSMutableArray *)thumbnailArray;

-(void)RequestWithURL123:(NSString *)URL :(NSMutableArray *)ParameterArray :(NSMutableArray *)ValueArray : (NSMutableArray *)ImageArray :(NSMutableArray *)VideoArray;


-(void)RequestWithURL12:(NSString *)URL :(NSMutableArray *)ParameterArray :(NSMutableArray *)ValueArray :(NSMutableArray *)ImageArray :(NSMutableArray *)Question_Id :(NSString *) QuestionParameterName :(NSMutableArray *)Answer :(NSString *) Answer_ParameterName;

-(void)RequestWithURLSELLER:(NSString *)URL :(NSMutableArray *)ParameterArray :(NSMutableArray *)ValueArray :(NSMutableArray *)ImageArray :(NSMutableArray *)skill_id :(NSMutableArray *) work_link :(NSMutableArray *)work_price :(NSMutableArray *) work_image :(NSMutableArray *) review_title :(NSMutableArray *) review_des :(NSMutableArray *) work_skill_id;
@property (nonatomic ,retain)NSString *str_photo;

@end
