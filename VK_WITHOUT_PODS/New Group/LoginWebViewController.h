//
//  LoginWebViewController.h
//  VK_WITHOUT_PODS
//
//  Created by Victor on 28.03.2018.
//  Copyright © 2018 Victor. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AccessToken;

typedef void(^LoginCompletionBlock)(AccessToken* token);

@interface LoginWebViewController : UIViewController

- (id)initWithCompletionBlock:(LoginCompletionBlock)completion;

@end
