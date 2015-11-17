//
//  ViewController.m
//  DiscountBank
//
//  Created by viera on 11/2/15.
//  Copyright © 2015 viera. All rights reserved.
//

#import "ViewController.h"
#import "BarcodeScanner.h"
#import "BarCodeGeneratorViewController.h"

#define kAddCardSegueIdentefier @"addCardSegue"
#define kShowBarcodeSegueIdentefier @"showBarcodeSegue"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)scan:(id)sender {
    [[BarcodeScanner sharedScanner] show];
}

- (IBAction)addCard:(id)sender {
    [self performSegueWithIdentifier:kAddCardSegueIdentefier sender:self];
}

- (IBAction)generateBarCode:(id)sender {
    [self performSegueWithIdentifier:kShowBarcodeSegueIdentefier sender:self];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:kShowBarcodeSegueIdentefier]) {
        BarCodeGeneratorViewController *destiantionController = segue.destinationViewController;
        //TODO: change index
        destiantionController.storeIndex = 0;
    }
}

@end
