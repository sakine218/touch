//
//  ViewController.m
//  touch
//
//  Created by 西林咲音 on 2015/02/25.
//  Copyright (c) 2015年 西林咲音. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    imgArray[0] = [UIImage imageNamed:@"massu2.png"];
    imgArray[1] = [UIImage imageNamed:@"onji2.png"];
    imgArray[2] = [UIImage imageNamed:@"hazime2.png"];
    imgArray[3] = [UIImage imageNamed:@"falcon2.png"];
    UIImage *image = [UIImage imageNamed:@"IMG_3367.png"];
    [imageView setImage:image];
    traceMode = NO;
    tranceNumber = 45.0;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //if(index > 0){
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    UIImageView *imgView = [[UIImageView alloc]initWithImage:imgArray[index]];
    imgView.center = CGPointMake(location.x, location.y);
    CGFloat angle = tranceNumber * M_PI / 180.0;
    imgView.transform = CGAffineTransformMakeRotation(angle);
    //traceMode = NO;
    if (location.y > 406) {
        
    }else{
        [self.view addSubview:imgView];
    }
    
    stamps[stampNum] = imgView;
    stampNum += 1;
    //    if()
    //    {
    //        UIImage *image = [UIImage imageNamed:@"];
    //    }
    //}
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
-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)kaiten{
    tranceNumber = tranceNumber + 22.5;
    
}

-(IBAction)kaitenkaijo{
    tranceNumber = 0;
}

@end
