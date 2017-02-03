//
//  TwitterClient.h
//  twitter
//
//  Created by William Thai on 2/2/17.
//  Copyright © 2017 Y.CORP.YAHOO.COM\willthai. All rights reserved.
//

//#import <BDBOAuth1Manager/BDBOAuth1Manager.h>
//#import <BDBOAuth1Manager/NSDictionary+BDBOAuth1Manager.h>
#import <BDBOAuth1Manager/BDBOAuth1SessionManager.h>
#import "User.h"

@interface TwitterClient : BDBOAuth1SessionManager
@property (nonatomic, strong) User *currentUser;

+ (TwitterClient *) sharedInstance;
- (void) login:(void (^)(User *user, NSError *error))callback;
- (void) handleAppOpenUrl:(NSURL *) openUrl;
@end
