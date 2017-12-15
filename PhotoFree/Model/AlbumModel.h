//
//  AlbumModel.h
//  PhotoFree
//
//  Created by MCJ on 2017/12/13.
//  Copyright © 2017年 MCJ. All rights reserved.
//

#import <Realm/Realm.h>
#import "PhotoModel.h"

@interface AlbumModel : RLMObject
@property NSString *secretKey;
@property NSString *albumName;
@property NSString *albumPassword;
@property RLMArray<PhotoModel> *photoModels;
@end
