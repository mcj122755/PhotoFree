//
//  ShowPhotoViewController.m
//  PhotoFree
//
//  Created by MCJ on 2017/12/13.
//  Copyright © 2017年 MCJ. All rights reserved.
//

#import "ShowPhotoViewController.h"
#import "PhotoCollectionViewCell.h"

@interface ShowPhotoViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate>
@property (nonatomic, strong)AlbumModel *albumModel;
@property (nonatomic, strong)NSIndexPath *indexPath;
@property (nonatomic, strong)UICollectionView *collectionView;
@end

@implementation ShowPhotoViewController

- (instancetype)initWithAlbumModel:(AlbumModel *)albumModel indexPath:(NSIndexPath *)indexPath{
    if (self = [super init]) {
        self.albumModel = albumModel;
        self.indexPath = indexPath;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    CGFloat collectionViewX = 0;
     CGFloat collectionViewY = 20;
     CGFloat collectionViewW = [UIScreen mainScreen].bounds.size.width;
     CGFloat collectionViewH = [UIScreen mainScreen].bounds.size.height - 40;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(collectionViewX, collectionViewY, collectionViewW, collectionViewH) collectionViewLayout:flowLayout];
    _collectionView.scrollsToTop = NO;
    UINib *cellNib = [UINib nibWithNibName:@"PhotoCollectionViewCell" bundle:nil];
    [_collectionView registerNib:cellNib forCellWithReuseIdentifier:@"CollectionViewCell"];
    _collectionView.backgroundColor = [UIColor blackColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.pagingEnabled = YES;
    [self.view addSubview:_collectionView];
    [_collectionView scrollToItemAtIndexPath:_indexPath atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1 ;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.albumModel.photoModels.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    cell.photoModel = self.albumModel.photoModels[indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 100);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);//分别为上、左、下、右
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}
@end
