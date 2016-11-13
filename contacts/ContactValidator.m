//
//  ContactValidator.m
//  contacts
//
//  Created by Admin on 13/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import "ContactValidator.h"

@interface ContactValidator()

- (bool) validFirstName:(NSString*)firstName withLastName:(NSString*)lastName;
- (bool) validNumber:(NSString*)number;

@end

@implementation ContactValidator

- (bool) validFirstName:(NSString*)firstName withLastName:(NSString*)lastName {
    if ([firstName length] + [lastName length] == 0) {
        return NO;
    } else {
        return YES;
    }
}

- (bool) validNumber:(NSString*)number {
    NSSet * goodCharacters = [[NSSet alloc] initWithArray:
                              @[@'*', @'+', @'#', @'0',
                                 @'1', @'2', @'3', @'4',
                                 @'5', @'6', @'7', @'8',
                                 @'9']];
    
    bool isValid = YES;
    
    for (int i = 0; i < [number length] && isValid; i++) {
        NSNumber * nextChar = [NSNumber numberWithChar:[number characterAtIndex:i]];
        
        if (![goodCharacters containsObject: nextChar]) {
            isValid = NO;
        }
        
    }
    
    return isValid;
}

- (NSArray*) validateContactWithFirstName:(NSString*)fName
                                 lastName:(NSString*)lName
                                andNumber:(NSString*)number {
    int numberOfPossibleErrors = 3;
    NSMutableArray * errors = [[NSMutableArray alloc] initWithCapacity:numberOfPossibleErrors];
    
    if (![self validNumber:number]) {
        [errors addObject:[NSNumber numberWithInteger:WRONG_NUMBER]];
    }
    if (![self validFirstName:fName withLastName:lName]) {
        [errors addObject:[NSNumber numberWithInteger:WRONG_FIRSTNAME]];
        [errors addObject:[NSNumber numberWithInteger:WRONG_LASTNAME]];
    }
    
    return [[NSArray alloc] initWithArray:errors copyItems:YES];
}

@end
