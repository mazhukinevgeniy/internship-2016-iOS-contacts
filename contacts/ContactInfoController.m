//
//  ViewController.m
//  contacts
//
//  Created by Admin on 01/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import "ContactInfoController.h"

@interface ContactInfoController ()

@end

@implementation ContactInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)editButtonTouched:(id)sender {
    [self performSegueWithIdentifier:@"editContact" sender:sender];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
