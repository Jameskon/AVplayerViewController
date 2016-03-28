//
//  SubViewController.m
//  本地加载视频
//
//  Created by kai on 16/3/28.
//  Copyright © 2016年 K.K Studio. All rights reserved.
//

#import "SubViewController.h"


@interface SubViewController ()

@end

@implementation SubViewController


- (instancetype)initWithMovieName :(NSString *)urlString
{
    if (self = [super init]) {
        self.urlString = urlString;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.创建一个avPlayViewController
    AVPlayerViewController *avc = [[AVPlayerViewController alloc]init];
    
    // 2.设置frame
    avc.view.frame = self.view.bounds;
    
    
    // 3.1获取本地视频地址
    //    NSString *path = [[NSBundle mainBundle]pathForResource:@"crazy.mp4" ofType:nil];
    // 4.初始化播放器
    //    avc.player = [[AVPlayer alloc]initWithURL:[NSURL fileURLWithPath:path]];
    
    //    3.获取网络视频地址
    NSURL *url = [NSURL URLWithString:self.urlString];
    
    //    4.初始化播放器
    avc.player = [[AVPlayer alloc]initWithURL:url];
    
    // 5.把avc.view加入主视图
    [self.view addSubview:avc.view];
    
    // 6.开启播放
    [avc.player play];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
