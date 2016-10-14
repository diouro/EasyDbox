//
//  EDBoxAppDelegate.h
//  EasyDBox
//
//  Created by Paulo Goncalves on 08/31/2016.
//  Copyright (c) 2016 Paulo Goncalves. All rights reserved.
//

@import UIKit;

#import <EasyDBox/EDBox.h>

@interface EDBoxAppDelegate : UIResponder <UIApplicationDelegate,EDBoxAccountDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) EDBoxAccount *account;

@end
