//
//  PhotoManager.m
//  DiscountBank
//
//  Created by viera on 11/17/15.
//  Copyright © 2015 viera. All rights reserved.
//

#import "PhotoManager.h"
#import "TGCameraViewController.h"

@interface PhotoManager () <TGCameraDelegate>

@property (strong, nonatomic) UIImageView *photoView;

@end

@implementation PhotoManager

+ (id)sharedManager {
    static PhotoManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
        sharedMyManager.photoView = [UIImageView new];
    });
    return sharedMyManager;
}

- (void)takePhotoWithCompletetionBlock:(void (^)(BOOL success, UIImageView *image))completionBlock {
    TGCameraNavigationController *navigationController = [TGCameraNavigationController newWithCameraDelegate:self];
    UINavigationController *navController = (UINavigationController*)[UIApplication sharedApplication].keyWindow.rootViewController;
    [navController presentViewController:navigationController animated:YES completion:nil];
    
    completionBlock(YES,self.photoView);
}

#pragma mark - TGCameraDelegate optional

- (void)cameraWillTakePhoto
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)cameraDidSavePhotoAtPath:(NSURL *)assetURL
{
    // When this method is implemented, an image will be saved on the user's device
    NSLog(@"%s album path: %@", __PRETTY_FUNCTION__, assetURL);
}

- (void)cameraDidSavePhotoWithError:(NSError *)error
{
    NSLog(@"%s error: %@", __PRETTY_FUNCTION__, error);
}

#pragma mark - TGCameraDelegate required

- (void)cameraDidCancel
{
    UINavigationController *navController = (UINavigationController*)[UIApplication sharedApplication].keyWindow.rootViewController;
    [navController dismissViewControllerAnimated:YES completion:nil];
}

- (void)cameraDidTakePhoto:(UIImage *)image
{
    UINavigationController *navController = (UINavigationController*)[UIApplication sharedApplication].keyWindow.rootViewController;
    _photoView.image = image;
    [navController dismissViewControllerAnimated:YES completion:nil];
}

- (void)cameraDidSelectAlbumPhoto:(UIImage *)image
{
    UINavigationController *navController = (UINavigationController*)[UIApplication sharedApplication].keyWindow.rootViewController;
    _photoView.image = image;
    [navController dismissViewControllerAnimated:YES completion:nil];
}

@end
