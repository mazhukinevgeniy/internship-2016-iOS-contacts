//
//  PrimaryViewController.m
//  contacts
//
//  Created by Admin on 02/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import "AppDelegate.h"
#import "PrimaryViewController.h"

@interface PrimaryViewController()

@end



@implementation PrimaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSPersistentContainer * container = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).persistentContainer;
    DataStorage * storage = [DataStorage initWithPersistentContainer:container];
    CallController * callController = [CallController initWithStorage:storage];
    
    for (NSObject<InitializedWithPrimaryVC>* controller in [self viewControllers]) {
        [controller useDataStorage:storage andCallController:callController];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
