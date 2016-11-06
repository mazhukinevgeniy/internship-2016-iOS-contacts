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
@property (strong) NSMutableArray* calls;

@end

@implementation DataStorage

- (DataStorage*) init {
    if ( self = [super init] ) {
        _contacts = [[NSMutableArray alloc] init];
        _calls = [[NSMutableArray alloc] init];
        
        return self;
    }
    else
        return nil;
}
+ (DataStorage*) init {
    return [[DataStorage alloc] init];
}

#pragma mark - contacts

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

#pragma mark - calls

- (void) addCall:(Call *)call {
    assert(call != nil);
    
    [_calls addObject:call];
}

- (Call*) getCall:(long)position {
    assert(position >= 0);
    assert(position < [_calls count]);
    
    return _calls[position];
}

- (long) getNumberOfCalls {
    return [_calls count];
}

@end
