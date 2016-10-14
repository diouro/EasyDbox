//
//  EBoxUtility.h
//  EasyDBox
//
//  Created by Paulo Goncalves on 31/08/2016.
//  Copyright © 2016 EasyDBox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EDBoxUtility : NSObject

+(NSString *)getStringvalueForKey:(NSString *)value;
+(double)getDoubleValueForKey:(NSString *)value;
+(int)getIntValueForKey:(NSString *)value;
+(BOOL)getBooleanValueForKey:(NSString *)value;
+(NSArray *)getArrayValueForKey:(NSArray *)value;

@end
