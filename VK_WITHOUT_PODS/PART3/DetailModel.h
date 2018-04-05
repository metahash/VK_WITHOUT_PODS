//
//  DetailModel.h
//  VK_WITHOUT_PODS
//
//  Created by Victor on 28.03.2018.
//  Copyright © 2018 Victor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailModel : NSObject

@property(nonatomic,strong) NSString *userFullName;
@property(nonatomic,strong) NSString *userId;
@property(nonatomic,strong) NSString *userImageURL;
@property(nonatomic,strong) NSString *userLocation;

- (id)initWithResponse:(NSArray *)responseObject;

@end
