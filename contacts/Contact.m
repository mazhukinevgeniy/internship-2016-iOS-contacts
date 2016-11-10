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

@end

@implementation Contact

-(Contact*) initWithFirstName:(NSString*)fName
            lastName:(NSString*)lName number:(NSString*)phoneNumber {
    assert([fName length] + [lName length] > 0);
    
    if (self = [super init]) {
        _firstName = fName;
        _lastName = lName;
        _number = phoneNumber;
        
        return self;
    }
    else
        return nil;
}
+(Contact*) initWithFirstName:(NSString*)fName
            lastName:(NSString*)lName number:(NSString*)phoneNumber {
    return [[Contact alloc] initWithFirstName:fName lastName:lName number:phoneNumber];
}


-(NSString*) fullName {
    if ([_firstName length] == 0)
        return _lastName;
    else if ([_lastName length] == 0)
        return _firstName;
    else
        return [NSString stringWithFormat:@"%@ %@", _firstName, _lastName];
}

-(NSString*) toString {
    return [NSString stringWithFormat:@"%@ %@", [self fullName], _number];
}

@end
