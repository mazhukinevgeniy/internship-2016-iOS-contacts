//
//  AlertFactory.h
//  contacts
//
//  Created by Admin on 13/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface AlertFactory : NSObject

+ (UIAlertAction*) simpleAction:(NSString*)title;

+ (UIAlertController*) alertWithTitle:(NSString*)title andMessage:(NSString*)message;

+ (UIAlertController*) confirmationAlertWithMessage:(NSString*)message
                                     customResponse:(NSString*)response
                                 andResponseHandler:(void (^)(UIAlertAction * action))handler;

@end
