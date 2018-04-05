//
//  LoadingTableViewCell.m
//  VK_WITHOUT_PODS
//
//  Created by Victor on 28.03.2018.
//  Copyright © 2018 Victor. All rights reserved.
//

#import "LoadingTableViewCell.h"

@implementation LoadingTableViewCell

//ActivityIndicator

- (void) prepareForReuse {
    [super prepareForReuse];
    UIActivityIndicatorView* indicator =
    (UIActivityIndicatorView*)[self viewWithTag:1];
    [indicator startAnimating];
}


@end
