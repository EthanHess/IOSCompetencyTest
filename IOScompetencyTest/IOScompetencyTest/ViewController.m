//
//  ViewController.m
//  IOScompetencyTest
//
//  Created by Ethan Hess on 3/26/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "ViewController.h"
#import "ViewDataSource.h"
#import "FriendController.h"
#import "FriendDetailViewController.h"

@interface ViewController () <UITableViewDelegate>

@property (nonatomic, strong) ViewDataSource *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [ViewDataSource new];
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.delegate = self;
    
    [self.dataSource registerTableView:self.tableView];
    self.tableView.dataSource = self.dataSource;
    
    [self.view addSubview:self.tableView];
    
    [[FriendController sharedInstance] retrieveFriendsWithCompletion:^(NSArray *friends) {
        [self.tableView reloadData];
    
    }];
        
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FriendDetailViewController *detailViewController = [FriendDetailViewController new];
    [self.navigationController pushViewController:detailViewController animated:YES];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100; 
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
