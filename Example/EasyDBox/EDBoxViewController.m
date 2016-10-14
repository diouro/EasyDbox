//
//  EDBoxViewController.m
//  EasyDBox
//
//  Created by Paulo Goncalves on 08/31/2016.
//  Copyright (c) 2016 Paulo Goncalves. All rights reserved.
//

#import "EDBoxViewController.h"

@interface EDBoxViewController ()

@end

@implementation EDBoxViewController

@synthesize imgView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //Retrieve account from app delegate
    //Use your own method to save the EDBoxAccount object
    EDBoxAccount *account = [(EDBoxAppDelegate *)[[UIApplication sharedApplication] delegate] account];
    
    //Refer to a image on your dropbox account to test
    NSString *dbImage = @"Screenshots/idea-1.png";
    
    NSDictionary *returnData = [[EDBoxRequest alloc] requestFileOpenForPath:dbImage withAccount:account];
    NSData *imageData = [returnData valueForKey:@"data"];
    NSURLResponse *response = [returnData valueForKey:@"response"];
    NSLog(@"Open file: %@",response.MIMEType);
    
    if (imageData != nil) {
        [imgView setImage:[UIImage imageWithData:imageData]];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
