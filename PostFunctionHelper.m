//
//  PostFunctionHelper.m
//  lesson_Webservice
//
//  Created by Mac on 4/16/15.
//  Copyright (c) 2015 youngdecade. All rights reserved.
//

#import "PostFunctionHelper.h"
#import "Reachability.h"
#import <UIKit/UIKit.h>
//#define kAPIStartingpointHost @"http://youngdecadeprojects.biz/safety/"
#define kAPIStartingpointHost @"http://danielrusso.xyz/APP/"
@implementation PostFunctionHelper
@synthesize delegate,str_photo;


-(void)RequestWithURL:(NSString *)URL :(NSMutableArray *)ParameterArray :(NSMutableArray *)ValueArray : (NSMutableArray *)ImageArray
{
    if ([self CheckNetwork] == NotReachable)
    {
        NSLog(@"Not Reachable");
        
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Info" message:@"No internet connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        NSLog(@"Reachable");

        NSString * urlstring=kAPIStartingpointHost;
        NSString *str=[NSString stringWithFormat:@"%@%@",urlstring,URL];
    
        NSLog(@"Url Post --- %@",str);
    
        NSString *urlString = [NSString stringWithFormat:@"%@",str];
    
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:urlString]];
        [request setHTTPMethod:@"POST"];
        NSMutableData *body = [NSMutableData data];
        NSString *boundary = @"---------------------------14737809831466499882746641449";
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    
        if (!(ImageArray == nil || [ImageArray count] == 0)) {
        
            NSData *dataImage = [[NSData alloc] init];
        
            for (int i=0; i<ImageArray.count; i++) {
            
                dataImage =  UIImageJPEGRepresentation([ImageArray objectAtIndex:i], 0.001);
            
                if (![dataImage length]==0) {
                
                    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                    if ([str_photo isEqualToString:@"1"]) {
                        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"image\"; filename=\"images%d.jpg\"\r\n",i] dataUsingEncoding:NSUTF8StringEncoding]];
                    }
                    else{
                        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"image[]\"; filename=\"images%d.jpg\"\r\n",i] dataUsingEncoding:NSUTF8StringEncoding]];
                    }
                    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                    [body appendData:[NSData dataWithData:dataImage]];
                    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];

                    
