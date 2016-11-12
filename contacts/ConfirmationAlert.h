//
//  ConfirmationAlert.h
//  contacts
//
//  Created by Admin on 12/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfirmationAlert : NSObject

+ (UIAlertController*) getAlertWithMessage:(NSString*)message
                            customResponse:(NSString*)response
                  andCustomResponseHandler:(void (^)(UIAlertAction * action))handler;

@end
