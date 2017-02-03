//
//  User.h
//  twitter
//
//  Created by William Thai on 2/2/17.
//  Copyright © 2017 Y.CORP.YAHOO.COM\willthai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *screenName;

- (id)initWithDictionary:(NSDictionary *)dictionary;
@end
