//
//  BarcodeScanner.h
//  DiscountBank
//
//  Created by viera on 11/16/15.
//  Copyright © 2015 viera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BarcodeScanner : NSObject

+ (id)sharedScanner;
- (void)show;

@end
