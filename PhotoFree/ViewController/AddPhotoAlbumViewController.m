//
//  AddPhotoAlbumViewController.m
//  PhotoFree
//
//  Created by MCJ on 2017/12/12.
//  Copyright © 2017年 MCJ. All rights reserved.
//

#import "AddPhotoAlbumViewController.h"
#import "MBProgressHUD+Tooltip.h"
#import "NSString+MD5.h"
#import <RLMRealm.h>
#import "AlbumModel.h"

@interface AddPhotoAlbumViewController ()
@property (weak, nonatomic) IBOutlet UITextField *photoAlbumNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *photoAlbumPasswordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordextField;
@end

@implementation AddPhotoAlbumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(savePhotoAlbum)];
}

- (void)savePhotoAlbum{
    NSString *showString = nil;
    if (![_confirmPasswordextField.text isEqualToString:_photoAlbumPasswordTextField.text]) {
        showString = @"密码不一致~~";
    }
    if (_confirmPasswordextField.text == nil || [_confirmPasswordextField.text isEqualToString: @""]) {
        showString = @"确认密码不能为空~~";
    }
    if (_photoAlbumPasswordTextField.text == nil || [_photoAlbumPasswordTextField.text isEqualToString: @""]) {
        showString = @"密码不能为空~~";
    }
    if (_photoAlbumNameTextField.text == nil || [_photoAlbumNameTextField.text isEqualToString: @""]) {
        showString = @"相册名不能为空~~";
    }
    if (showString) {
        [MBProgressHUD showSuccess:showString toView:self.view];
        return;
    }
    
//    NSArray *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *path = [docPath objectAtIndex:0];
//    NSString *filePath = [path stringByAppendingPathComponent:path];
//
    
    RLMRealm *rlmRleam = [RLMRealm defaultRealm];
//    NSString *secretKeyString = [NSString stringWithFormat:@"%@%@", _photoAlbumNameTextField.text, _photoAlbumPasswordTextField.text];
//    NSString *secretKeyMD5 = [secretKeyString md5WithString:secretKeyString];
//    NSCAssert(secretKeyString, nil);
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"albumName = %@", _photoAlbumNameTextField.text];
    RLMResults *albumModelResults = [AlbumModel objectsInRealm:rlmRleam withPredicate:predicate];
    if (albumModelResults.lastObject) {
        [MBProgressHUD showSuccess:@"相册已存在~~" toView:self.view];
        return;
    }
    
    AlbumModel *albumModel = [[AlbumModel alloc] init];
//    albumModel.secretKey = secretKeyMD5;
    albumModel.albumName = _photoAlbumNameTextField.text;
    albumModel.albumPassword = _photoAlbumPasswordTextField.text;
    albumModel.photoModels = nil;
    [rlmRleam transactionWithBlock:^{
        [rlmRleam addObject:albumModel];
    }];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
