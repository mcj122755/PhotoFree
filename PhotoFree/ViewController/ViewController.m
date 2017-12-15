//
//  ViewController.m
//  PhotoFree
//
//  Created by MCJ on 2017/12/12.
//  Copyright © 2017年 MCJ. All rights reserved.
//

#import "ViewController.h"
#import <RLMRealm.h>
#import "AlbumModel.h"
#import "MBProgressHUD+Tooltip.h"
#import "PhotoViewController.h"
#import "AddPhotoAlbumViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *photoName;
@property (weak, nonatomic) IBOutlet UITextField *photoPassword;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"相册";
   // 指纹识别
//    [self touchID];
    

}
- (IBAction)openPhoto:(UIButton *)sender {
    RLMRealm *rlmRleam = [RLMRealm defaultRealm];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"albumName = %@ AND albumPassword = %@", _photoName.text, _photoPassword.text];
    RLMResults *albumModelResults = [AlbumModel objectsInRealm:rlmRleam withPredicate:predicate];
    if (!albumModelResults.lastObject) {
        [MBProgressHUD showError:@"相册名或密码错误~~" toView:self.view];
        return;
    }
    PhotoViewController *photoViewController = [[PhotoViewController alloc] init];
    photoViewController.albumModel = albumModelResults.lastObject;
    [self.navigationController pushViewController:photoViewController animated:YES];
}
- (IBAction)creatPhotoAlbum:(UIBarButtonItem *)sender {
    AddPhotoAlbumViewController *addPhotoAlbumViewController = [[AddPhotoAlbumViewController alloc] init];
    [self.navigationController pushViewController:addPhotoAlbumViewController animated:YES];
}
@end
