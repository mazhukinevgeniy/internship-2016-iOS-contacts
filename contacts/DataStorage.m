//
//  ContactStorage.m
//  contacts
//
//  Created by Admin on 02/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DataStorage.h"
#import "CoreDataKeys.h"

@interface DataStorage()

@property (strong) NSMutableArray* contacts;
@property (strong) NSMutableArray* calls;
@property (strong) NSPersistentContainer* persistentContainer;

@end

@implementation DataStorage

- (DataStorage*) initWithPersistentContainer:(NSPersistentContainer*)container {
    if ( self = [super init] ) {
        _persistentContainer = container;
        
        NSManagedObjectContext *context = _persistentContainer.viewContext;
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:CONTACT_ENTITY];
        
        NSError *error = nil;
        NSArray *results = [context executeFetchRequest:request error:&error];
        if (!results) {
            NSLog(@"Error fetching Contact objects: %@\n%@", [error localizedDescription], [error userInfo]);
            
            _contacts = [[NSMutableArray alloc] init];
        } else {
            _contacts = [[NSMutableArray alloc] initWithCapacity:[results count] + 10];
            
            for (NSManagedObject* contact in results) {
                [_contacts addObject:[Contact initWithFirstName:[contact valueForKey:FIRST_NAME_KEY]
                                                       lastName:[contact valueForKey:LAST_NAME_KEY]
                                                         number:[contact valueForKey:NUMBER_KEY]]];
                
                //TODO: create method like initWithManagedObject:(NSManagedObject*)contact
            }
        }
        
        _calls = [[NSMutableArray alloc] init];
        
        return self;
    }
    else
        return nil;
}
+ (DataStorage*) initWithPersistentContainer:(NSPersistentContainer*)container {
    return [[DataStorage alloc] initWithPersistentContainer:container];
}

#pragma mark - contacts

- (void) addContact:(Contact*)contact {
    assert(contact != nil);
    
    NSManagedObjectContext * context = _persistentContainer.viewContext;
    NSManagedObject *coreDataContact = [NSEntityDescription insertNewObjectForEntityForName:CONTACT_ENTITY
                                                                     inManagedObjectContext:context];
    [coreDataContact setValue:contact.number forKey:NUMBER_KEY];
    [coreDataContact setValue:contact.firstName forKey:FIRST_NAME_KEY];
    [coreDataContact setValue:contact.lastName forKey:LAST_NAME_KEY];
    
    NSError *error = nil;
    if ([context save:&error] == NO) {
        NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
    }
    
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
