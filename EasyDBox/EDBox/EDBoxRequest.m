//
//  EDBoxRequest.m
//  EDBox
//
//  Created by Paulo Goncalves on 1/09/2016.
//  Copyright © 2016 EDBox. All rights reserved.
//

#import "EDBoxRequest.h"

@implementation EDBoxRequest

-(NSDictionary *)requestMetadataForRoot:(EDBoxAccount *)account{
    
    if (account.isValid) {
        return [[EDBoxApi alloc] requestEDBox:EDBoxUrl withParam:EDBoxFileList andToken:[account accessToken]];
    }else{
        NSLog(@"Dropbox account link error, please try again");
        return nil;
    }
    
}

-(NSDictionary *)requestMetadataForPath:(NSString *)path withAccount:(EDBoxAccount *)account{
    
    if (account.isValid) {
        return [[EDBoxApi alloc] requestEDBox:EDBoxUrl withParam:[NSString stringWithFormat:@"%@%@",EDBoxFileList,path] andToken:[account accessToken]];
    }else{
        NSLog(@"Dropbox account link error, please try again");
        return nil;
    }
    
}

-(NSDictionary *)requestFileOpenForPath:(NSString *)path withAccount:(EDBoxAccount *)account{
    
    if (account.isValid) {
        return [[EDBoxApi alloc] requestEDBoxOpenFile:EDBoxContentUrl withParam:[NSString stringWithFormat:@"%@%@",EDBoxFileOpen,path] andToken:[account accessToken]];
    }else{
        NSLog(@"Dropbox account link error, please try again");
        return nil;
    }
    
}

@end
