//
//  Card+CoreDataProperties.h
//  
//
//  Created by viera on 11/16/15.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface Card (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *barCode;
@property (nullable, nonatomic, retain) NSString *imagePath;
@property (nullable, nonatomic, retain) NSString *storeName;
@property (nullable, nonatomic, retain) NSString *barCodeType;

@end

NS_ASSUME_NONNULL_END
