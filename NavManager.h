//
//  NavManager.h
//  twitter
//
//  Created by William Thai on 2/2/17.
//  Copyright © 2017 Y.CORP.YAHOO.COM\willthai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NavManager : NSObject

+ (instancetype) shared;

- (UIViewController *)rootViewController;

- (void)logIn;
- (void)logOut;
@end
