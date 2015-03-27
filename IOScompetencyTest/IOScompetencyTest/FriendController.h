//
//  FriendController.h
//  IOScompetencyTest
//
//  Created by Ethan Hess on 3/26/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendController : NSObject

@property (nonatomic, strong) NSArray *resultFriends;
@property (nonatomic, strong) NSDictionary *friendInfo;

+ (FriendController *)sharedInstance;

- (void)retrieveFriendsWithCompletion:(void (^)(NSArray *))completion;


@end
