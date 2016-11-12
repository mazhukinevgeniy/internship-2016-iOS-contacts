//
//  CallController.m
//  contacts
//
//  Created by Admin on 12/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import "CallController.h"

@interface CallController()

@property (strong) DataStorage * storage;

@end

@implementation CallController


- (CallController*) initWithStorage:(DataStorage*)storage {
    if (self = [super init]) {
        _storage = storage;
        
        return self;
    } else {
        return nil;
    }
}
+ (CallController*) initWithStorage:(DataStorage*)storage {
    return [[CallController alloc] initWithStorage:storage];
}

- (UIAlertController*) getCallAlertForContact:(CDContact*)contact {
    NSString * title = [NSString stringWithFormat:@"Calling %@", [contact fullName]];
    
    UIAlertController* callAlert =
        [UIAlertController alertControllerWithTitle:title
                                            message:@""
                                     preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction =
        [UIAlertAction actionWithTitle:@"End call"
                                 style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                   [_storage addCallWithDate:[NSDate date] andTarget:contact];
                               }];
    
    [callAlert addAction:defaultAction];
    return callAlert;
}

@end
