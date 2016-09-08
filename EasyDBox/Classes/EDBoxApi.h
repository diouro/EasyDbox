//
//  DBoxRequest.h
//  EasyDBox
//
//  Created by Paulo Goncalves on 31/08/2016.
//  Copyright © 2016 EasyDBox. All rights reserved.
//

#import <Foundation/Foundation.h>

#define EDBoxUrl @"https://api.dropboxapi.com/1/"
#define EDBoxContentUrl @"https://content.dropboxapi.com/1/"

#define EDBoxAccountInfo @"account/info"
#define EDBoxFileList @"metadata/auto/"
#define EDBoxFileOpen @"files/auto/"

@protocol EDBoxApiDelegate <NSObject>

-(void)didFinishEDBoxRequestWithResponse:(NSDictionary *)response;
-(void)didFinishEDBoxRequestWithError:(NSString *)error;


@end
@interface EDBoxApi : NSObject

@property (nonatomic, retain) id<EDBoxApiDelegate> delegate;


-(void)requestEDBox:(NSString *)route withParam:(NSString *)param andToken:(NSString *)token andDelegate:(id)adelegate;
-(NSDictionary *)requestEDBox:(NSString *)route withParam:(NSString *)param andToken:(NSString *)token;
-(NSDictionary *)requestEDBoxOpenFile:(NSString *)route withParam:(NSString *)param andToken:(NSString *)token;


@end
