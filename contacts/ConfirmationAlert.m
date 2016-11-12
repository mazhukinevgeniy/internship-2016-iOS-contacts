//
//  ConfirmationAlert.m
//  contacts
//
//  Created by Admin on 12/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import "ConfirmationAlert.h"

@interface ConfirmationAlert ()

@end

@implementation ConfirmationAlert

+ (UIAlertController*) getAlertWithMessage:(NSString*)message
                            customResponse:(NSString*)response
                  andCustomResponseHandler:(void (^)(UIAlertAction * action))handler {
    UIAlertController * alert =
        [UIAlertController alertControllerWithTitle:@"Confirmation"
                                            message:message
                                     preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * action) {}];
    UIAlertAction* action = [UIAlertAction actionWithTitle:response
                                                     style:UIAlertActionStyleDefault
                                                   handler:handler];
    
    [alert addAction:cancel];
    [alert addAction:action];
    
    return alert;
}

@end
