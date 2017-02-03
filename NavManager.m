//
//  NavManager.m
//  twitter
//
//  Created by William Thai on 2/2/17.
//  Copyright © 2017 Y.CORP.YAHOO.COM\willthai. All rights reserved.
//

#import "NavManager.h"
#import "LoginViewController.h"
#import "LogoutViewController.h"
#import "TweetListViewController.h"

@interface NavManager()

@property (nonatomic, assign) BOOL isLoggedIn;
@property (nonatomic, strong) UINavigationController *navController;

@end

@implementation NavManager

+(instancetype)shared {
    static NavManager *instance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [[NavManager alloc] init];
    });
    
    return instance;
}
- (instancetype) init {
    self = [super init];
    
    if (self) {
        self.isLoggedIn = NO;
        
        UIViewController *root = self.isLoggedIn ? [self loggedInVC] : [self loggedOutVC];
        
        self.navController = [[UINavigationController alloc] init];
        self.navController.viewControllers = @[root];
        [self.navController setNavigationBarHidden:YES];
    }
    
    return self;
}

- (void) logIn {
    self.isLoggedIn = YES;
    NSArray *vc = @[[self loggedInVC]];
    
    [self.navController setViewControllers:vc];
}

- (void) logOut {
    self.isLoggedIn = NO;
    NSArray *vc = @[[self loggedOutVC]];
    
    [self.navController setViewControllers:vc];
}

- (UIViewController *) loggedInVC {
    TweetListViewController *vc = [[TweetListViewController alloc] initWithNibName:@"TweetListViewController" bundle:nil];

//    LoginViewController *vc = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    return vc;
}

- (UIViewController *) loggedOutVC {
    LogoutViewController *vc = [[LogoutViewController alloc] initWithNibName:@"LogoutViewController" bundle:nil];
    return vc;
}

- (UIViewController *)rootViewController {
    return self.navController;
}
@end
