//
//  JSONRequestHelper.m
//  lesson_Webservice
//
//  Created by mac on 3/13/15.
//  Copyright (c) 2015 youngdecade. All rights reserved.
//

#import "JSONRequestHelper.h"
#import "JSON.h"
#import "SBJSON.h"

#import "Reachability.h"
//http://54.193.26.246/doenota/
#define kAPIStartingpointHost @"http://danielrusso.xyz/APP/"
//http://youngdecadeprojects.biz/

@implementation JSONRequestHelper
@synthesize delegate;

-(void)RecieveRequestWithURL:(NSString *)URL
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
        
        _responseData=[NSMutableData data];
        NSString *url1=[[NSString alloc]initWithFormat:@"%@%@",kAPIStartingpointHost,URL];
        NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:url1]];
        NSLog(@"check 1%@",request);
        NSURLConnection * con =[[NSURLConnection alloc] initWithRequest:request delegate:self];
        NSLog(@"%@",con);
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	[self.responseData setLength:0];
    
    NSLog(@"check 3");
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[self.responseData appendData:data];
    
    NSLog(@"check 4");
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	
    Myalert=[[UIAlertView alloc]initWithTitle:@"Connection Problem" message:@"Connection Not Create"    delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [Myalert show];
    NSLog(@"check 5");
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    NSString *responseString = [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding];
    
    dictionary = [responseString JSONValue];
    
    [self.delegate DidRecieveRequest:dictionary];
}

-(BOOL)CheckNetwork
{
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.google.com"];
    NetworkStatus NetworkStatus = [reachability currentReachabilityStatus];
    return NetworkStatus;
}

@end
