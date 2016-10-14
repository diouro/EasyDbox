//
//  EDBoxRequest.h
//  EDBox
//
//  Created by Paulo Goncalves on 1/09/2016.
//  Copyright © 2016 EDBox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EDBoxAccount.h"
#import "EDBoxApi.h"

@interface EDBoxRequest : NSObject

-(NSDictionary *)requestMetadataForRoot:(EDBoxAccount *)account;
-(NSDictionary *)requestMetadataForPath:(NSString *)path withAccount:(EDBoxAccount *)account;
-(NSDictionary *)requestFileOpenForPath:(NSString *)path withAccount:(EDBoxAccount *)account;

@end
