//
//  DBoxAccount.h
//  EasyDBox
//
//  Created by Paulo Goncalves on 31/08/2016.
//  Copyright © 2016 EasyDBox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EDBoxApi.h"
#import "EDBoxUtility.h"

@protocol EDBoxAccountDelegate <NSObject>

-(void)didFinishEDBoxSuccess:(id)aAccount;
-(void)didFinishEDBoxFail:(NSString *)error;

@end

@interface EDBoxAccount : NSObject <EDBoxApiDelegate>

@property (nonatomic, retain) id<EDBoxAccountDelegate> delegate;

@property (nonatomic, retain) NSString *accessToken;

@property (nonatomic, retain) NSString *display_name;
@property (nonatomic, retain) NSString *familiar_name;
@property (nonatomic, retain) NSString *given_name;
@property (nonatomic, retain) NSString *surname;
@property (nonatomic, retain) NSString *referral_link;
@property (nonatomic, retain) NSString *country;
@property (nonatomic, retain) NSString *locale;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *team_name;
@property (nonatomic, retain) NSString *team_id;

@property int uid,quota_shared,quota,quota_normal;
@property BOOL email_verified,is_pared;

+(EDBoxAccount *)sharedSession;

-(void)initWithToken:(NSString *)token andDelegate:(id)adelegate;
-(BOOL)isValid;

@end
