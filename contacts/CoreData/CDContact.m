//
//  CDContact.m
//  contacts
//
//  Created by Admin on 10/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import "CDContact.h"

@implementation CDContact

@dynamic firstName;
@dynamic lastName;
@dynamic number;
@dynamic calls;
@dynamic hidden;

-(NSString*) fullName {
    if ([[self firstName] length] == 0)
        return [self lastName];
    else if ([[self lastName] length] == 0)
        return [self firstName];
    else
        return [NSString stringWithFormat:@"%@ %@", [self firstName], [self lastName]];
}

-(NSString*) toString {
    return [NSString stringWithFormat:@"%@ %@", [self fullName], [self number]];
}

@end
