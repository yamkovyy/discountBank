//
//  DataManager.m
//  DiscountBank
//
//  Created by viera on 11/16/15.
//  Copyright © 2015 viera. All rights reserved.
//

#import "DataManager.h"
#import "Card.h"
#import <MagicalRecord/MagicalRecord.h>

NSString *const SORT_KEY = @"SORT_KEY";

@interface DataManager ()

@property(nonatomic, strong) NSArray *cards;

@end

@implementation DataManager

+ (id)sharedManager {
    static DataManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
        NSString *sortKey = [[NSUserDefaults standardUserDefaults] objectForKey: SORT_KEY];
        sharedMyManager.cards = [[Card MR_findAllSortedBy: sortKey ascending: NO] mutableCopy];
    });
    return sharedMyManager;
}

- (void)saveBarCode:(NSArray*)data {
    Card *card = [Card MR_createEntity];
    card.barCode = data[0];
    card.barCodeType = data[1];
    card.storeName = data[2];
    card.imagePath = data[3];
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion: ^(BOOL success, NSError *error) {
        if (success) {
            NSLog(@"You successfully saved your context.");
        } else if (error) {
            NSLog(@"Error saving context: %@", error.description);
        }
    }];
}

- (Card*)getCardAtIndex:(NSUInteger)index {
    return self.cards[index];
}

@end
