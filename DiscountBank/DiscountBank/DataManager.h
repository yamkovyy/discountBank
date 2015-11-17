//
//  DataManager.h
//  DiscountBank
//
//  Created by viera on 11/16/15.
//  Copyright © 2015 viera. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Card;

@interface DataManager : NSObject

+ (id)sharedManager;
- (void)saveBarCode:(NSArray*)data;
- (Card*)getCardAtIndex:(NSUInteger)index;

@end
