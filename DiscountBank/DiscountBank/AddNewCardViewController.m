//
//  AddNewCardViewController.m
//  DiscountBank
//
//  Created by viera on 11/17/15.
//  Copyright © 2015 viera. All rights reserved.
//

#import "AddNewCardViewController.h"
#import "PhotoManager.h"

@interface AddNewCardViewController () 

@end

@implementation AddNewCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)takePhoto:(id)sender {
    [[PhotoManager sharedManager] show];
}



@end
