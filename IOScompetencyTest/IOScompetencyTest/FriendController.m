//
//  FriendController.m
//  IOScompetencyTest
//
//  Created by Ethan Hess on 3/26/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "FriendController.h"
#import "NetworkController.h"
#import "AFNetworking.h"

@implementation FriendController

+ (FriendController *)sharedInstance {
    static FriendController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [FriendController new];
    });
    
    return sharedInstance;
    
}

- (void)retrieveFriendsWithCompletion:(void (^)(NSArray *))completion {
    
    NSString *path = @"friends";
    
    [[NetworkController api] GET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        self.resultFriends = responseObject;
        completion(self.resultFriends);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@", error);
        completion(nil);
    }];
    
}

@end
