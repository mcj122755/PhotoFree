//
//  PhotoViewController.h
//  PhotoFree
//
//  Created by MCJ on 2017/12/12.
//  Copyright © 2017年 MCJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RLMRealm.h>
#import "AlbumModel.h"

@interface PhotoViewController : UIViewController
@property (nonatomic, strong)AlbumModel *albumModel;
@end
