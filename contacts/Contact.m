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
@property (readwrite) NSString *secondName;
@property (readwrite) NSString *number;

@end

@implementation Contact

-(Contact*) initWith:(int)identifier firstName:(NSString*)fName
      secondName:(NSString*)sName number:(NSString*)phoneNumber {
    self.identifier = identifier;
    self.firstName = fName;
    self.secondName = sName;
    self.number = phoneNumber;
    
    return self;
}
+(Contact*) initWith:(int)identifier firstName:(NSString*)fName
          secondName:(NSString*)sName number:(NSString*)phoneNumber {
    return [[Contact alloc] initWith:identifier firstName:fName secondName:sName number:phoneNumber];
}

@end
