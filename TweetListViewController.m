//
//  TweetListViewController.m
//  twitter
//
//  Created by William Thai on 1/30/17.
//  Copyright © 2017 Y.CORP.YAHOO.COM\willthai. All rights reserved.
//

#import "TweetListViewController.h"
#import "NavManager.h"
#import "TwitterClient.h"
#import "User.h"

@interface TweetListViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation TweetListViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    self.tableView.dataSource = self;
    [[TwitterClient sharedInstance] login:^(User *user, NSError *error) {
        [self completedLogin:user];
    }];
    // Do any additional setup after loading the view from its nib.
}

- (void) completedLogin:(User *) user {
    NSLog(@"completed Login, refresh views");
    [self.tableView reloadData];
}
     
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    User *curUser = [TwitterClient sharedInstance].currentUser;
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    [cell.textLabel setText:curUser.name];
    
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
