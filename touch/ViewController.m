//
//  ViewController.m
//  touch
//
//  Created by 西林咲音 on 2015/02/25.
//  Copyright (c) 2015年 西林咲音. All rights reserved.
//

#import "ViewController.h"
#import "DMSideScrollView.h"
#import <CoreImage/CoreImage.h>
#import <SpriteKit/SpriteKit.h>
#import <QuartzCore/QuartzCore.h>


@interface UIViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController{
    IBOutlet UIView *sideScroller;
    NSArray *imageArray;
    NSMutableArray *imageViewArray;
    DMSideScrollView *contentScrollView;
     SKScene *skScene;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - Delegate
- (void)makeButtonsWithSize:(CGSize)size {
    
    for (int i = 0; i < imageArray.count; i++) {
        UIImageView *iv = [[UIImageView alloc] initWithImage:imageArray[i]];
        iv.frame = CGRectMake(sideScroller.bounds.origin.x + 10 + (10 * i) + (size.width * i), 10, size.width, size.height);
        iv.contentMode = UIViewContentModeScaleAspectFill;
        //iv.backgroundColor = [UIColor redColor];
        iv.userInteractionEnabled = YES;
        iv.tag = i + 1;
        iv.clipsToBounds = YES;
        [imageViewArray addObject:iv];
        [contentScrollView addSubview:iv];
    }
    
    contentScrollView.contentSize = CGSizeMake(sideScroller.bounds.origin.x + 10 + (10 * imageArray.count) + (size.width * imageArray.count), sideScroller.bounds.size.height);
    [sideScroller addSubview:contentScrollView];
}





- (void)viewDidLoad {
    [super viewDidLoad];
    
        if (!contentScrollView) {
            contentScrollView = [[DMSideScrollView alloc] initWithFrame:CGRectMake(0, 0, sideScroller.bounds.size.width, sideScroller.bounds.size.height)];
            contentScrollView.userInteractionEnabled = YES;
            contentScrollView.showsHorizontalScrollIndicator = NO;
            contentScrollView.pagingEnabled = NO;
            contentScrollView.bounces = YES;
        }
        contentScrollView.delegate = self;
    
        if (!imageViewArray) {
            imageViewArray = [NSMutableArray new];
        }
        

    UIImage *image = [UIImage imageNamed:@"IMG_3367.png"];
    [imageView setImage:image];
    
    traceMode = NO;
    tranceNumber = 45.0;

    
    imageArray = [NSArray arrayWithObjects:
                  [UIImage imageNamed:@"massu.png"],
                  [UIImage imageNamed:@"onnji.png"],
                  [UIImage imageNamed:@"hazime.png"],
                  [UIImage imageNamed:@"massu.png"],
                  [UIImage imageNamed:@"massu.png"],
                  [UIImage imageNamed:@"onnji.png"],
                  [UIImage imageNamed:@"hazime.png"],
                  [UIImage imageNamed:@"massu.png"],nil];
    
    [self makeButtonsWithSize:CGSizeMake(60, 60)];
    
    self.view.userInteractionEnabled = YES;
    imageView.userInteractionEnabled = YES;
    sideScroller.userInteractionEnabled = YES;
    stampBaseView.userInteractionEnabled = YES;
    contentScrollView.userInteractionEnabled = YES;

    //[self setSKScene];
}

- (void)setSKScene {
    skScene = [[SKScene alloc] initWithSize:CGSizeMake(sideScroller.bounds.size.width, sideScroller.bounds.size.height)];
    skScene.backgroundColor = [UIColor clearColor];
    
    SKView *skView = [[SKView alloc] initWithFrame:sideScroller.bounds];
    skView.allowsTransparency = YES;
    skView.userInteractionEnabled = YES;
    skView.backgroundColor = [UIColor clearColor];
    [skView presentScene:skScene];
    [sideScroller addSubview:skView];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //if(index > 0){
    
    NSLog(@"toucehd == %@", touches);
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:self.view];
    UIImageView *imgView = [[UIImageView alloc]initWithImage:imgArray[index]];
    imgView.center = CGPointMake(location.x, location.y);
    CGFloat angle = tranceNumber * M_PI / 180.0;
    imgView.transform = CGAffineTransformMakeRotation(angle);
    //traceMode = NO;
    if (location.y > 406) {
        //UITouch *touch = [[event allTouches] anyObject];
        if (touch.view.tag > 0) {
            UIImageView *touchImageView = imageViewArray[touch.view.tag - 1];
            [[touchImageView layer] setBorderColor:[[UIColor blackColor] CGColor]];
            [[touchImageView layer] setBorderWidth:4.0];
        }
    }else{
        [self.view addSubview:imgView];
    }
    
    stamps[stampNum] = imgView;
    stampNum += 1;

    
}


-(IBAction)tapButton1{
    index = 0;
    tranceNumber = 0;
}
-(IBAction)tapButton2{
    index = 1;
    tranceNumber = 0;
}
-(IBAction)tapButton3{
    index = 2;
    tranceNumber = 0;
}
-(IBAction)tapButton4{
    index = 3;
    tranceNumber = 0;
}
-(IBAction)back{
    if(stampNum > 0){
        stampNum -= 1 ;
        [stamps[stampNum] removeFromSuperview];
        stamps[stampNum] = nil;
    }
}

-(IBAction)clear{
    while(stampNum > 0){
        stampNum -= 1 ;
        [stamps[stampNum] removeFromSuperview];
        stamps[stampNum] = nil;
    }
}

-(IBAction)kaiten{
    tranceNumber = tranceNumber + 22.5;
    
}

-(IBAction)kaitenkaijo{
    tranceNumber = 0;
}



@end
