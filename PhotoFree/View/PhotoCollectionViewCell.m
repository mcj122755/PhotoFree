//
//  PhotoCollectionViewCell.m
//  PhotoFree
//
//  Created by MCJ on 2017/12/13.
//  Copyright © 2017年 MCJ. All rights reserved.
//

#import "PhotoCollectionViewCell.h"

@interface PhotoCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation PhotoCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setPhotoModel:(PhotoModel *)photoModel{
    _photoModel = photoModel;
    UIImage *image = [UIImage imageWithData:self.photoModel.photoData];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.clipsToBounds = YES;
    self.imageView.image = image;
}
@end
