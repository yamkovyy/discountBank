//
//  BarcodeScanner.m
//  DiscountBank
//
//  Created by viera on 11/16/15.
//  Copyright © 2015 viera. All rights reserved.
//

#import "BarcodeScanner.h"
#import <RSBarcodes/RSBarcodes.h>
#import "SCLAlertView.h"
#import "AddNewCardViewController.h"
#import <AudioToolbox/AudioServices.h>

#define kCustomColor [UIColor colorWithRed:142.0/255.0 green:68.0/255.0 blue:173.0/255.0 alpha:1.0]

@interface BarcodeScanner ()

@property(nonatomic, strong) NSString *barcode;
@property(nonatomic, strong) NSString *barcodeType;
@property(nonatomic, strong) SCLAlertView *alert;
@property(nonatomic) BOOL isBarcodeSelected;

@end

@implementation BarcodeScanner

+ (id)sharedScanner {
    static BarcodeScanner *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (void)show {
    RSScannerViewController *scanner = [[RSScannerViewController alloc] initWithCornerView:YES
                                                                               controlView:YES
                                                                           barcodesHandler:^(NSArray *barcodeObjects) {
                                                                               if (barcodeObjects.count && !self.alert.isVisible && self.isBarcodeSelected) {
                                                                                   
                                                                                   AVMetadataMachineReadableCodeObject *object = barcodeObjects[0];
                                                                                   self.barcode = object.stringValue;
                                                                                   
                                                                                   NSString *messageWithBarcode = [NSString stringWithFormat:@"Barcode %@ found. Proceed with it?",object.stringValue];
                                                                                   dispatch_sync(dispatch_get_main_queue(), ^{
                                                                                       self.alert = [[SCLAlertView alloc] initWithNewWindow];
                                                                                       [self.alert addButton:@"Sure" target:self selector:@selector(openAddCardView)];
                                                                                       self.alert.hideAnimationType = FadeIn;
                                                                                       self.alert.backgroundType = Transparent;
                                                                                       [self.alert showNotice:@"Wow!" subTitle:messageWithBarcode closeButtonTitle:@"Nope!" duration:0.0f];
                                                                                       AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
                                                                                   });
                                                                               }
                                                                           }
                                                                   preferredCameraPosition:AVCaptureDevicePositionBack];
    UINavigationController *navController = (UINavigationController*)[UIApplication sharedApplication].keyWindow.rootViewController;
    [navController presentViewController:scanner animated:true completion:nil];
}

- (void)openAddCardView {
    self.isBarcodeSelected = YES;
    UINavigationController *navController = (UINavigationController*)[UIApplication sharedApplication].keyWindow.rootViewController;
    [navController dismissViewControllerAnimated:YES completion:^{
        AddNewCardViewController *vc = [[AddNewCardViewController alloc] init];
        vc.data = @{@"barcode":self.barcode,@"barcodeType":self.barcodeType};
        [navController presentViewController:vc animated:YES completion:^{
                
        }];
    }];
}


@end