//                    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//                    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"profile\"; filename=\"images%d.jpg\"\r\n",i] dataUsingEncoding:NSUTF8StringEncoding]];
//                    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//                    [body appendData:[NSData dataWithData:dataImage]];
//                    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                    //-------------- First image Close
                }
            }
        }
        
        for (int i=0; i<ParameterArray.count; i++)
        {
        
            
            if ([[ParameterArray objectAtIndex:i] isEqualToString:@"lat"])
            {
                
                //-------------- username sending
                [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"lat\"\r\n\r\n",[ParameterArray objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:[[NSString stringWithFormat:@"%lf",[[ValueArray objectAtIndex:i]floatValue]] dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                //-------------- username sending Close
            }
            else if ([[ParameterArray objectAtIndex:i] isEqualToString:@"long"])
            {
                //-------------- username sending
                [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"long\"\r\n\r\n",[ParameterArray objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:[[NSString stringWithFormat:@"%lf",[[ValueArray objectAtIndex:i]floatValue]] dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                //-------------- username sending Close
            }
            else
            {
            
            //-------------- username sending
            [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",[ParameterArray objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"%@",[ValueArray objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
            //-------------- username sending Close
                NSLog(@"parameter%@",[ParameterArray objectAtIndex:i]);
                NSLog(@"value==%@",[ValueArray objectAtIndex:i]);
            }
        }
    
            [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
            // setting the body of the post to the reqeust
            [request setHTTPBody:body];
        
            NSData* returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
            NSDictionary *dict1;
            if (returnData == NULL){
            
            }
            else
            {
                dict1=[NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingMutableLeaves error:nil];
                NSLog(@"post function taggg==%@",dict1);
                
                NSLog(@"0 - %@",dict1);
                NSLog(@"0 - %@",[dict1 objectForKey:@"success"]);
                NSLog(@"0 - %@",[dict1 objectForKey:@"msg"]);
                
                [delegate DidRecieveResponse:dict1];

        }
    }
}

////////------------

-(void)RequestWithURL1:(NSString *)URL :(NSMutableArray *)ParameterArray :(NSMutableArray *)ValueArray :(NSMutableArray *)ImageArray :(NSMutableArray *)FRIEND_ARRAY :(NSString *) friendparametername

{
    
    if ([self CheckNetwork] == NotReachable)
        
    {
        
        NSLog(@"Not Reachable");
        
        
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Info" message:@"No internet connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    
    else
        
    {
        
        NSLog(@"Reachable");
        
        
        
        NSString * urlstring=kAPIStartingpointHost;
        
        NSString *str=[NSString stringWithFormat:@"%@%@",urlstring,URL];
        
        
        
        NSLog(@"Url Post --- %@",str);
        
        
        
        NSString *urlString = [NSString stringWithFormat:@"%@",str];
        
        
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        
        [request setURL:[NSURL URLWithString:urlString]];
        
        [request setHTTPMethod:@"POST"];
        
        NSMutableData *body = [NSMutableData data];
        
        NSString *boundary = @"---------------------------14737809831466499882746641449";
        
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        
        [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
        
        
        
        if (!(ImageArray == nil || [ImageArray count] == 0)) {
            
            
            
            NSData *dataImage = [[NSData alloc] init];
            
            
            
            for (int i=0; i<ImageArray.count; i++) {
                
                
                
                dataImage =  UIImageJPEGRepresentation([ImageArray objectAtIndex:i], 0.001);
                
                
                
                if (![dataImage length]==0) {
                    
                    
                    
                    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                    
                    if ([str_photo isEqualToString:@"1"]) {
                        
                        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"image\"; filename=\"images%d.jpg\"\r\n",i] dataUsingEncoding:NSUTF8StringEncoding]];
                        
                    }
                    
                    else{
                        
                        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"image\"; filename=\"images%d.jpg\"\r\n",i] dataUsingEncoding:NSUTF8StringEncoding]];
                        
                    }
                    
                    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                    
                    [body appendData:[NSData dataWithData:dataImage]];
                    
                    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                    
                    
                    
                    
                    
                    //                    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                    
                    //                    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"profile\"; filename=\"images%d.jpg\"\r\n",i] dataUsingEncoding:NSUTF8StringEncoding]];
                    
                    //                    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                    
                    //                    [body appendData:[NSData dataWithData:dataImage]];
                    
                    //                    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                    
                    //-------------- First image Close
                    
                }
                
            }
            
        }
        
        
        
        for (int i=0; i<ParameterArray.count; i++)
            
        {
            
            
            
            
            
            //            if ([[ParameterArray objectAtIndex:i] isEqualToString:@"lat"])
            
            //            {
            
            //
            
            //                //-------------- username sending
            
            //                [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            
            //                [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"lat\"\r\n\r\n",[ParameterArray objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
            
            //                [body appendData:[[NSString stringWithFormat:@"%lf",[[ValueArray objectAtIndex:i]floatValue]] dataUsingEncoding:NSUTF8StringEncoding]];
            
            //                [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
            
            //                //-------------- username sending Close
            
            //            }
            
            //            else if ([[ParameterArray objectAtIndex:i] isEqualToString:@"long"])
            
            //            {
            
            //                //-------------- username sending
            
            //                [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            
            //                [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"long\"\r\n\r\n",[ParameterArray objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
            
            //                [body appendData:[[NSString stringWithFormat:@"%lf",[[ValueArray objectAtIndex:i]floatValue]] dataUsingEncoding:NSUTF8StringEncoding]];
            
            //                [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
            
            //                //-------------- username sending Close
            
            //            }
            
            
            
            
            
            
            
            
            
            
            
            
            
            //            else
            
            
            
            
            
            //-------------- username sending
            
            
            
            
            
            [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            
            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",[ParameterArray objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
            
            [body appendData:[[NSString stringWithFormat:@"%@",[ValueArray objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
            
            [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
            
            //-------------- username sending Close
            
            NSLog(@"parrameter array-----%@",[ParameterArray objectAtIndex:i]);
            
            NSLog(@"valuearray array-----%@",[ValueArray objectAtIndex:i]);
            
            
            
        }
        
        
        
        
        
        
        
        
        
        //adding mulitple value loop
        
        
        
        
        
        if (FRIEND_ARRAY.count>0) {

       
            
            
            
        for (int i=0; i<FRIEND_ARRAY.count; i++) {
                

                NSURL *file_url=[FRIEND_ARRAY objectAtIndex:i];
                
                NSString *FileName = [NSString stringWithFormat:@"%@",[file_url lastPathComponent]];
             NSData *data=[[NSData alloc]init];
            
                data=[[FRIEND_ARRAY objectAtIndex:i] dataUsingEncoding:NSUTF8StringEncoding];
       
            NSLog(@"data----%@",data);
                    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                    

                    
               
                        
                    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"file[]\"; filename=\"%@\"\r\n",FileName] dataUsingEncoding:NSUTF8StringEncoding]];
                        
         
                    
                    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];

                    [body appendData:[NSData dataWithData:data]];
                    
                    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
            
            
       
        }
            
            
            
        
}
        
        
        
        
        
        
        
        [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        
        
        
        
        
        
        
        
        
        
        // setting the body of the post to the reqeust
        
        [request setHTTPBody:body];
        
        
        
        NSData* returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        
        
        NSDictionary *dict1;
        
        if (returnData == NULL){
            
            
            
        }
        
        else
            
        {
            
            dict1=[NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingMutableLeaves error:nil];
            
            NSLog(@"post function taggg==%@",dict1);
            
            
            
            NSLog(@"0 - %@",dict1);
            
            NSLog(@"0 - %@",[dict1 objectForKey:@"success"]);
            
            NSLog(@"0 - %@",[dict1 objectForKey:@"msg"]);
            
            
            
            [delegate DidRecieveResponse:dict1];
            
            
            
        }
        
    }
    
    
    
}
    
-(void)RequestWithURL2:(NSString *)URL :(NSMutableArray *)ParameterArray :(NSMutableArray *)ValueArray : (NSMutableArray *)ImageArray

{
    
    if ([self CheckNetwork] == NotReachable)
        
    {
        
        NSLog(@"Not Reachable");
        
        
        
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Info" message:@"No internet connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    
    else
        
    {
        
        NSLog(@"Reachable");
        
        
        
        NSString * urlstring=kAPIStartingpointHost;
        
        NSString *str=[NSString stringWithFormat:@"%@%@",urlstring,URL];
        
        
        
        NSLog(@"Url Post --- %@",str);
        
        
        
        NSString *urlString = [NSString stringWithFormat:@"%@",str];
        
        
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        
        [request setURL:[NSURL URLWithString:urlString]];
        
        [request setHTTPMethod:@"POST"];
        
        NSMutableData *body = [NSMutableData data];
        
        NSString *boundary = @"---------------------------14737809831466499882746641449";
        
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        
        [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
        
        
        
        if (!(ImageArray == nil || [ImageArray count] == 0)) {
            
            
            
            NSData *dataImage = [[NSData alloc] init];
            
            
            
            for (int i=0; i<ImageArray.count; i++) {
                
                
                
                dataImage =  UIImageJPEGRepresentation([ImageArray objectAtIndex:i], 0.001);
                
                
                
                if (![dataImage length]==0) {
                    
                    
                    
                    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                    
                    if ([str_photo isEqualToString:@"1"]) {
                        
                        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"image\"; filename=\"images%d.jpg\"\r\n",i] dataUsingEncoding:NSUTF8StringEncoding]];
                        
                    }
                    
                    else{
                        
                        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"image[]\"; filename=\"images%d.jpg\"\r\n",i] dataUsingEncoding:NSUTF8StringEncoding]];
                        
                    }
                    
                    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                    
                    [body appendData:[NSData dataWithData:dataImage]];
                    
                    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                    
                    
                    
                    
                    
                    //                    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                    
                    //                    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"profile\"; filename=\"images%d.jpg\"\r\n",i] dataUsingEncoding:NSUTF8StringEncoding]];
                    
                    //                    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                    
                    //                    [body appendData:[NSData dataWithData:dataImage]];
                    
                    //                    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                    
                    //-------------- First image Close
                    
                }
                
            }
            
        }
        
        
        
        for (int i=0; i<ParameterArray.count; i++)
            
        {
            
            
            
            
            
            if ([[ParameterArray objectAtIndex:i] isEqualToString:@"lat"])
                
            {
                
                
                
                //-------------- username sending
                
                [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                
                [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"lat\"\r\n\r\n",[ParameterArray objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
                
                [body appendData:[[NSString stringWithFormat:@"%lf",[[ValueArray objectAtIndex:i]floatValue]] dataUsingEncoding:NSUTF8StringEncoding]];
                
                [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                
                //-------------- username sending Close
                
            }
            
            else if ([[ParameterArray objectAtIndex:i] isEqualToString:@"long"])
                
            {
                
                //-------------- username sending
                
                [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                
                [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"long\"\r\n\r\n",[ParameterArray objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
                
                [body appendData:[[NSString stringWithFormat:@"%lf",[[ValueArray objectAtIndex:i]floatValue]] dataUsingEncoding:NSUTF8StringEncoding]];
                
                [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                
                //-------------- username sending Close
                
            }
            
            else
                
            {
                
                
                
                //-------------- username sending
                
                [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                
                [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",[ParameterArray objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
                
                [body appendData:[[NSString stringWithFormat:@"%@",[ValueArray objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
                
                [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                
                //-------------- username sending Close
                
            }
            
        }
        
        
        
        [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        
        
        // setting the body of the post to the reqeust
        
        [request setHTTPBody:body];
        
        
        
        NSData* returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        
        
        NSDictionary *dict1;
        
        if (returnData == NULL){
            
            
            
        }
        
        else
            
        {
            
            dict1=[NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingMutableLeaves error:nil];
            
            NSLog(@"post function taggg==%@",dict1);
            
            
            
            NSLog(@"0 - %@",dict1);
            
            NSLog(@"0 - %@",[dict1 objectForKey:@"success"]);
            
            NSLog(@"0 - %@",[dict1 objectForKey:@"msg"]);
            
            
            
            [delegate DidRecieveResponse:dict1];
            
            
            
        }
        
    }
    
}
//////    video
-(void)RequestWithURL:(NSString *)URL :(NSMutableArray *)ParameterArray :(NSMutableArray *)ValueArray :(NSMutableArray *)ImageArray :(NSMutableArray *)VideoArray
{
    if ([self CheckNetwork] == NotReachable)
    {
        NSLog(@"Not Reachable");
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Info" message:@"No internet connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        NSLog(@"Reachable");
        
        NSString * urlstring=kAPIStartingpointHost;
        NSString *str=[NSString stringWithFormat:@"%@%@",urlstring,URL];
        
        NSLog(@"Url Post --- %@",str);
        
        NSString *urlString = [NSString stringWithFormat:@"%@",str];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:urlString]];
        [request setHTTPMethod:@"POST"];
        NSMutableData *body = [NSMutableData data];
        NSString *boundary = @"---------------------------14737809831466499882746641449";
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
        
        if (!(ImageArray == nil || [ImageArray count] == 0)) {
            
            NSData *dataImage = [[NSData alloc] init];
            
            for (int i=0; i<ImageArray.count; i++) {
                
                dataImage =  UIImageJPEGRepresentation([ImageArray objectAtIndex:i], 0.001);
                
                if (![dataImage length]==0) {
                    
                    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                    if ([str_photo isEqualToString:@"1"]) {
                        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"image\"; filename=\"images%d.jpg\"\r\n",i] dataUsingEncoding:NSUTF8StringEncoding]];
                    }
                    else{
                        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"image[]\"; filename=\"images%d.jpg\"\r\n",i] dataUsingEncoding:NSUTF8StringEncoding]];
                    }
                    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                    [body appendData:[NSData dataWithData:dataImage]];
                    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                    
                    
                    //                    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                    //                    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"profile\"; filename=\"images%d.jpg\"\r\n",i] dataUsingEncoding:NSUTF8StringEncoding]];
                    //                    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                    //                    [body appendData:[NSData dataWithData:dataImage]];
                    //                    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                    //-------------- First image Close
                }
            }
        }
        
        for (int i=0; i<ParameterArray.count; i++)
        {
            
            
            //            if ([[ParameterArray objectAtIndex:i] isEqualToString:@"lat"])
            //            {
            //                //-------------- username sending
            //                [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            //                [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"lat\"\r\n\r\n",[ParameterArray objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
            //                [body appendData:[[NSString stringWithFormat:@"%lf",[[ValueArray objectAtIndex:i]floatValue]] dataUsingEncoding:NSUTF8StringEncoding]];
            //                [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
            //                //-------------- username sending Close
            //            }
            //            else if ([[ParameterArray objectAtIndex:i] isEqualToString:@"long"])
            //            {
            //                //-------------- username sending
            //                [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            //                [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"long\"\r\n\r\n",[ParameterArray objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
            //                [body appendData:[[NSString stringWithFormat:@"%lf",[[ValueArray objectAtIndex:i]floatValue]] dataUsingEncoding:NSUTF8StringEncoding]];
            //                [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
            //                //-------------- username sending Close
            //            }
            //            else
            //            {
            
            //-------------- username sending
            [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",[ParameterArray objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"%@",[ValueArray objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
            //-------------- username sending Close
        }
        
        // }
        
        [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        // setting the body of the post to the reqeust
        [request setHTTPBody:body];
        
        
        NSData* returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        NSDictionary *dict1;
        if (returnData == NULL)
        {
            
        }
        else
        {
            dict1=[NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingMutableLeaves error:nil];
            NSLog(@"post function taggg==%@",dict1);
            request = nil;
            
            //                NSLog(@"0 - %@",dict1);
            //                NSLog(@"0 - %@",[dict1 objectForKey:@"success"]);
            //                NSLog(@"0 - %@",[dict1 objectForKey:@"msg"]);
            
            [delegate DidRecieveResponse:dict1];
            
        }
    }
}
-(void)RequestWithURL12:(NSString *)URL :(NSMutableArray *)ParameterArray :(NSMutableArray *)ValueArray :(NSMutableArray *)ImageArray :(NSMutableArray *)Question_Id :(NSString *) QuestionParameterName :(NSMutableArray *)Answer :(NSString *) Answer_ParameterName
{
    
    if ([self CheckNetwork] == NotReachable)
        
    {
        
        NSLog(@"Not Reachable");
        
        
        
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Info" message:@"No internet connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    
    else
        
    {
        
        NSLog(@"Reachable");
        
        
        
        NSString * urlstring=kAPIStartingpointHost;
        
        NSString *str=[NSString stringWithFormat:@"%@%@",urlstring,URL];
        
        
        
        NSLog(@"Url Post --- %@",str);
        
        
        
        NSString *urlString = [NSString stringWithFormat:@"%@",str];
        
        
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        
        [request setURL:[NSURL URLWithString:urlString]];
        
        [request setHTTPMethod:@"POST"];
        
        NSMutableData *body = [NSMutableData data];
        
        NSString *boundary = @"---------------------------14737809831466499882746641449";
        
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        
        [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
        
        
        
        if (!(ImageArray == nil || [ImageArray count] == 0)) {
            
            
            
            NSData *dataImage = [[NSData alloc] init];
            
            
            
            for (int i=0; i<ImageArray.count; i++) {
                
                
                
                dataImage =  UIImageJPEGRepresentation([ImageArray objectAtIndex:i], 0.001);
                
                
                
                if (![dataImage length]==0) {
                    
                    
                    
                    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                    
                    if ([str_photo isEqualToString:@"1"]) {
                        
                        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"image\"; filename=\"images%d.jpg\"\r\n",i] dataUsingEncoding:NSUTF8StringEncoding]];
                        
                    }
                    
                    else{
                        
                        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"image\"; filename=\"images%d.jpg\"\r\n",i] dataUsingEncoding:NSUTF8StringEncoding]];
                        
                    }
                    
                    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                    
                    [body appendData:[NSData dataWithData:dataImage]];
                    
                    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                    
                    
                    
                    
                    
                    //                    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                    
                    //                    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"profile\"; filename=\"images%d.jpg\"\r\n",i] dataUsingEncoding:NSUTF8StringEncoding]];
                    
                    //                    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                    
                    //                    [body appendData:[NSData dataWithData:dataImage]];
                    
                    //                    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                    
                    //-------------- First image Close
                    
                }
                
            }
            
        }
        
        
        
        for (int i=0; i<ParameterArray.count; i++)
            
        {
            
            
            
            
            
            //            if ([[ParameterArray objectAtIndex:i] isEqualToString:@"lat"])
            
            //            {
            
            //
            
            //                //-------------- username sending
            
            //                [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            
            //                [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"lat\"\r\n\r\n",[ParameterArray objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
            
            //                [body appendData:[[NSString stringWithFormat:@"%lf",[[ValueArray objectAtIndex:i]floatValue]] dataUsingEncoding:NSUTF8StringEncoding]];
            
            //                [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
            
            //                //-------------- username sending Close
            
            //            }
            
            //            else if ([[ParameterArray objectAtIndex:i] isEqualToString:@"long"])
            
            //            {
            
            //                //-------------- username sending
            
            //                [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            
            //                [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"long\"\r\n\r\n",[ParameterArray objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
            
            //                [body appendData:[[NSString stringWithFormat:@"%lf",[[ValueArray objectAtIndex:i]floatValue]] dataUsingEncoding:NSUTF8StringEncoding]];
            
            //                [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
            
            //                //-------------- username sending Close
            
            //            }
            
            
            
            
            
            
            
            
            
            
            
            
            
            //            else
            
            
            
            
            
            //-------------- username sending
            
            
            
            
            
            [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            
            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",[ParameterArray objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
            
            [body appendData:[[NSString stringWithFormat:@"%@",[ValueArray objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
            
            [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
            
            //-------------- username sending Close
            
            NSLog(@"parrameter array-----%@",[ParameterArray objectAtIndex:i]);
            
            NSLog(@"valuearray array-----%@",[ValueArray objectAtIndex:i]);
            
            
            
        }
        
        
        
        
        
        
        
        
        
        //adding mulitple value loop
        
        
        
        
        
        if (Question_Id.count>0) {
            
            
            
            
            
            for (int i=0; i<Question_Id.count; i++) {
                
                
                
                [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                
                [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",QuestionParameterName] dataUsingEncoding:NSUTF8StringEncoding]];
                
                [body appendData:[[NSString stringWithFormat:@"%@",[Question_Id objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
                
                [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                
                //-------------- username sending Close
                
                
                NSLog(@"Question_Id array-----%@",[Question_Id objectAtIndex:i]);
                
                
                
                //                NSURL *file_url=[Question_Id objectAtIndex:i];
                //
                //                NSString *FileName = [NSString stringWithFormat:@"Successfully imported %@", [file_url lastPathComponent]];
                //
                //                NSData *data=[[Question_Id objectAtIndex:i] dataUsingEncoding:NSUTF8StringEncoding];
                //
                //
                //                [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                //
                //
                //
                //
                //
                //                [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"question_id[]\"; filename=\"%@\"\r\n",FileName] dataUsingEncoding:NSUTF8StringEncoding]];
                //
                //
                //
                //                [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                //
                //                [body appendData:[NSData dataWithData:data]];
                //
                //                [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                
                
                
                
                
            }
            
            
            
        }
        if (Answer.count>0) {
            
            
            
            
            
            for (int i=0; i<Answer.count; i++) {
                
                
                [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                
                [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",Answer_ParameterName] dataUsingEncoding:NSUTF8StringEncoding]];
                
                [body appendData:[[NSString stringWithFormat:@"%@",[Answer objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
                
                [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                
                //-------------- username sending Close
                
                
                NSLog(@"Answer array-----%@",[Answer objectAtIndex:i]);
                
                
                //                NSURL *file_url=[Answer objectAtIndex:i];
                //
                //                NSString *FileName = [NSString stringWithFormat:@"Successfully imported %@", [file_url lastPathComponent]];
                //
                //                NSData *data=[[Answer objectAtIndex:i] dataUsingEncoding:NSUTF8StringEncoding];
                //
                //
                //                [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                //
                //
                //
                //
                //
                //                [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"answer[]\"; filename=\"%@\"\r\n",FileName] dataUsingEncoding:NSUTF8StringEncoding]];
                //
                //
                //
                //                [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                //
                //                [body appendData:[NSData dataWithData:data]];
                //
                //                [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                
                
                
                
                
            }
            
            
            
        }
        
        
        
        [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        
        
        
        
        
        
        
        
        
        
        // setting the body of the post to the reqeust
        
        [request setHTTPBody:body];
        
        
        
        NSData* returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        
        
        NSDictionary *dict1;
        
        if (returnData == NULL){
            
            
            
        }
        
        else
            
        {
            
            dict1=[NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingMutableLeaves error:nil];
            
            NSLog(@"post function taggg==%@",dict1);
            
            
            
            NSLog(@"0 - %@",dict1);
            
            NSLog(@"0 - %@",[dict1 objectForKey:@"success"]);
            
            NSLog(@"0 - %@",[dict1 objectForKey:@"msg"]);
            
            
            
            [delegate DidRecieveResponse:dict1];
            
            
            
        }
        
    }
    
    
    
}
///////-------------------Create Gallery---------------/////////////////////




-(void)RequestWithURL123:(NSString *)URL :(NSMutableArray *)ParameterArray :(NSMutableArray *)ValueArray : (NSMutableArray *)ImageArray :(NSMutableArray *)VideoArray

{
    if ([self CheckNetwork] == NotReachable)
    {
        NSLog(@"Not Reachable");
        
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Info" message:@"No internet connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        NSLog(@"Reachable");
        
        NSString * urlstring=kAPIStartingpointHost;
        NSString *str=[NSString stringWithFormat:@"%@%@",urlstring,URL];
        
        NSLog(@"Url Post --- %@",str);
        
        NSString *urlString = [NSString stringWithFormat:@"%@",str];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:urlString]];
        [request setHTTPMethod:@"POST"];
        NSMutableData *body = [NSMutableData data];
        NSString *boundary = @"---------------------------14737809831466499882746641449";
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
        
        if (!(ImageArray == nil || [ImageArray count] == 0)) {
            
            NSData *dataImage = [[NSData alloc] init];
            
            for (int i=0; i<ImageArray.count; i++) {
                
                dataImage =  UIImageJPEGRepresentation([ImageArray objectAtIndex:i], 0.2);
                
                if (![dataImage length]==0) {
                    
                    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"photo\"; filename=\"images%d.jpg\"\r\n",i] dataUsingEncoding:NSUTF8StringEncoding]];
                    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                    [body appendData:[NSData dataWithData:dataImage]];
                    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                    
                    //-------------- First image Close
                }
            }
        }
        if (!(VideoArray == nil || [VideoArray count] == 0)) {
            
            NSData *datavideo = [[NSData alloc] init];
            
            for (int i=0; i<VideoArray.count; i++) {
                
                datavideo =  [VideoArray objectAtIndex:i];
                
                if (![datavideo length]==0) {
                    
                    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"video\"; filename=\"video%d.mov\"\r\n",i] dataUsingEncoding:NSUTF8StringEncoding]];
                    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                    
                    // [formData appendPartWithFileData:videoData name:@"file" fileName:@"myVideo.mov" mimeType:@"video/quicktime"];
                    
                    [body appendData:[NSData dataWithData:datavideo]];
                    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                    
                    //-------------- First image Close
                    
                    
//                    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//                    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"thumb_nail\"; filename=\"images%d.jpg\"\r\n",i] dataUsingEncoding:NSUTF8StringEncoding]];
//                    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//                    
//                    // [formData appendPartWithFileData:videoData name:@"file" fileName:@"myVideo.mov" mimeType:@"video/quicktime"];
//                    NSData *data_thumb=[[NSData alloc]init];
//                    data_thumb=UIImageJPEGRepresentation(imgView.image, 0.2);
//                    
//                    [body appendData:[NSData dataWithData:data_thumb]];
//                    
//                    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                    
                }
            }
        }
        
        for (int i=0; i<ParameterArray.count; i++)
        {
            
            //-------------- username sending
            [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",[ParameterArray objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"%@",[ValueArray objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
            
            NSLog(@"parameter---%@",[ParameterArray objectAtIndex:i]);
            NSLog(@"value---%@",[ValueArray objectAtIndex:i]);
            
            //-------------- username sending Close
        }
        
        [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        // setting the body of the post to the reqeust
        [request setHTTPBody:body];
        
        NSData* returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        NSDictionary *dict1;
        if (returnData == NULL){
            
        }
        else
        {
            dict1=[NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingMutableLeaves error:nil];
            NSLog(@"post function taggg==%@",dict1);
            
            NSLog(@"0 - %@",dict1);
            NSLog(@"0 - %@",[dict1 objectForKey:@"success"]);
            NSLog(@"0 - %@",[dict1 objectForKey:@"msg"]);
            
            [self.delegate DidRecieveResponse:dict1];
            
        }
    }
    
}

//////////------------Thumbnail array---------------/////////////

-(void)RequestWithURL12345:(NSString *)URL :(NSMutableArray *)ParameterArray :(NSMutableArray *)ValueArray : (NSMutableArray *)ImageArray :(NSMutableArray *)VideoArray :(NSMutableArray *)thumbnailArray
{
    if ([self CheckNetwork] == NotReachable)
    {
        NSLog(@"Not Reachable");
        
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Info" message:@"No internet connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        NSLog(@"Reachable");
        
        NSString * urlstring=kAPIStartingpointHost;
        NSString *str=[NSString stringWithFormat:@"%@%@",urlstring,URL];
        
        NSLog(@"Url Post --- %@",str);
        
        NSString *urlString = [NSString stringWithFormat:@"%@",str];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:urlString]];
        [request setHTTPMethod:@"POST"];
        NSMutableData *body = [NSMutableData data];
        NSString *boundary = @"---------------------------14737809831466499882746641449";
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
        
        if (!(ImageArray == nil || [ImageArray count] == 0)) {
            
            NSData *dataImage = [[NSData alloc] init];
            
            
            
            
            for (int i=0; i<ImageArray.count; i++) {
                
                dataImage =  UIImageJPEGRepresentation([ImageArray objectAtIndex:i], 0.2);
                
                if (![dataImage length]==0) {
                    
                    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"photo\"; filename=\"images%d.jpg\"\r\n",i] dataUsingEncoding:NSUTF8StringEncoding]];
                    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                    [body appendData:[NSData dataWithData:dataImage]];
                    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                    
                    //-------------- First image Close
                }
            }
        }
        
        
        
        if (!(VideoArray == nil || [VideoArray count] == 0)) {
            
            NSData *datavideo = [[NSData alloc] init];
            
            for (int i=0; i<VideoArray.count; i++) {
                
                datavideo =  [VideoArray objectAtIndex:i];
                
                if (![datavideo length]==0) {
                    
                    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"video\"; filename=\"video%d.mov\"\r\n",i] dataUsingEncoding:NSUTF8StringEncoding]];
                    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                    
                    // [formData appendPartWithFileData:videoData name:@"file" fileName:@"myVideo.mov" mimeType:@"video/quicktime"];
                    
                    [body appendData:[NSData dataWithData:datavideo]];
                    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                    
                    //-------------- First image Close
                    NSData *dataImage = [[NSData alloc] init];
                    
                    dataImage =  UIImageJPEGRepresentation([thumbnailArray objectAtIndex:i], 0.2);
                    
                    if (![dataImage length]==0) {
                        
                        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"thumb_nail\"; filename=\"images%d.jpg\"\r\n",i] dataUsingEncoding:NSUTF8StringEncoding]];
                        [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                        [body appendData:[NSData dataWithData:dataImage]];
                        [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                        
                        //-------------- First image Close
                    }
                    
                }
            }
        }
        
        for (int i=0; i<ParameterArray.count; i++)
        {
            
            //-------------- username sending
            [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",[ParameterArray objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"%@",[ValueArray objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
            
            NSLog(@"parameter---%@",[ParameterArray objectAtIndex:i]);
            NSLog(@"value---%@",[ValueArray objectAtIndex:i]);
            
            //-------------- username sending Close
        }
        
        [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        // setting the body of the post to the reqeust
        [request setHTTPBody:body];
        
        NSData* returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        NSDictionary *dict1;
        if (returnData == NULL){
            
        }
        else
        {
            dict1=[NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingMutableLeaves error:nil];
            NSLog(@"post function taggg==%@",dict1);
            
            NSLog(@"0 - %@",dict1);
            NSLog(@"0 - %@",[dict1 objectForKey:@"success"]);
            NSLog(@"0 - %@",[dict1 objectForKey:@"msg"]);
            
            [self.delegate DidRecieveResponse:dict1];
            
        }
    }
    
}


-(void)RequestWithURLSELLER:(NSString *)URL :(NSMutableArray *)ParameterArray :(NSMutableArray *)ValueArray :(NSMutableArray *)ImageArray :(NSMutableArray *)skill_id :(NSMutableArray *) work_link :(NSMutableArray *)work_price :(NSMutableArray *) work_image :(NSMutableArray *) review_title :(NSMutableArray *) review_des :(NSMutableArray *) work_skill_id
{
    
    if ([self CheckNetwork] == NotReachable)
    {
        NSLog(@"Not Reachable");
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Info" message:@"No internet connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        NSLog(@"Reachable");
        
        NSString * urlstring=kAPIStartingpointHost;
        NSString *str=[NSString stringWithFormat:@"%@%@",urlstring,URL];
        
        NSLog(@"Url Post --- %@",str);
        
        NSString *urlString = [NSString stringWithFormat:@"%@",str];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:urlString]];
        [request setHTTPMethod:@"POST"];
        NSMutableData *body = [NSMutableData data];
        NSString *boundary = @"---------------------------14737809831466499882746641449";
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
        
        if (!(ImageArray == nil || [ImageArray count] == 0)) {
            
            NSData *dataImage = [[NSData alloc] init];
            
            
            
            
            for (int i=0; i<ImageArray.count; i++) {
                
                dataImage =  UIImageJPEGRepresentation([ImageArray objectAtIndex:i], 0.2);
                
                if (![dataImage length]==0) {
                    
                    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"logo\"; filename=\"images%d.jpg\"\r\n",i] dataUsingEncoding:NSUTF8StringEncoding]];
                    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                    [body appendData:[NSData dataWithData:dataImage]];
                    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                    
                    //-------------- First image Close
                }
            }
        }
        
       
            
            for (int i=0; i<work_image.count; i++)
            {
                
              
                    
                    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"work_image[]\"; filename=\"images%d.jpg\"\r\n",i] dataUsingEncoding:NSUTF8StringEncoding]];
                    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                    [body appendData:[NSData dataWithData:[work_image objectAtIndex:i]]];
                    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                    
                    //-------------- First image Close
              
            }

        
        for (int i=0; i<ParameterArray.count; i++)
        {
            
            //-------------- username sending
            [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",[ParameterArray objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"%@",[ValueArray objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
            
            NSLog(@"parameter---%@",[ParameterArray objectAtIndex:i]);
            NSLog(@"value---%@",[ValueArray objectAtIndex:i]);
            
            //-------------- username sending Close
        }
        
        for (int i=0; i<skill_id.count; i++)
        {
            //-------------- username sending
            [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"skill_id[]\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"%@",[skill_id objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
            //-------------- username sending Close
        }
        for (int i=0; i<work_link.count; i++)
        {
            //-------------- username sending
            [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"work_link[]\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"%@",[work_link objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
            //-------------- username sending Close
        }
        
        for (int i=0; i<work_price.count; i++)
        {
            //-------------- username sending
            [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"work_price[]\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"%@",[work_price objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
            //-------------- username sending Close
        }
        for (int i=0; i<review_title.count; i++)
        {
            //-------------- username sending
            [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"review_title[]\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"%@",[review_title objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
            //-------------- username sending Close
        }
        for (int i=0; i<review_des.count; i++)
        {
            //-------------- username sending
            [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"review_description[]\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"%@",[review_des objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
            //-------------- username sending Close
        }
        for (int i=0; i<work_skill_id.count; i++)
        {
            //-------------- username sending
            [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"work_skill_id[]\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"%@",[work_skill_id objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
            //-------------- username sending Close
        }
        
        [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        // setting the body of the post to the reqeust
        [request setHTTPBody:body];
        
        NSData* returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        NSDictionary *dict1;
        if (returnData == NULL){
            
        }
        else
        {
            dict1=[NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingMutableLeaves error:nil];
            NSLog(@"post function taggg==%@",dict1);
            
            NSLog(@"0 - %@",dict1);
            NSLog(@"0 - %@",[dict1 objectForKey:@"success"]);
            NSLog(@"0 - %@",[dict1 objectForKey:@"msg"]);
            
            [self.delegate DidRecieveResponse:dict1];
            
        }
    }
    
}


-(BOOL)CheckNetwork
{
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.google.com"];
    NetworkStatus NetworkStatus = [reachability currentReachabilityStatus];
    return NetworkStatus;
}

@end
