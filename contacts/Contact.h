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

@property (readonly) NSString *firstName;
@property (readonly) NSString *lastName;
@property (readonly) NSString *number;

-(Contact*) initWithFirstName:(NSString*)fName
            lastName:(NSString*)lName number:(NSString*)phoneNumber;
+(Contact*) initWithFirstName:(NSString*)fName
            lastName:(NSString*)lName number:(NSString*)phoneNumber;

-(NSString*) fullName;
-(NSString*) toString;

@end
