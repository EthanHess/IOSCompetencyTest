//
//  FriendDetailViewController.m
//  IOScompetencyTest
//
//  Created by Ethan Hess on 3/27/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "FriendDetailViewController.h"
#import "FriendController.h"

@interface FriendDetailViewController ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *bioLabel;
@property (nonatomic, strong) UILabel *phoneLabel;
@property (nonatomic, strong) UILabel *addressLabel;
@property (nonatomic, strong) UIImage *profilePicture;

@end

@implementation FriendDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.nameLabel = [[UILabel alloc] init];
    self.phoneLabel = [[UILabel alloc] init];
    
    self.addressLabel = [[UILabel alloc] init];
    self.addressLabel.numberOfLines = 0;
    
    self.bioLabel = [[UILabel alloc] init];
    self.bioLabel.numberOfLines = 0;
    
    [[FriendController sharedInstance] retrieveFriendDetailWithCompletion:^(NSDictionary *dictionary) {
        self.nameLabel.text = [NSString stringWithFormat:@"%@ %@", dictionary[@"first_name"], dictionary[@"last_name"]];
        
        self.phoneLabel.text = dictionary[@"phone"];
        
        self.addressLabel.text = [NSString stringWithFormat:@"%@, %@", dictionary[@"address"], dictionary[@"city"]];
        
        self.bioLabel.text = dictionary[@"bio"];
                               
                               
                            
        }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
