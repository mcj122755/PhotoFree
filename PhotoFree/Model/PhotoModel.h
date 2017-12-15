//
//  PhotoModel.h
//  PhotoFree
//
//  Created by MCJ on 2017/12/13.
//  Copyright © 2017年 MCJ. All rights reserved.
//

#import <Realm/Realm.h>

@interface PhotoModel : RLMObject
@property NSDate *addDate;
@property NSData *photoData;
@end
RLM_ARRAY_TYPE(PhotoModel)
