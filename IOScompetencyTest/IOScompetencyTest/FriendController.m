//
//  FriendController.m
//  IOScompetencyTest
//
//  Created by Ethan Hess on 3/26/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "FriendController.h"

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
    
    
    
}

@end
