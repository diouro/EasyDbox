//
//  DBoxRequest.m
//  EasyDBox
//
//  Created by Paulo Goncalves on 31/08/2016.
//  Copyright © 2016 EasyDBox. All rights reserved.
//

#import "EDBoxApi.h"

@implementation EDBoxApi

-(void)requestEDBox:(NSString *)route withParam:(NSString *)param andToken:(NSString *)token andDelegate:(id)adelegate{

    
    @try {
        
        NSString *url = [NSString stringWithFormat:@"%@%@",route,param];
        NSString *header = [NSString stringWithFormat:@"Bearer %@",token];
        NSLog(@" ( EDBox ) - Request url: %@",url);
        NSLog(@" ( EDBox ) - Request header: %@",header);
        
        //NSData *myRequestData = [NSData dataWithBytes:[param UTF8String] length:[param length]];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:20];
        [request setHTTPMethod: @"GET"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
        //[request setHTTPBody:myRequestData];
        [request setValue:header forHTTPHeaderField:@"Authorization"];
        NSError *error;
        NSURLResponse *response;
        
        NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        
        if (error == nil){
            
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:nil];
            
            if (dictionary) {
                
                [adelegate didFinishEDBoxRequestWithResponse:dictionary];
                
            }else{
                
                NSLog(@"Error: %@",[[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding]);
                [self.delegate didFinishEDBoxRequestWithError:@"Error fetching data"];
                
            }
            
        }else{
            
            [self.delegate didFinishEDBoxRequestWithError:[error localizedDescription]];
            
        }
        
    }
    @catch (NSException *exception) {
        NSLog(@"Error: %@",exception);
        [self.delegate didFinishEDBoxRequestWithError:exception.description];
    }
    
}

-(NSDictionary *)requestEDBox:(NSString *)route withParam:(NSString *)param andToken:(NSString *)token{
    
    
    @try {
        
        NSString *url = [NSString stringWithFormat:@"%@%@",route,param];
        NSString *header = [NSString stringWithFormat:@"Bearer %@",token];
        NSLog(@" ( EDBox ) - Request url: %@",url);
        NSLog(@" ( EDBox ) - Request header: %@",header);
        
        //NSData *myRequestData = [NSData dataWithBytes:[param UTF8String] length:[param length]];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:20];
        [request setHTTPMethod: @"GET"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
        //[request setHTTPBody:myRequestData];
        [request setValue:header forHTTPHeaderField:@"Authorization"];
        NSError *error;
        NSURLResponse *response;
        
        NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        
        if (error == nil){
            
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:nil];
            
            if (dictionary) {
                
                return dictionary;
                
            }else{
                
                NSLog(@"EDBox Unexpected error: %@",[[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding]);
                //NSLog(@"EDBox Unexpected error");
                
            }
            
        }else{
            
            NSLog(@"EDBox error: %@",[error localizedDescription]);
            
        }
        
    }
    @catch (NSException *exception) {
        NSLog(@"EDBox error: %@",exception.description);
    }
    
}

-(NSDictionary *)requestEDBoxOpenFile:(NSString *)route withParam:(NSString *)param andToken:(NSString *)token{
    
    
    @try {
        
        NSString *url = [NSString stringWithFormat:@"%@%@",route,param];
        NSString *header = [NSString stringWithFormat:@"Bearer %@",token];
        NSLog(@" ( EDBox ) - Request url: %@",url);
        NSLog(@" ( EDBox ) - Request header: %@",header);
        
        //NSData *myRequestData = [NSData dataWithBytes:[param UTF8String] length:[param length]];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:20];
        [request setHTTPMethod: @"GET"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
        //[request setHTTPBody:myRequestData];
        [request setValue:header forHTTPHeaderField:@"Authorization"];
        NSError *error;
        NSURLResponse *response;
        
        NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        
        if (error == nil){
            
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic setValue:returnData forKey:@"data"];
            [dic setValue:response forKey:@"response"];
            return dic;
            
        }else{
            
            NSLog(@"EDBox error: %@",[error localizedDescription]);
            return nil;
            
        }
        
    }
    @catch (NSException *exception) {
        NSLog(@"EDBox error: %@",exception.description);
    }
    
}


@end
