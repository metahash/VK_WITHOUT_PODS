//
//  NetManager.h
//  VK_WITHOUT_PODS
//
//  Created by Victor on 28.03.2018.
//  Copyright © 2018 Victor. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Auth;
@interface NetManager : NSObject
@property(strong,nonatomic,readonly) Auth* currentUser;
+ (NetManager*) sharedManager;
- (void) authorizeUser:(void(^)(Auth* user)) completion;

+ (instancetype)sharedInstance;
- (void)loadRequestWithPath:(NSString*)path completion:(void(^)(id data, NSError *error))completion;

@end
