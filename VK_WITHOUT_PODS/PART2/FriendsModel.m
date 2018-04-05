//
//  FriendsModel.m
//  VK_WITHOUT_PODS
//
//  Created by Victor on 28.03.2018.
//  Copyright © 2018 Victor. All rights reserved.
//

#import "FriendsModel.h"
#import "NetManager.h"
@interface FriendsModel()

@end

@implementation FriendsModel

NSArray *dictArray;

- (NSString*)getFriendsURL:(NSInteger)cellCount {
    
    NSString *userID = [[NSUserDefaults standardUserDefaults] stringForKey:@"myID"];
    NSString *count =  [@(cellCount) stringValue];
    NSString *offset = @"0";
    
    NSString *urlPart1 =
    @"https://api.vk.com/method/friends.get?"
    "user_id=";
    NSString *urlPart2 =
    @"&"
    "name=order&"
    "count=";
    NSString *urlPart3 =
    @"&"
    "offset=";
    NSString *urlPart4 =
    @"&"
    "fields=photo_50,photo_200_orig,"
    "bdate,city,country,education,universities&"
    "name_case=nom&v=5.71";
    
    NSString *url = [NSString stringWithFormat: @"%@%@%@%@%@%@%@",
                     urlPart1, userID, urlPart2, count, urlPart3, offset, urlPart4];
    return url;
}

@end
