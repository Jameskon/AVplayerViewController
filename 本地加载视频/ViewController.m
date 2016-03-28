//
//  ViewController.m
//  本地加载视频
//
//  Created by kai on 16/3/28.
//  Copyright © 2016年 K.K Studio. All rights reserved.
//

#import "ViewController.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import "SubViewController.h"

//#define URL @"http://10.10.5.206:8080/video/jay.mp4"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *movieNames;

@end

@implementation ViewController


- (NSMutableArray *)movieNames
{
    if (!_movieNames) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"movieNames.plist" ofType:nil];
        _movieNames = [NSMutableArray arrayWithContentsOfFile:path];
    }
    return _movieNames;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.movieNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuse = @"myCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
    }
    cell.textLabel.text = self.movieNames[indexPath.row];
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self movieNames];
    
    UITableView *table = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    table.dataSource = self;
    table.delegate = self;
    [self.view addSubview:table];
    
    
//    创建navi
    UINavigationController *navi =[[UINavigationController alloc]initWithRootViewController:self];
    
//    设置navi为rootViewController
    [UIApplication sharedApplication].delegate.window.rootViewController = navi;
    
//    设置title
    self.title = @"网络获取预告片";
    
    /*
    // 1.创建一个avPlayViewController
    AVPlayerViewController *avc = [[AVPlayerViewController alloc]init];
    
    // 2.设置frame
    avc.view.frame = self.view.bounds;
    
    
    // 3.1获取本地视频地址
//    NSString *path = [[NSBundle mainBundle]pathForResource:@"crazy.mp4" ofType:nil];
    // 4.初始化播放器
//    avc.player = [[AVPlayer alloc]initWithURL:[NSURL fileURLWithPath:path]];
    
//    3.获取网络视频地址
    NSURL *url = [NSURL URLWithString:URL];
    
//    4.初始化播放器
    avc.player = [[AVPlayer alloc]initWithURL:url];
    
    // 5.把avc.view加入主视图
    [self.view addSubview:avc.view];
    
    // 6.开启播放
    [avc.player play];

     */
     
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SubViewController *sub = [[SubViewController alloc]initWithMovieName:self.movieNames[indexPath.row]];
    [self.navigationController pushViewController:sub animated:YES];
    
}



@end
