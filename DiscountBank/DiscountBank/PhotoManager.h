//
//  PhotoManager.h
//  DiscountBank
//
//  Created by viera on 11/17/15.
//  Copyright © 2015 viera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PhotoManager : NSObject

+ (id)sharedManager;
- (void)takePhotoWithCompletetionBlock:(void (^)(BOOL success, UIImageView *image))completionBlock;

@end
