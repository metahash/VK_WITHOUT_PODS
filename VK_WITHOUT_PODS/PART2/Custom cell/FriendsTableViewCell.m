//
//  FriendsTableViewCell.m
//  VK_WITHOUT_PODS
//
//  Created by Victor on 28.03.2018.
//  Copyright © 2018 Victor. All rights reserved.
//

#import "FriendsTableViewCell.h"
#import "FriendsModel.h"

@interface FriendsTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *friendsImage;
@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;
@end

@implementation FriendsTableViewCell

- (void)setModel:(id)model {
    
    _model = model;
    
    // simple KVC
    
    self.firstNameLabel.text = [model valueForKeyPath:@"first_name"];
    self.lastNameLabel.text = [model valueForKeyPath:@"last_name"];
    
    NSURL *url = [NSURL URLWithString:[model valueForKeyPath:@"photo_50"]];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    UIImage *tmpImage = [[UIImage alloc] initWithData:data];
    self.friendsImage.image = tmpImage;
    
}

@end
