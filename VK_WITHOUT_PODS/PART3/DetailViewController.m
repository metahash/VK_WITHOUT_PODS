//
//  DetailViewController.m
//  VK_WITHOUT_PODS
//
//  Created by Victor on 28.03.2018.
//  Copyright © 2018 Victor. All rights reserved.
//

#import "DetailViewController.h"
#import "FriendsViewController.h"

#import "DetailModel.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *fullNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIView *infoView;

@end

@implementation DetailViewController



static NSInteger flag = 0;


- (void)viewDidLoad {
    [super viewDidLoad];
    [self statusBarClear];
    [self loadData];
}

- (void) loadData {
    // simple KVC
    
    if (self.data) {
        DetailModel * model = [DetailModel new];
        
        if ([model initWithResponse:self.data])
            
            self.fullNameLabel.text = model.userFullName;
        self.idLabel.text = model.userId;
        self.locationLabel.text = model.userLocation;
        
        if (model.userImageURL) {
            NSURL *url = [NSURL URLWithString:model.userImageURL];
            NSData *data1 = [[NSData alloc] initWithContentsOfURL:url];
            UIImage *tmpImage = [[UIImage alloc] initWithData:data1];
            self.image.image = tmpImage;
        }
    }
}


- (IBAction)tap:(id)sender {
    if (!flag) {
        
        //hide
        [self.infoView setHidden:YES];
        [self.navigationController setNavigationBarHidden:YES animated:NO];
        self.mainView.backgroundColor = [UIColor darkGrayColor];
        self.view.backgroundColor = [UIColor darkGrayColor];//status bar
        flag = 1;
        
    }
    else {
        //show
        [self.infoView setHidden:NO];
        [self.navigationController setNavigationBarHidden:NO animated:NO];
        self.mainView.backgroundColor = [UIColor whiteColor];
        flag = 0;
    }
    
}


- (void) statusBarClear {
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = [UIColor clearColor];
        statusBar.tintColor = [UIColor redColor];
    }
}


-(BOOL)prefersStatusBarHidden {
    return NO; // 0 - on  // 1 - off
}
@end

