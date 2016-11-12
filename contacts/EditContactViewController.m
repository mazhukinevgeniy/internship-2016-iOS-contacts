//
//  EditContactViewController.m
//  contacts
//
//  Created by Admin on 11/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import "EditContactViewController.h"

@interface EditContactViewController ()

@property (weak) NSObject<ContactManager> * contactManager;

@end

@implementation EditContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setEditorWithContact:(nullable CDContact*)contact
            andContactManager:(nonnull NSObject<ContactManager>*)contactManager {
    _contactManager = contactManager;
    
    if (contact == nil) {
        [self setTitle:@"New contact"];
    } else {
        [self setTitle:@"Edit contact"];
        //TODO: set values of textfields
    }
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
