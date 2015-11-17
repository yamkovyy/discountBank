//
//  BarCodeGeneratorViewController.m
//  DiscountBank
//
//  Created by viera on 11/17/15.
//  Copyright © 2015 viera. All rights reserved.
//

#import "BarCodeGeneratorViewController.h"
#import "DataManager.h"
#import "Card.h"
#import "RSCodeGen.h"

@interface BarCodeGeneratorViewController ()

@property(strong, nonatomic) IBOutlet UIImageView *barCode;
@property(strong, nonatomic) Card *card;

@end

@implementation BarCodeGeneratorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self fetchCard];
    [self generateBarcode];
}

- (void)fetchCard {
    self.card = [[DataManager sharedManager] getCardAtIndex:self.storeIndex];
}

- (void)generateBarcode {
    self.barCode.image = [CodeGen genCodeWithContents:self.card.barCode machineReadableCodeObjectType:self.card.barCodeType];
}

@end
