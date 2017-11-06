//
//  DisplayViewController.m
//  PhotoViewer_Step5
//
//  Created by Ahmed Elbasha on 9/16/17.
//  Copyright © 2017 Ahmed Elbasha. All rights reserved.
//

#import "DisplayViewController.h"

@interface DisplayViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *currentImage;

@end

@implementation DisplayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *image = [UIImage imageNamed:self.currentPhoto.fileName];
    [[self currentImage] setImage:image];
    
    self.title = self.currentPhoto.name;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    InfoViewController *infoVc = [segue destinationViewController];
    // Pass the selected object to the new view controller.
    infoVc.currentPhoto = self.currentPhoto;
}


@end
