//
//  ViewController.m
//  contacts
//
//  Created by Admin on 01/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import "ContactInfoController.h"

@interface ContactInfoController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@property (weak) CDContact* contact;

@end

@implementation ContactInfoController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [_nameLabel setText:[_contact fullName]];
    [_numberLabel setText:_contact.number];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void) useContact:(CDContact*)contact {
    _contact = contact;
}

- (IBAction)editButtonTouched:(id)sender {
    [self performSegueWithIdentifier:@"editContact" sender:sender];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
