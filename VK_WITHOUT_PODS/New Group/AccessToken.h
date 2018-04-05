//
//  AccessToken.h
//  VK_WITHOUT_PODS
//
//  Created by Victor on 28.03.2018.
//  Copyright © 2018 Victor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccessToken : NSObject
@property(strong,nonatomic) NSString* token;
@property(strong,nonatomic) NSDate* expirationDate;
@property(strong,nonatomic) NSString* userID;
@end
