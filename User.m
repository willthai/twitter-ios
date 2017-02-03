//
//  User.m
//  twitter
//
//  Created by William Thai on 2/2/17.
//  Copyright © 2017 Y.CORP.YAHOO.COM\willthai. All rights reserved.
//

#import "User.h"

@implementation User : NSObject
- (id) initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = dictionary[@"name"];
        self.screenName = dictionary[@"screenName"];
    }

    return self;
}
@end
