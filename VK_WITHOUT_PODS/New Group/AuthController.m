//
//  AuthController.m
//  VK_WITHOUT_PODS
//
//  Created by Victor on 28.03.2018.
//  Copyright © 2018 Victor. All rights reserved.
//

#import "AuthController.h"
#import "NetManager.h"

@interface AuthController ()
@property(assign, nonatomic) BOOL firstTimeArray;
@end

@implementation AuthController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.firstTimeArray = YES;
}

- (IBAction)AuthButton:(UIButton *)sender {
    if (self.firstTimeArray == YES) {
        
        [[NetManager sharedManager] authorizeUser:^(Auth *user) {
            [self performSegueWithIdentifier:@"firstSegue" sender:self];
        }];
    }
    
    
}

@end
