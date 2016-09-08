//
//  DBoxAccount.m
//  EasyDBox
//
//  Created by Paulo Goncalves on 31/08/2016.
//  Copyright © 2016 EasyDBox. All rights reserved.
//

#import "EDBoxAccount.h"

@implementation EDBoxAccount

@synthesize uid,quota_shared,quota,quota_normal;
@synthesize is_pared,email_verified;
@synthesize display_name,familiar_name,given_name,surname,referral_link,country,locale,team_id,team_name;
@synthesize delegate;

static EDBoxAccount *sharedSession = nil;

+(EDBoxAccount *)sharedSession{
    
    if (sharedSession == nil) {
        sharedSession = [[super allocWithZone:NULL] init];
    }
    
    return sharedSession;
}

-(void)initWithToken:(NSString *)token andDelegate:(id)adelegate{

    delegate = adelegate;
    self.accessToken = token;
    
    [[EDBoxApi alloc] requestEDBox:EDBoxUrl withParam:EDBoxAccountInfo andToken:self.accessToken andDelegate:self];

}

-(BOOL)isValid{
    
    NSLog(@"Checking account validation: %@ - uid - %i",self.display_name,self.uid);
    
    if (self.uid != 0) {
        return true;
    }else{
        return false;
    }
}

#pragma -mark EDBoxRequestDelegate

-(void)didFinishEDBoxRequestWithResponse:(NSDictionary *)response{
    
    self.uid = [EDBoxUtility getIntValueForKey:[response valueForKey:@"uid"]];
    self.quota = [EDBoxUtility getIntValueForKey:[[response valueForKey:@"quota_info"] valueForKey:@"quota"]];
    self.quota_shared = [EDBoxUtility getIntValueForKey:[[response valueForKey:@"quota_info"] valueForKey:@"shared"]];
    self.quota_normal = [EDBoxUtility getIntValueForKey:[[response valueForKey:@"quota_info"] valueForKey:@"normal"]];
    
    self.display_name = [EDBoxUtility getStringvalueForKey:[response valueForKey:@"display_name"]];
    self.familiar_name = [EDBoxUtility getStringvalueForKey:[[response valueForKey:@"name_details"] valueForKey:@"familiar_name"]];
    self.given_name = [EDBoxUtility getStringvalueForKey:[[response valueForKey:@"name_details"] valueForKey:@"given_name"]];
    self.surname = [EDBoxUtility getStringvalueForKey:[[response valueForKey:@"name_details"] valueForKey:@"surname"]];
    self.referral_link = [EDBoxUtility getStringvalueForKey:[response valueForKey:@"referral_link"]];
    self.country = [EDBoxUtility getStringvalueForKey:[response valueForKey:@"country"]];
    self.locale = [EDBoxUtility getStringvalueForKey:[response valueForKey:@"locale"]];
    self.email = [EDBoxUtility getStringvalueForKey:[response valueForKey:@"email"]];
    
    self.team_id = [EDBoxUtility getStringvalueForKey:[[response valueForKey:@"team"] valueForKey:@"team_id"]];
    self.team_name = [EDBoxUtility getStringvalueForKey:[[response valueForKey:@"team"] valueForKey:@"name"]];
    
    self.email_verified = [EDBoxUtility getBooleanValueForKey:[response valueForKey:@"email_verified"]];
    self.is_pared = [EDBoxUtility getBooleanValueForKey:[response valueForKey:@"is_pared"]];
    
    [self.delegate didFinishEDBoxSuccess:self];
}

-(void)didFinishEDBoxRequestWithError:(NSString *)error{
    [self.delegate didFinishEDBoxFail:error];
}

@end
