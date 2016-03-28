//
//  SubViewController.h
//  本地加载视频
//
//  Created by kai on 16/3/28.
//  Copyright © 2016年 K.K Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface SubViewController : UIViewController

@property (nonatomic,strong) NSString *urlString;

- (instancetype)initWithMovieName :(NSString *)urlString;

@end
