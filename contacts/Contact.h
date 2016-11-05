//
//  Contact.h
//  contacts
//
//  Created by Admin on 02/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#ifndef Contact_h
#define Contact_h


#endif /* Contact_h */


@interface Contact : NSObject

@property (readonly, getter=getID) int identifier;
@property (readonly) NSString *firstName;
@property (readonly) NSString *lastName;
@property (readonly) NSString *number;

-(Contact*) initWith:(int)identifier firstName:(NSString*)fName
            lastName:(NSString*)lName number:(NSString*)phoneNumber;
+(Contact*) initWith:(int)identifier firstName:(NSString*)fName
            lastName:(NSString*)lName number:(NSString*)phoneNumber;

-(NSString*) toString;

@end
