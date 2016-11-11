//
//  ContactStorage.m
//  contacts
//
//  Created by Admin on 02/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CDContact.h"
#import "CoreDataKeys.h"
#import "DataStorage.h"

@interface DataStorage()

@property (strong) NSMutableArray* calls;
@property (strong) NSPersistentContainer* persistentContainer;

@property (strong) NSFetchedResultsController * fetchedContacts;

@end

@implementation DataStorage

- (DataStorage*) initWithPersistentContainer:(NSPersistentContainer*)container {
    if ( self = [super init] ) {
        _persistentContainer = container;
        
        NSManagedObjectContext *context = _persistentContainer.viewContext;
        
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:CONTACT_ENTITY];
        NSSortDescriptor *lastNameSort = [NSSortDescriptor sortDescriptorWithKey:LAST_NAME_KEY ascending:YES];
        NSSortDescriptor *firstNameSort = [NSSortDescriptor sortDescriptorWithKey:FIRST_NAME_KEY ascending:YES];
        [request setSortDescriptors:@[lastNameSort, firstNameSort]];
        
        _fetchedContacts = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:context sectionNameKeyPath:nil cacheName:@"contactsCache"];
        //TODO: check who needs to be the delegate
        
        NSError *error = nil;
        if (![_fetchedContacts performFetch:&error]) {
            NSLog(@"Failed to initialize FetchedResultsController: %@\n%@", [error localizedDescription], [error userInfo]);
            abort();
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

- (void) addContactWithFirstName:(NSString*)fName
                        lastName:(NSString*)lName
                          number:(NSString*)phoneNumber {
    assert(fName != nil);
    assert(lName != nil);
    assert(phoneNumber != nil);
    
    //TODO: validate all parameters
    
    NSManagedObjectContext * context = _persistentContainer.viewContext;
    CDContact *coreDataContact = [NSEntityDescription insertNewObjectForEntityForName:CONTACT_ENTITY
                                                               inManagedObjectContext:context];
    [coreDataContact setValue:phoneNumber forKey:NUMBER_KEY];
    [coreDataContact setValue:fName forKey:FIRST_NAME_KEY];
    [coreDataContact setValue:lName forKey:LAST_NAME_KEY];
    
    NSError *error = nil;
    if (![context save:&error]) {
        NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
    } else if (![_fetchedContacts performFetch:&error]) {
        NSLog(@"Failed to fetch contacts: %@\n%@", [error localizedDescription], [error userInfo]);
    }
}

- (NSInteger) numberOfContactSections {
    return [[_fetchedContacts sections] count];
}

- (NSInteger) numberOfContactsInSection:(NSInteger)section {
    id<NSFetchedResultsSectionInfo> sectionInfo = [_fetchedContacts sections][section];
    return [sectionInfo numberOfObjects];
}

- (CDContact*) contactAtIndexPath:(NSIndexPath*)indexPath {
    return [_fetchedContacts objectAtIndexPath:indexPath];
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

- (NSInteger) getNumberOfCalls {
    return [_calls count];
}

@end
