//
//  PhotoCollectionViewCell.m
//  PhotoFree
//
//  Created by MCJ on 2017/12/13.
//  Copyright © 2017年 MCJ. All rights reserved.
//

#import "PhotoCollectionViewCell.h"

@interface PhotoCollectionViewCell ()
{
    CGFloat _lastScale;
}
@end

@implementation PhotoCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor blackColor];
}

- (void)setPhotoModel:(PhotoModel *)photoModel{
    _photoModel = photoModel;
    UIImage *image = [UIImage imageWithData:self.photoModel.photoData];
    self.imageView.clipsToBounds = YES;
    self.imageView.image = image;
}
- (IBAction)pinchGesture:(UIPinchGestureRecognizer *)sender {
    
    //当手指离开屏幕时,将lastscale设置为1.0
    if([sender state] == UIGestureRecognizerStateEnded) {
        _lastScale = 1.0;
        return;
    }
    
    CGFloat scale = 1.0 - (_lastScale - [(UIPinchGestureRecognizer*)sender scale]);
    CGAffineTransform currentTransform = self.imageView.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, scale, scale);
    
    [self.imageView setTransform:newTransform];
    _lastScale = [sender scale];
    
}
@end
