//
//  NetManager.m
//  VK_WITHOUT_PODS
//
//  Created by Victor on 28.03.2018.
//  Copyright © 2018 Victor. All rights reserved.
//

#import "NetManager.h"
#import "LoginWebViewController.h"
#import "AccessToken.h"

@interface NetManager ()

@property(strong,nonatomic) AccessToken* accessToken;

@property(nonatomic,strong) NSURLSession* session;

@end


@implementation NetManager

///PART 1 -- AUTH & LOGIN
+ (NetManager*) sharedManager{
    static NetManager* manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[NetManager alloc]init];
    });
    return manager;
}


- (void) authorizeUser:(void(^)(Auth* user)) completion {
    LoginWebViewController * vc =
    [[LoginWebViewController alloc]initWithCompletionBlock:^(AccessToken *token) {
        self.accessToken = token;
        if(completion) {
            completion(nil);
        }
    }];
    UINavigationController* nav = [[UINavigationController alloc]initWithRootViewController:vc];
    
    UIViewController* mainVC =
    [[[[UIApplication sharedApplication] windows]firstObject]rootViewController];
    [mainVC presentViewController:nav animated:YES completion:nil];
}


///PART 2 --- FRIENDS_REQ
@synthesize session = _session;
- (instancetype)initSingleton
{
    self = [super init];
    if (!self) {
        return nil;
    }
    return self;
}

+ (instancetype)sharedInstance
{
    static id _singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _singleton = [[self alloc]initSingleton];
    });
    return _singleton;
}

- (NSURLSession *) session {
    if (!_session) {
        _session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    }
    return _session;
}

- (void)loadRequestWithPath:(NSString *)path completion:(void (^)(id data, NSError* error))completion {
    NSURL *url = [NSURL URLWithString:path];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"GET";
    [[self.session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil,error);
            });
        }
        else {
            id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(json, nil);
            });
        }
    }] resume];
}


@end

