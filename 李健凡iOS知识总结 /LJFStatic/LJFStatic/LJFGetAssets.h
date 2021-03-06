//
//  LJFGetAssets.h
//  LJFPhotoFrameWork
//
//  Created by mini on 15/10/26.
//  Copyright © 2015年 mini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>


@protocol LJFGetAssetsDelegate <NSObject>

- (void)getAssetsSuccess:(NSMutableArray *)assets;

- (void)getAssetGroupsSuccess:(NSMutableArray *)AssetGroups;

- (void)getAssetsFailure:(NSError *)error;

@end

@interface LJFGetAssets : NSObject

@property (nonatomic,weak)id<LJFGetAssetsDelegate>assetsDelegate;

+ (instancetype)shareInstance;

//获取所有相册资源
- (void)getAllAblumsOfPhotos;

//获取所有的视频资源
- (void)getAllAblumsOfVideos;

//获取所有的资源
- (void)getAllAssets;

//获取对应的照片组下得所有照片
- (void)getPhotos:(ALAssetsGroup *)group with:(NSString *)ALAssetType;

//获取所有照片
- (void)getAllPhotos;

@end
