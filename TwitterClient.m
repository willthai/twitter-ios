//
//  TwitterClient.m
//  twitter
//
//  Created by William Thai on 2/2/17.
//  Copyright © 2017 Y.CORP.YAHOO.COM\willthai. All rights reserved.
//

#import "TwitterClient.h"

NSString * const kTwitterConsumerKey = @"GSaQdYEzBZ94pNfjO8D2wDu57";
NSString * const kTwitterConsumerSecret = @"LUlISFueczow3IWTQAtOD33M1ONR0XlpEFTAFR1KLK8yZGufFl";
NSString * const kTwitterBaseUrl = @"https://api.twitter.com";
NSString * const kOAuthReqTokenPath = @"oauth/request_token";
NSString * const kOAuthAccessTokenPath = @"oauth/access_token";
NSString * const kCallbackUrl = @"twitterauth://request";
NSString * const kOAuthAthorizeUrl = @"https://api.twitter.com/oauth/authorize?oauth_token=";
NSString * const kVerifyCredPath = @"1.1/account/verify_credentials.json";

@implementation TwitterClient
+ (TwitterClient *) sharedInstance {
    static TwitterClient *instance = nil;
    static dispatch_once_t onceToken;

    if (instance == nil) {
        dispatch_once(&onceToken, ^{
            instance = [[TwitterClient alloc] initWithBaseURL:[NSURL URLWithString:kTwitterBaseUrl] consumerKey:kTwitterConsumerKey consumerSecret:kTwitterConsumerSecret];
        });
    }
    return instance;
}
- (void) login {
    [[self requestSerializer] removeAccessToken];
    [self fetchRequestTokenWithPath:kOAuthReqTokenPath method:@"GET" callbackURL:[NSURL URLWithString:kCallbackUrl] scope:nil success:^(BDBOAuth1Credential *requestToken) {
        NSLog(@"got token");
        
        NSURL *authUrl = [NSURL URLWithString:[kOAuthAthorizeUrl stringByAppendingString:requestToken.token]];
        
        NSDictionary *options = [[NSDictionary alloc] init];
        [[UIApplication sharedApplication] openURL:authUrl options:options completionHandler:^(BOOL success) {
            if (!success) {
                NSLog(@"Failed to open url: %@", authUrl);
            }
        }];
        
    } failure:^(NSError *error) {
        NSLog(@"Error: %@", error);
        NSLog(@"failed to get request token");
    }];
}

- (void) handleAppOpenUrl:(NSURL *) openUrl {
    [self fetchAccessTokenWithPath:kOAuthAccessTokenPath method:@"POST" requestToken:[BDBOAuth1Credential credentialWithQueryString:openUrl.query] success:^(BDBOAuth1Credential *accessToken) {
        NSLog(@"Got access token");
        [self.requestSerializer saveAccessToken:accessToken];
        [self GET:kVerifyCredPath parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *user = [[NSDictionary alloc] initWithDictionary:responseObject];
            NSLog(@"user:%@", user[@"name"]);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"failed to verify credentials");
        }];
    } failure:^(NSError *error) {
        NSLog(@"failed to get access token");
    }];
}
@end
