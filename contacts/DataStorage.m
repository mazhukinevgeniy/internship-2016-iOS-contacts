//
//  ContactStorage.m
//  contacts
//
//  Created by Admin on 02/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DataStorage.h"

@interface DataStorage()

@property (strong) NSMutableArray* contacts;

@end

@implementation DataStorage

- (DataStorage*) init {
    if ( self = [super init] ) {
        _contacts = [[NSMutableArray alloc] init];
        
        return self;
    }
    else
        return nil;
}
+ (DataStorage*) init {
    return [[DataStorage alloc] init];
}

- (void) addContact:(Contact*)contact {
    assert(contact != nil);
    
    [_contacts addObject:contact];
}

- (Contact*) getContact:(long)position {
    assert(position >= 0);
    assert(position < [_contacts count]);
    
    return _contacts[position];
}

- (long) getNumberOfContacts {
    return [_contacts count];
}

@end
