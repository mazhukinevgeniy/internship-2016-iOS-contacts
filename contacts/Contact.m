//
//  Contact.m
//  contacts
//
//  Created by Admin on 02/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Contact.h"

@interface Contact()

@property (readwrite) int identifier;
@property (readwrite) NSString *firstName;
@property (readwrite) NSString *lastName;
@property (readwrite) NSString *number;

@end

@implementation Contact

-(Contact*) initWith:(int)identifier firstName:(NSString*)fName
            lastName:(NSString*)lName number:(NSString*)phoneNumber {
    assert([fName length] + [lName length] > 0);
    
    if (self = [super init]) {
        self.identifier = identifier;
        self.firstName = fName;
        self.lastName = lName;
        self.number = phoneNumber;
        
        return self;
    }
    else
        return nil;
}
+(Contact*) initWith:(int)identifier firstName:(NSString*)fName
            lastName:(NSString*)lName number:(NSString*)phoneNumber {
    return [[Contact alloc] initWith:identifier firstName:fName lastName:lName number:phoneNumber];
}

-(NSString*) toString {
    if ([_firstName length] == 0)
        return [NSString stringWithFormat:@"%@ %@", _lastName, _number];
    else if ([_lastName length] == 0)
        return [NSString stringWithFormat:@"%@ %@", _firstName, _number];
    else
        return [NSString stringWithFormat:@"%@ %@ %@", _firstName, _lastName, _number];
}

@end
