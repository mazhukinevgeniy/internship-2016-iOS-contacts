//
//  PrimaryViewController.m
//  contacts
//
//  Created by Admin on 02/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import "AppDelegate.h"
#import "EditContactViewController.h"
#import "SegueNames.h"
#import "PrimaryViewController.h"

@interface PrimaryViewController()

@property (strong) DataStorage * storage;
@property (weak, nonatomic) IBOutlet UIBarButtonItem * addContactButton;

@property (strong) UIColor * defaultTintColor;

@end



@implementation PrimaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSPersistentContainer * container = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).persistentContainer;
    _storage = [DataStorage initWithPersistentContainer:container];
    CallController * callController = [CallController initWithStorage:_storage];
    
    for (NSObject<InitializedWithPrimaryVC>* controller in [self viewControllers]) {
        [controller useDataStorage:_storage andCallController:callController];
    }
    
    _defaultTintColor = _addContactButton.tintColor;
    [self navigationItem].title = @"Contacts";
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:ADD_CONTACT]) {
        EditContactViewController * editController = [segue destinationViewController];
        
        [editController setEditorWithContact:nil andContactManager:_storage];
    }
}

- (void) tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    [self navigationItem].title = item.title;
    
    if ([item.title isEqualToString:@"Contacts"]) {
        _addContactButton.enabled = YES;
        _addContactButton.tintColor = _defaultTintColor;
    } else if ([item.title isEqualToString:@"History"]) {
        _addContactButton.enabled = NO;
        _addContactButton.tintColor = [UIColor clearColor];
    } else {
        NSLog(@"Unexpected tab bar item: %@", item.title);
        abort();
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
