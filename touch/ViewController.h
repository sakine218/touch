//
//  ViewController.h
//  touch
//
//  Created by 西林咲音 on 2015/02/25.
//  Copyright (c) 2015年 西林咲音. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    UIImage *imgArray[4];
    IBOutlet UIImageView *imageView;
    IBOutlet UIButton *stamp1;
    IBOutlet UIButton *stamp2;
    IBOutlet UIButton *stamp3;
    IBOutlet UIButton *stamp4;
    
    int index;
    UIImageView *stamps[100];
    int stampNum;
    
    BOOL traceMode;
    float tranceNumber;
    
    IBOutlet UIImageView *stampBaseView;
}

-(IBAction)tapButton1;
-(IBAction)tapButton2;
-(IBAction)tapButton3;
-(IBAction)tapButton4;
-(IBAction)clear;
-(IBAction)back;
-(IBAction)kaiten;
-(IBAction)kaitenkaijo;
@end

