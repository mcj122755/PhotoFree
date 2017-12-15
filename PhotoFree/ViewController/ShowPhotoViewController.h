//
//  ShowPhotoViewController.h
//  PhotoFree
//
//  Created by MCJ on 2017/12/13.
//  Copyright © 2017年 MCJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlbumModel.h"

@interface ShowPhotoViewController : UIViewController
- (instancetype)initWithAlbumModel:(AlbumModel *)albumModel indexPath:(NSIndexPath *)indexPath;
@end
