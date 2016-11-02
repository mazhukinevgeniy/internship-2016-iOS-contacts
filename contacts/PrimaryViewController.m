//
//  PrimaryViewController.m
//  contacts
//
//  Created by Admin on 02/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import "PrimaryViewController.h"
#import "ContactStorage.h"

@interface PrimaryViewController ()

@end

@implementation PrimaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ContactStorage * storage = [[ContactStorage alloc] init];
    //TODO: add some contacts
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
