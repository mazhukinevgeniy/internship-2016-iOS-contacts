//
//  PrimaryViewController.h
//  contacts
//
//  Created by Admin on 02/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CallController.h"
#import "DataStorage.h"

@interface PrimaryViewController : UITabBarController

@end

@protocol InitializedWithPrimaryVC

- (void) useDataStorage:(DataStorage*)storage andCallController:(CallController*)callController;

@end
