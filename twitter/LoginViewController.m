//
//  LoginViewController.m
//  
//
//  Created by William Thai on 1/30/17.
//
//

#import "LoginViewController.h"
#import "NavManager.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onLogoutClick:(id)sender {
    [[NavManager shared] logOut];
}

@end
