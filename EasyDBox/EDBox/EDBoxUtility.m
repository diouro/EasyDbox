//
//  EBoxUtility.m
//  EasyDBox
//
//  Created by Paulo Goncalves on 31/08/2016.
//  Copyright © 2016 EasyDBox. All rights reserved.
//

#import "EDBoxUtility.h"

@implementation EDBoxUtility


+(NSString *)getStringvalueForKey:(NSString *)value{
    @try {
        if ([value isKindOfClass:[NSNull class]] || value == nil) {
            return @"";
        }
        return value;
    }
    @catch (NSException *exception) {
        return @"";
    }
}

+(double)getDoubleValueForKey:(NSString *)value{
    @try {
        if ([value isKindOfClass:[NSNull class]] || value == nil) {
            return 0;
        }
        return [value doubleValue];
    }
    @catch (NSException *exception) {
        return 0;
    }
}

+(int)getIntValueForKey:(NSString *)value{
    @try {
        if ([value isKindOfClass:[NSNull class]] || value == nil) {
            return 0;
        }
        return [value intValue];
    }
    @catch (NSException *exception) {
        return 0;
    }
}

+(BOOL)getBooleanValueForKey:(NSString *)value{
    @try {
        if ([value isKindOfClass:[NSNull class]] || value == nil) {
            return false;
        }
        return [value boolValue];
    }
    @catch (NSException *exception) {
        return false;
    }
}

+(NSArray *)getArrayValueForKey:(NSArray *)value{
    if ([value isKindOfClass:[NSNull class]]) {
        return nil;
    }
    return value;
}


@end
