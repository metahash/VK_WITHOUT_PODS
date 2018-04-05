//
//  DetailModel.m
//  VK_WITHOUT_PODS
//
//  Created by Victor on 28.03.2018.
//  Copyright © 2018 Victor. All rights reserved.
//

#import "DetailModel.h"

@interface DetailModel()
@property(nonatomic,strong)NSString * data;
@end

@implementation DetailModel

- (id)initWithResponse:(NSArray *)responseObject{
    self = [super init];
    if (self) {
        
        id first_name = [responseObject valueForKey:@"first_name"];
        id last_name = [responseObject valueForKey:@"last_name"];
        id bdate = [responseObject valueForKey:@"bdate"];
        id userID = [responseObject valueForKey:@"id"];
        id city = [responseObject valueForKey:@"city"];
        id cityName  = [city valueForKey:@"title"];
        id country = [responseObject valueForKey:@"country"];
        id countryName  = [country valueForKey:@"title"];
        id url = [responseObject valueForKey:@"photo_200_orig"];
        
        NSString *fullName = [NSString stringWithFormat:
                              @"   %@ %@  %@", first_name,last_name,bdate];
        NSString * location = [NSString stringWithFormat:
                               @"   %@ , %@", cityName,countryName];
        NSString * idUser = [NSString stringWithFormat:
                             @"   id: %@", userID];
        
        self.userFullName = fullName;
        self.userLocation = location;
        self.userId = idUser;
        self.userImageURL = url;
        
    }
    return self;
}
@end
