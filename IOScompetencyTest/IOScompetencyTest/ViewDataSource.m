//
//  ViewDataSource.m
//  IOScompetencyTest
//
//  Created by Ethan Hess on 3/26/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "ViewDataSource.h"
#import "FriendController.h"
#import "UIImageView+AFNetworking.h"

static NSString *const cellID = @"cellID";

@implementation ViewDataSource

- (void)registerTableView:(UITableView *)tableView {
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[FriendController sharedInstance].resultFriends count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    
    NSDictionary *friend = [FriendController sharedInstance].resultFriends[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", friend[@"first_name"], friend[@"last_name"]];
    cell.detailTextLabel.text = friend[@"status"];
    
    NSString *imageUrl = friend[@"img"];
    NSLog(@"%@", friend[@"img"]);
    [cell.imageView setImageWithURL:[NSURL URLWithString:imageUrl]];
    
    UIView *availability = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    availability.layer.cornerRadius = 10;
    availability.layer.borderWidth = 2;
    
    if ([friend[@"available"] boolValue] == YES) {
        availability.backgroundColor = [UIColor redColor];
        availability.layer.borderColor = [UIColor redColor].CGColor;
    } else {
        availability.backgroundColor = [UIColor blueColor];
        availability.layer.borderColor = [UIColor blueColor].CGColor;
    }
    
    cell.accessoryView = availability;
    
    
    return cell;
}

@end
