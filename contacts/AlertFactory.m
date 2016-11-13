//
//  AlertFactory.m
//  contacts
//
//  Created by Admin on 13/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import "AlertFactory.h"

@implementation AlertFactory

+ (UIAlertAction*) simpleAction:(NSString*)title {
    return [UIAlertAction actionWithTitle:title
                                    style:UIAlertActionStyleDefault
                                  handler:^(UIAlertAction * action) {}];
}

+ (UIAlertController*) alertWithTitle:(NSString*)title andMessage:(NSString*)message {
    return [UIAlertController alertControllerWithTitle:title
                                               message:message
                                        preferredStyle:UIAlertControllerStyleAlert];
}

+ (UIAlertController*) confirmationAlertWithMessage:(NSString*)message
                                     customResponse:(NSString*)response
                                 andResponseHandler:(void (^)(UIAlertAction * action))handler {
    UIAlertController * alert = [AlertFactory alertWithTitle:@"Confirmation"
                                                  andMessage:message];
    
    UIAlertAction* action = [UIAlertAction actionWithTitle:response
                                                     style:UIAlertActionStyleDefault
                                                   handler:handler];
    
    [alert addAction:[AlertFactory simpleAction:@"Cancel"]];
    [alert addAction:action];
    
    return alert;
}


@end
