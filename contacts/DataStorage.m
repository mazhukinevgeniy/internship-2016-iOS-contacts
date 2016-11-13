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

@property (strong) NSPersistentContainer* persistentContainer;

@property (strong) NSMutableArray * activeContactFetchers;
@property (strong) NSMutableArray * activeCallFetchers;

- (void) updateFetchers:(NSMutableArray*)fetchers;
- (void) saveContext:(NSManagedObjectContext*)context;

- (NSFetchedResultsController*) generateFRCWithRequest:(NSFetchRequest*)request andCacheName:(NSString*)cacheName andAddItTo:(NSMutableArray*)array;

@end

@implementation DataStorage

- (DataStorage*) initWithPersistentContainer:(NSPersistentContainer*)container {
    if ( self = [super init] ) {
        _persistentContainer = container;
        
        _activeContactFetchers = [[NSMutableArray alloc] init];
        _activeCallFetchers = [[NSMutableArray alloc] init];
        
        return self;
    }
    else
        return nil;
}
+ (DataStorage*) initWithPersistentContainer:(NSPersistentContainer*)container {
    return [[DataStorage alloc] initWithPersistentContainer:container];
}


- (void) saveContext:(NSManagedObjectContext*)context {
    NSError *error = nil;
    if (![context save:&error]) {
        NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
    }
}

- (void) updateFetchers:(NSMutableArray*)fetchers {
    NSError * error = nil;
    for (NSFetchedResultsController * frc in fetchers) {
        if (![frc performFetch:&error]) {
            NSLog(@"Fetched results controller can't fetch: %@\n%@", [error localizedDescription], [error userInfo]);
        }
    }
}

- (void) addCallWithDate:(NSDate*)date
               andTarget:(CDContact*)contact {
    assert(date != nil);
    assert(contact != nil);
    
    //TODO: validate all parameters
    
    NSManagedObjectContext * context = _persistentContainer.viewContext;
    CDCall *coreDataCall = [NSEntityDescription insertNewObjectForEntityForName:CALL_ENTITY
                                                         inManagedObjectContext:context];
    [coreDataCall setValue:date forKey:DATE_KEY];
    [coreDataCall setValue:contact forKey:CONTACT_KEY];
    
    [self saveContext:context];
    [self updateFetchers:_activeCallFetchers];
}

- (void) deleteCall:(CDCall*)call {
    assert (call != nil);
    
    CDContact * target = call.contact;
    NSUInteger oldCallCount = target.hidden ? [target.calls count] : 0;
    //don't evaluate target.calls if it's not needed
    
    NSManagedObjectContext * context = _persistentContainer.viewContext;
    [context deleteObject:call];
    
    if (oldCallCount == 1) {
        [context deleteObject:target];
        [self saveContext:context];
        [self updateFetchers:_activeContactFetchers];
    } else {
        [self saveContext:context];
    }
    
    [self updateFetchers:_activeCallFetchers];
}

#pragma mark - Fetched Results Controller generation

- (NSFetchedResultsController*) generateFRCWithRequest:(NSFetchRequest*)request
                                          andCacheName:(NSString*)cacheName
                                            andAddItTo:(NSMutableArray*)array{
    NSManagedObjectContext *context = _persistentContainer.viewContext;
    
    NSFetchedResultsController * fetchedResults =
        [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                            managedObjectContext:context
                                              sectionNameKeyPath:nil
                                                       cacheName:cacheName];
    
    NSError *error = nil;
    if (![fetchedResults performFetch:&error]) {
        NSLog(@"Failed to initialize FetchedResultsController: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    } else {
        [array addObject:fetchedResults];
        return fetchedResults;
    }
}

- (NSFetchedResultsController*) generateFetchedResultsControllerForContacts {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:CONTACT_ENTITY];
    
    NSSortDescriptor *lastNameSort = [NSSortDescriptor sortDescriptorWithKey:LAST_NAME_KEY ascending:YES];
    NSSortDescriptor *firstNameSort = [NSSortDescriptor sortDescriptorWithKey:FIRST_NAME_KEY ascending:YES];
    [request setSortDescriptors:@[lastNameSort, firstNameSort]];
    
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"%K == %@", HIDDEN_KEY, [NSNumber numberWithBool:NO]];
    [request setPredicate:predicate];
    
    return [self generateFRCWithRequest:request andCacheName:@"contactsCache" andAddItTo:_activeContactFetchers];
}

- (NSFetchedResultsController*) generateFetchedResultsControllerForCalls {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:CALL_ENTITY];
    
    NSSortDescriptor *dateSort = [NSSortDescriptor sortDescriptorWithKey:DATE_KEY ascending:NO];
    [request setSortDescriptors:@[dateSort]];
    
    return [self generateFRCWithRequest:request andCacheName:@"callsCache" andAddItTo:_activeCallFetchers];
}

#pragma mark - ContactManager methods

- (void) addContactWithFirstName:(nonnull NSString*)fName
                        lastName:(nonnull NSString*)lName
                          number:(nonnull NSString*)phoneNumber {
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
    [coreDataContact setValue:[NSNumber numberWithBool:NO] forKey:HIDDEN_KEY];
    
    [self saveContext:context];
    [self updateFetchers:_activeContactFetchers];
}

- (void) saveChangesToContact:(nonnull CDContact*)contact {
    if (contact.managedObjectContext == nil) {
        NSLog(@"Context is invalid, that shouldn't be the case; contact %@", [contact toString]);
    } else if ([contact hasChanges]) {
        [self saveContext:contact.managedObjectContext];
        [self updateFetchers:_activeContactFetchers];
    }
}

- (void) deleteContact:(nonnull CDContact*)contact {
    NSManagedObjectContext * context = _persistentContainer.viewContext;
    
    if ([contact.calls count] == 0) {
        [context deleteObject:contact];
    } else {
        [contact setValue:[NSNumber numberWithBool:YES] forKey:HIDDEN_KEY];
    }
    
    [self saveContext:context];
    [self updateFetchers:_activeContactFetchers];
}

@end
